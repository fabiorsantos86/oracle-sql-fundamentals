drop table toys cascade constraints;
drop table bricks cascade constraints;

create table toys (
  toy_id   integer,
  toy_name varchar2(100),
  colour   varchar2(10)
);

create table bricks (
  brick_id integer,
  colour   varchar2(10),
  shape    varchar2(10)
);

select * from toys;

select * from bricks;

select table_name, column_name, data_type
from   user_tab_columns
where  table_name in ( 'TOYS', 'BRICKS' )
order  by table_name, column_id;

insert into toys values ( 1, 'Miss Snuggles', 'pink' );

select * from toys;

insert into toys values ( 2, 'Baby Turtle' );

insert into toys ( toy_id, toy_name ) values ( 2, 'Baby Turtle' );

select * from toys;

insert into toys (toy_id, colour) values ( 3, 'red' );

select * from toys
where  toy_id = 3;

select * from toys;

insert into bricks ( brick_id )
select toy_id
from   toys;

select * from bricks;

declare
  start_time   pls_integer;
  insert_count pls_integer := 50000;
begin
  start_time := dbms_utility.get_time ();

  for i in 1 .. insert_count loop
    insert into bricks
    values ( i, 'red', 'cube' );
  end loop;

  dbms_output.put_line ( 'Single-row duration = ' || ( dbms_utility.get_time () - start_time) );
  rollback;
  start_time := dbms_utility.get_time ();

  insert into bricks
    select level, 'red', 'cube' from dual
    connect by level <= insert_count;

  dbms_output.put_line ( 'Multi-row duration = ' || ( dbms_utility.get_time () - start_time) );

  rollback;
end;
/

insert into toys ( toy_id, colour ) values ( 4, 'blue' );
insert into toys ( toy_id, colour ) values ( 5, 'green' );

insert into bricks (brick_id, colour)
  select toy_id, colour
  from   toys
  where  toy_id in ( 4, 5 );

select * from bricks
where  brick_id in ( 4, 5 );

insert into toys ( toy_id, toy_name, colour )
values ( 6, 'Green Rabbit', 'green' );

commit;

select *
from   toys
where  toy_id = 6;

insert into toys ( toy_id, toy_name, colour )
values ( 7, 'Pink Rabbit', 'pink' );

select * from toys
where  toy_id = 7;

rollback;

select * from toys
where  toy_id = 7;

insert into toys ( toy_id, toy_name, colour )
values ( 8, 'Pink Rabbit', 'pink' );

exec savepoint after_six;

insert into toys ( toy_id, toy_name, colour )
values ( 9, 'Purple Ninja', 'purple' );

select * from toys
where  toy_id in ( 8, 9 );

rollback to savepoint after_six;

select * from toys
where  toy_id in ( 8, 9 );

rollback;

select * from toys
where  toy_id in ( 8, 9 );

insert into toys ( toy_id, toy_name, colour )
values ( 8, 'Red Rabbit', 'red' );

commit;

insert into toys ( toy_id, toy_name, colour )
values ( 9, 'Purple Ninja', 'purple' );

exec savepoint first_sp;

insert into toys ( toy_id, toy_name, colour )
values ( 10, 'Blue Dinosaur', 'blue' );

rollback to savepoint first_sp;

select * from toys
where  toy_id in ( 8, 9, 10 );

rollback;

select * from toys
where  toy_id in ( 8, 9, 10 );

insert all
  into bricks ( brick_id ) values ( id )
  into bricks ( brick_id ) values ( id )
  into toys ( toy_id ) values ( id )
select 0 id from dual;

select * from toys
where  toy_id = 0;

select * from bricks
where  brick_id = 0;

insert into toys ( toy_id, toy_name, colour )
values ( 11, 'Cuteasaurus', 'blue' );
insert into toys ( toy_id, toy_name, colour )
values ( 12, 'Sir Stripypants', 'blue' );
insert into toys ( toy_id, toy_name, colour )
values ( 13, 'White Rabbit', 'white' );

exec savepoint post_toys;

insert all
  when colour = 'blue' then
    into bricks ( brick_id, colour )
    values ( toy_id, colour )
  when toy_name = 'Cuteasaurus' then
    into bricks ( brick_id, colour )
    values ( toy_id, colour )
  else
    into bricks ( brick_id, colour )
    values ( toy_id, colour )
select * from toys
where  toy_id >= 11;

select * from bricks
where  brick_id >= 11;

rollback to savepoint post_toys;

insert first
  when colour = 'blue' then
    into bricks ( brick_id, colour )
    values ( toy_id, colour )
  when toy_name = 'Cuteasaurus' then
    into bricks ( brick_id, colour )
    values ( toy_id, colour )
  else
    into bricks ( brick_id, colour )
    values ( toy_id, colour )
select * from toys
where  toy_id >= 11;

select * from bricks
where  brick_id >= 11;

rollback;