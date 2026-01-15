drop table toys cascade constraints;
create table toys (
  toy_name varchar2(30),
  price    number(4, 2)
);

insert into toys values ('Baby Turtle', 0.01);
insert into toys values ('Miss Snuggles', 0.51);
insert into toys values ('Cuteasaurus', 10.01);
insert into toys values ('Sir Stripypants', 14.03);
insert into toys values ('Purple Ninja', 14.22);

commit;

select * from toys;

select * from toys;

delete toys where toy_name = 'Purple Ninja';

select * from toys;
rollback;

select * from toys;

truncate table toys;

select * from toys;

rollback;

select * from toys;

truncate table toys reuse storage;

alter table toys add is_deleted varchar2(1) default 'N';

update toys
set    is_deleted = 'Y'
where  toy_name = 'Cuteasaurus';

select * from toys;

select * from toys
where is_deleted = 'N';

create or replace view active_toys as
  select * from toys
  where is_deleted = 'N';

select * from active_toys;

alter table toys row archival;

update toys
set    ora_archive_state = '1'
where  toy_name = 'Baby Turtle';

select * from toys;

alter session set row archival visibility = active;

select * from toys;