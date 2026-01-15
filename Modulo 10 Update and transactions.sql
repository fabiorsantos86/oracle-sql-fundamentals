drop table bricks cascade constraints;
create table bricks (
  colour      varchar2(10),
  shape       varchar2(10),
  quantity    integer,
  unit_weight integer
);

insert into bricks values ( 'red', 'cylinder', 1, 13 );
insert into bricks values ( 'blue', 'cube', 51, 8 );
insert into bricks values ( 'green', 'cube', 600, 8 );

commit;

update bricks
set    quantity = 60;

select * from bricks;

update bricks
set    unit_weight = 21;

select unit_weight from bricks;

update bricks
set    quantity = 1422
where  colour = 'red';

select * from bricks;

update bricks
set    UNIT_WEIGHT = 5
where  shape = 'cube';

select shape, unit_weight
from   bricks;

update bricks
set    quantity = quantity - 10
where  colour = 'green'
and    shape = 'cube';

commit;

update bricks
set    quantity = quantity + 10
where  colour = 'blue'
and    shape = 'cube';

commit;

select * from bricks;

update bricks
set    quantity = 60;

declare
  pragma autonomous_transaction;
begin
  update bricks
  set    unit_weight = 55;

  commit;
end;
/

select * from bricks;

rollback;

select * from bricks
where  colour = 'red'
for    update;

select * from bricks
where  colour in ( 'red', 'blue' )
for    update;

update bricks
set    quantity = 1001
where  colour = 'red';

update bricks
set    quantity = 1722
where  colour = 'blue';

update bricks
set    quantity = 60,
       unit_weight = 13
where  colour = 'red'
and    shape  = 'cylinder';

select *
from   bricks
where  colour = 'red'
and    shape  = 'cylinder';

update bricks
set    quantity = 60,  -- original quantity
       unit_weight = 8 -- new weight
where  colour = 'red'
and    shape  = 'cylinder';

select *
from   bricks
where  colour = 'red'
and    shape  = 'cylinder';

update bricks
set    quantity = 1001, -- new quantity
       unit_weight = 13 -- original weight
where  colour = 'red'
and    shape  = 'cylinder';

select *
from   bricks
where  colour = 'red'
and    shape  = 'cylinder';

alter table bricks add ( version_number integer default 1 );

select * from bricks;

update bricks
set    quantity = 60,
       unit_weight = 8,
       version_number = version_number + 1
where  colour = 'red'
and    shape  = 'cylinder'
and    version_number = 1;

select *
from   bricks
where  colour = 'red'
and    shape  = 'cylinder';

update bricks
set    quantity = 1001,
       unit_weight = 13,
       version_number = version_number + 1
where  colour = 'red'
and    shape  = 'cylinder'
and    version_number = 1;

select *
from   bricks
where  colour = 'red'
and    shape  = 'cylinder';