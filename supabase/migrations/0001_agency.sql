-- Single business database. Connect as the owner through the trusted CLI only.
create function touch_updated_at() returns trigger language plpgsql as $$ begin new.updated_at=now(); return new; end $$;
create table clients (
 id uuid primary key default gen_random_uuid(), name text not null unique check(length(trim(name))>0),
 contact text not null default '', privacy_purpose text not null default 'Client service delivery', privacy_review date,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create table people (
 id uuid primary key default gen_random_uuid(), name text not null unique check(length(trim(name))>0),
 currency text not null check(currency in ('NZD','AUD','USD','GBP','EUR','CAD')),
 cost_rate numeric(12,2) not null check(cost_rate>=0), sell_rate numeric(12,2) not null check(sell_rate>=0),
 weekly_minutes integer not null default 2400 check(weekly_minutes between 0 and 10080),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create table projects (
 id uuid primary key default gen_random_uuid(), code text not null unique, name text not null, client_id uuid not null references clients,
 owner text not null, currency text not null check(currency in ('NZD','AUD','USD','GBP','EUR','CAD')),
 kind text not null check(kind in ('fixed','time','retainer')), status text not null default 'active' check(status in ('active','closed')),
 start_on date not null, due_on date not null check(due_on>=start_on),
 fee numeric(12,2) not null default 0 check(fee>=0), budget_minutes integer not null check(budget_minutes>=0),
 evidence text not null default '', source_key text unique,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create table tasks (
 id uuid primary key default gen_random_uuid(), project_id uuid not null references projects, name text not null,
 person_id uuid not null references people, due_on date not null,
 remaining_minutes integer not null check(remaining_minutes>=0), status text not null default 'open' check(status in ('open','done')),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique(project_id,name),
 check(status <> 'done' or remaining_minutes=0)
);
create table time_entries (
 id uuid primary key default gen_random_uuid(), project_id uuid not null references projects, person_id uuid not null references people,
 worked_on date not null, minutes integer not null check(minutes between 1 and 1440), billable boolean not null,
 cost_rate numeric(12,2) not null check(cost_rate>=0), sell_rate numeric(12,2) not null check(sell_rate>=0),
 description text not null, approved_by text, billed_ref text, billed_evidence text, source_key text unique, source_hash text,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
 check(billed_ref is null or (approved_by is not null and billed_evidence is not null and billable and length(trim(billed_ref))>0 and length(trim(billed_evidence))>0))
);
create table expenses (
 id uuid primary key default gen_random_uuid(), project_id uuid not null references projects, reference text not null,
 description text not null, amount numeric(12,2) not null check(amount>=0), incurred_on date not null,
 tax_year_end date not null check(tax_year_end>=incurred_on and tax_year_end<incurred_on+interval '1 year'),
 retain_until date not null, evidence text not null default '',
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique(project_id,reference),
 check(retain_until >= (tax_year_end+interval '7 years')::date)
);
create table changes (
 id uuid primary key default gen_random_uuid(), project_id uuid not null references projects, reference text not null,
 description text not null, fee numeric(12,2) not null check(fee>=0), minutes integer not null check(minutes>=0),
 status text not null default 'pending' check(status in ('pending','approved','rejected')), requested_by text not null,
 approved_by text, evidence text not null default '',
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique(project_id,reference),
 check(status<>'approved' or (approved_by is not null and length(trim(approved_by))>0 and length(trim(evidence))>0 and lower(approved_by)<>lower(requested_by)))
);
create table allocations (
 id uuid primary key default gen_random_uuid(), project_id uuid not null references projects, person_id uuid not null references people,
 week_on date not null check(extract(isodow from week_on)=1), minutes integer not null check(minutes between 0 and 10080),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique(project_id,person_id,week_on)
);
create table leave_blocks (
 id uuid primary key default gen_random_uuid(), person_id uuid not null references people, week_on date not null check(extract(isodow from week_on)=1),
 minutes integer not null check(minutes between 0 and 10080),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique(person_id,week_on)
);
create table activity (
 id uuid primary key default gen_random_uuid(), project_id uuid not null references projects, actor text not null, note text not null,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create index projects_client_idx on projects(client_id);
create index tasks_project_idx on tasks(project_id); create index tasks_person_idx on tasks(person_id);
create index time_project_date_idx on time_entries(project_id,worked_on); create index time_person_idx on time_entries(person_id);
create index expenses_project_idx on expenses(project_id); create index changes_project_idx on changes(project_id);
create index allocations_person_week_idx on allocations(person_id,week_on);
create index leave_person_idx on leave_blocks(person_id); create index activity_project_idx on activity(project_id,created_at);

do $$ declare t text; begin
 foreach t in array array['clients','people','projects','tasks','time_entries','expenses','changes','allocations','leave_blocks','activity'] loop
 execute format('create trigger touch before update on %I for each row execute function touch_updated_at()',t);
 execute format('alter table %I enable row level security',t);
 execute format('revoke all on %I from public',t);
 end loop;
end $$;

create view project_health with (security_invoker=true) as
with tm as (select project_id,sum(minutes) minutes,round(sum(minutes*cost_rate/60),2) labor_cost,
 round(sum(case when billable and billed_ref is null and approved_by is not null then minutes*sell_rate/60 else 0 end),2) unbilled_value,
 count(*) filter(where approved_by is null) unapproved_entries,max(worked_on) last_work from time_entries group by project_id),
 ex as(select project_id,sum(amount) expense_cost from expenses group by project_id),
 ch as(select project_id,sum(fee) filter(where status='approved') approved_fee,sum(minutes) filter(where status='approved') approved_minutes,
 sum(fee) filter(where status='pending') pending_fee,count(*) filter(where status='pending') pending_changes from changes group by project_id),
 tk as(select t.project_id,sum(t.remaining_minutes) remaining_minutes,round(sum(t.remaining_minutes*p.cost_rate/60),2) remaining_cost,
 count(*) filter(where t.status='open' and t.due_on<current_date) late_tasks from tasks t join people p on p.id=t.person_id group by t.project_id)
select p.id,p.code,p.name,c.name client,p.owner,p.kind,p.status,p.currency,p.start_on,p.due_on,
 p.fee+coalesce(ch.approved_fee,0) agreed_fee,p.budget_minutes+coalesce(ch.approved_minutes,0) budget_minutes,
 coalesce(tm.minutes,0) logged_minutes,coalesce(tk.remaining_minutes,0) remaining_minutes,
 coalesce(tm.labor_cost,0) labor_cost,coalesce(ex.expense_cost,0) expense_cost,
 coalesce(tm.labor_cost,0)+coalesce(ex.expense_cost,0)+coalesce(tk.remaining_cost,0) forecast_cost,
 p.fee+coalesce(ch.approved_fee,0)-coalesce(tm.labor_cost,0)-coalesce(ex.expense_cost,0)-coalesce(tk.remaining_cost,0) forecast_contribution,
 coalesce(tm.unbilled_value,0) unbilled_value,coalesce(tm.unapproved_entries,0) unapproved_entries,
 coalesce(ch.pending_fee,0) pending_fee,coalesce(ch.pending_changes,0) pending_changes,coalesce(tk.late_tasks,0) late_tasks,tm.last_work
from projects p join clients c on c.id=p.client_id left join tm on tm.project_id=p.id left join ex on ex.project_id=p.id left join ch on ch.project_id=p.id left join tk on tk.project_id=p.id;
create view attention with (security_invoker=true) as
select code,name,currency,owner,
 concat_ws('; ',case when due_on<current_date then 'project overdue' end,
 case when forecast_contribution<0 then 'forecast exceeds agreed fee' end,
 case when logged_minutes+remaining_minutes>budget_minutes then 'hours exceed budget' end,
 case when pending_changes>0 then 'scope approval needed' end,
 case when late_tasks>0 then 'late tasks' end,
 case when coalesce(last_work,start_on)<current_date-14 then 'no recent work' end) reason
from project_health where status='active' and (due_on<current_date or forecast_contribution<0 or logged_minutes+remaining_minutes>budget_minutes or pending_changes>0 or late_tasks>0 or coalesce(last_work,start_on)<current_date-14);
create view capacity with (security_invoker=true) as
with weeks as(select date_trunc('week',current_date)::date week_on union select week_on from allocations union select week_on from leave_blocks),
a as(select person_id,week_on,sum(minutes) planned_minutes from allocations a join projects p on p.id=a.project_id where p.status='active' group by person_id,week_on)
select p.name,w.week_on,p.weekly_minutes,coalesce(l.minutes,0) leave_minutes,
 greatest(0,p.weekly_minutes-coalesce(l.minutes,0)) available_minutes,coalesce(a.planned_minutes,0) planned_minutes,
 greatest(0,p.weekly_minutes-coalesce(l.minutes,0))-coalesce(a.planned_minutes,0) free_minutes
from people p cross join weeks w left join a on a.person_id=p.id and a.week_on=w.week_on left join leave_blocks l on l.person_id=p.id and l.week_on=w.week_on;
create view compliance_findings with (security_invoker=true) as
select 'NZ-RECORD-01' rule,p.code record,'Expense has no evidence reference: '||e.reference issue from expenses e join projects p on p.id=e.project_id where e.evidence=''
union all select 'NZ-PRIVACY-09',name,'Privacy purpose or review date missing or due' from clients where privacy_purpose='' or privacy_review is null or privacy_review<current_date
union all select 'POLICY-SCOPE-01',code,'No signed scope evidence reference' from projects where status='active' and evidence=''
union all select 'POLICY-TIME-01',p.code,'Time entry needs review: '||t.id::text from time_entries t join projects p on p.id=t.project_id where t.approved_by is null;
revoke all on project_health,attention,capacity,compliance_findings from public;
