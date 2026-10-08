insert into clients(id,name,contact,privacy_purpose,privacy_review) values
 ('10000000-0000-0000-0000-000000000001','Kauri Foods','Morgan','Client delivery and billing',current_date-10),
 ('10000000-0000-0000-0000-000000000002','Harbour Arts','Riley','Client delivery and billing',current_date+180)
on conflict do nothing;
insert into people(id,name,currency,cost_rate,sell_rate,weekly_minutes) values
 ('20000000-0000-0000-0000-000000000001','Alex Chen','NZD',90,180,2400),
 ('20000000-0000-0000-0000-000000000002','Alex Morgan','NZD',75,150,1800),
 ('20000000-0000-0000-0000-000000000003','Taylor Singh','AUD',100,210,2400)
on conflict do nothing;
insert into projects(id,code,name,client_id,owner,currency,kind,start_on,due_on,fee,budget_minutes,evidence) values
 ('30000000-0000-0000-0000-000000000001','KAU-01','Kauri launch','10000000-0000-0000-0000-000000000001','Casey','NZD','fixed',current_date-60,current_date-3,5000,2400,'archive://demo/kauri-scope'),
 ('30000000-0000-0000-0000-000000000002','HAR-01','Harbour monthly retainer','10000000-0000-0000-0000-000000000002','Blair','NZD','retainer',date_trunc('month',current_date)::date,(date_trunc('month',current_date)+interval '1 month - 1 day')::date,3000,1200,''),
 ('30000000-0000-0000-0000-000000000003','HAR-02','Harbour discovery','10000000-0000-0000-0000-000000000002','Casey','AUD','time',current_date-40,current_date+21,9000,3000,'archive://demo/discovery')
on conflict do nothing;
insert into tasks(id,project_id,name,person_id,due_on,remaining_minutes) values
 ('40000000-0000-0000-0000-000000000001','30000000-0000-0000-0000-000000000001','Final artwork','20000000-0000-0000-0000-000000000001',current_date-5,1800),
 ('40000000-0000-0000-0000-000000000002','30000000-0000-0000-0000-000000000002','Monthly report','20000000-0000-0000-0000-000000000002',current_date+3,120),
 ('40000000-0000-0000-0000-000000000003','30000000-0000-0000-0000-000000000003','Discovery notes','20000000-0000-0000-0000-000000000003',current_date+10,600)
on conflict do nothing;
insert into time_entries(id,project_id,person_id,worked_on,minutes,billable,cost_rate,sell_rate,description,approved_by) values
 ('50000000-0000-0000-0000-000000000001','30000000-0000-0000-0000-000000000001','20000000-0000-0000-0000-000000000001',current_date-7,1200,true,90,180,'Launch concepts','Casey'),
 ('50000000-0000-0000-0000-000000000002','30000000-0000-0000-0000-000000000001','20000000-0000-0000-0000-000000000002',current_date-6,600,false,75,150,'Unplanned rework',null),
 ('50000000-0000-0000-0000-000000000003','30000000-0000-0000-0000-000000000002','20000000-0000-0000-0000-000000000002',date_trunc('month',current_date)::date,1320,true,75,150,'Retainer delivery','Blair'),
 ('50000000-0000-0000-0000-000000000004','30000000-0000-0000-0000-000000000003','20000000-0000-0000-0000-000000000003',current_date-25,120,true,100,210,'Discovery call','Casey')
on conflict do nothing;
insert into expenses(id,project_id,reference,description,amount,incurred_on,tax_year_end,retain_until,evidence) values
 ('60000000-0000-0000-0000-000000000001','30000000-0000-0000-0000-000000000001','PHOTO-1','Photographer',900,current_date,current_date+30,(current_date+interval '8 years')::date,'') on conflict do nothing;
insert into changes(id,project_id,reference,description,fee,minutes,requested_by) values
 ('70000000-0000-0000-0000-000000000001','30000000-0000-0000-0000-000000000001','SOCIAL-1','Extra social formats',1200,600,'Casey') on conflict do nothing;
insert into allocations(id,project_id,person_id,week_on,minutes) values
 ('80000000-0000-0000-0000-000000000001','30000000-0000-0000-0000-000000000001','20000000-0000-0000-0000-000000000001',date_trunc('week',current_date)::date,2100),
 ('80000000-0000-0000-0000-000000000002','30000000-0000-0000-0000-000000000002','20000000-0000-0000-0000-000000000001',date_trunc('week',current_date)::date,600)
on conflict do nothing;
insert into leave_blocks(id,person_id,week_on,minutes) values
 ('90000000-0000-0000-0000-000000000001','20000000-0000-0000-0000-000000000001',date_trunc('week',current_date)::date,480) on conflict do nothing;
insert into activity(id,project_id,actor,note,created_at) values
 ('a0000000-0000-0000-0000-000000000001','30000000-0000-0000-0000-000000000001','Casey','Waiting for written approval on extra formats',now()-interval '16 days') on conflict do nothing;
