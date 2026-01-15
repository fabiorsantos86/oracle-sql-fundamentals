drop table toys cascade constraints;
create table toys (
  toy_id     integer,
  toy_name   varchar2(20),
  toy_colour varchar2(10)
);

drop table bricks;
create table bricks (
  brick_id     integer,
  brick_colour varchar2(10),
  brick_shape  varchar2(10)
);

insert into toys values ( 1, 'Miss Snuggles', 'pink' ) ;
insert into toys values ( 2, 'Cuteasaurus', 'blue' ) ;
insert into toys values ( 3, 'Baby Turtle', 'green' ) ;

insert into bricks values ( 2, 'blue', 'cube' );
insert into bricks values ( 3, 'green', 'cube' );
insert into bricks values ( 4, 'blue', 'pyramid' );

commit;

select *
from   toys
cross join bricks;

select *
from   toys, bricks
where  toy_id = brick_id;

select *
from   toys
join   bricks
on     toy_colour = brick_colour;

select *
from   toys
join   bricks
on     toy_colour <> brick_colour;

select *
from   toys
join   bricks
on toy_id > brick_id;

select *from   toys
left   outer join bricks
on     toy_id = brick_id;

select *
from   toys, bricks
where  toy_id = brick_id (+);

select *
from   toys
right  join bricks
on     toy_id = brick_id;

select *
from   bricks
left   join toys
on     toy_id = brick_id;

select *
from   toys, bricks
where  toy_id (+) = brick_id;

select *
from   toys
join   bricks
on     toy_id = brick_id
where  brick_colour = 'green';

select *
from   toys
left   join bricks
on     toy_id = brick_id
where  brick_colour = 'green';

select *
from   toys, bricks
where  toy_id (+) = brick_id
and    brick_colour = 'green';

select *
from   toys
left   join bricks
on     toy_id = brick_id
and    brick_colour = 'green';

select *
from   toys, bricks
where  toy_id = brick_id (+)
and    brick_colour (+) = 'green';

select *
from   bricks
left   join toys
on brick_id = toy_id
and toy_colour = 'blue';

select *
from   toys
full   join bricks
on     toy_id = brick_id;

select *
from   toys, bricks
where  toy_id = brick_id (+)
union all
select *
from   toys, bricks
where  toy_id (+) = brick_id
and    toy_id is null;