create table toys (
  toy_name varchar2(100),
  weight   number
);

select * from toys;

select table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
from   user_tables;

create table bricks ( colour varchar2(10),
                      shape varchar2(10));

select table_name 
from   user_tables
where  table_name = 'BRICKS';   

create table toys_heap (
  toy_name varchar2(100)
) organization heap;

select table_name, iot_name, iot_type, external,
       partitioned, temporary, cluster_name
from   user_tables
where  table_name = 'TOYS_HEAP';

create table toys_iot (
  toy_id   integer primary key,
  toy_name varchar2(100)
) organization index;

select table_name, iot_type
from   user_tables
where  table_name = 'TOYS_IOT';

create table bricks_iot (
  bricks_id integer primary key
) organization index;

select table_name, iot_type
from   user_tables
where  table_name = 'BRICKS_IOT';

create or replace directory toy_dir as '/path/to/file';

create table toys_ext (
  toy_name varchar2(100)
) organization external (
  default directory tmp
  location ('toys.csv')
);

create global temporary table toys_gtt (
  toy_name varchar2(100)
);

create private temporary table ora$ptt_toys (
  toy_name varchar2(100)
);

select table_name, temporary
from   user_tables
where  table_name in ( 'TOYS_GTT', 'ORA$PTT_TOYS' );

create table toys_range (
  toy_name varchar2(100)
) partition by range ( toy_name ) (
  partition p0 values less than ('b'),
  partition p1 values less than ('c')
);

create table toys_list (
  toy_name varchar2(100)
) partition by list ( toy_name ) (
  partition p0 values ('Sir Stripypants'),
  partition p1 values ('Miss Snuggles')
);

create table toys_hash (
  toy_name varchar2(100)
) partition by hash ( toy_name ) partitions 4;

create table toys_part_iot (
  toy_id integer primary key,
  toy_name varchar2(100)
) organization index
partition by hash ( toy_id ) partitions 4;

select table_name, partitioned
from   user_tables
where  table_name in ( 'TOYS_HASH', 'TOYS_LIST', 'TOYS_RANGE', 'TOYS_PART_IOT' );

select table_name, partition_name
from   user_tab_partitions;

create table bricks_hash (
  brick_id integer
) partition by hash (brick_id) partitions 8;

select table_name, partitioned
from   user_tables
where  table_name = 'BRICKS_HASH';

create cluster toy_cluster (
  toy_name varchar2(100)
);

create table toys_cluster_tab (
  toy_name varchar2(100)
) cluster toy_cluster ( toy_name );

create table toy_owners_cluster_tab (
  owner varchar2(20),
  toy_name varchar2(100)
) cluster toy_cluster ( toy_name );

select cluster_name from user_clusters;

select table_name, cluster_name
from   user_tables
where  table_name in ( 'TOYS_CLUSTER_TAB', 'TOY_OWNERS_CLUSTER_TAB' );

select table_name
from   user_tables
where  table_name = 'TOYS_HEAP';

drop table toys_heap;

select table_name
from   user_tables
where  table_name = 'TOYS_HEAP';

drop table toys;

select table_name
from   user_tables
where  table_name = 'TOYS';