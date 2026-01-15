drop table toys;
create table toys (
  toy_name varchar2(100),
  colour   varchar2(10),
  price    number(10, 2)
);

insert into toys values ( 'Sir Stripypants', 'red', 0.01 );
insert into toys values ( 'Miss Smelly_bottom', 'blue', 6.00 );
insert into toys values ( 'Cuteasaurus', 'blue', 17.22 );
insert into toys values ( 'Mr Bunnykins', 'red', 14.22 );
insert into toys values ( 'Baby Turtle', 'green', null );

commit;

select * from toys;

select toy_name, price from toys;

select price, colourselect *
from toys
where (toy_name = 'Sir Stripypants'  or colour = 'blue')
and price = 6.00;
from   toys;

select * from toys
where  toy_name = 'Sir Stripypants';

select * from toys
where  colour = 'red';

select * from toys
where  toy_name = 'Sir Stripypants'
and    colour = 'green';

select * from toys
where  toy_name = 'Sir Stripypants' or
colour = 'green';

select * from toys
where  toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle'
and    colour = 'green';

select * from toys
where  colour = 'green'
and    toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle';

select * from toys
where  ( toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle' )
and    colour = 'green';

select * from toys
where  colour = 'green'
and    ( toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle' );

select * from toys
where  colour in ( 'red' , 'green' );

select * from toys
where  price < 10;

select * from toys
where  price >= 6;

select * from toys
where  price between 6 and 20;

select * 
from toys 
where colour in ('red','blue')
and price >= 6
and price < 14.22;

select * from toys
where  toy_name like '%_%' escape '';

select * from toys
where  toy_name like '%#_%' escape '#';

select toy_name
from   toys
where  toy_name like '%B%';

select toy_name
from   toys
where  colour != 'green'
and price != 6;