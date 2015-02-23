---#
---#	GpuHashJoin Closed Issue (Remapping of variable) Test Cases
---#    #109, ...
---#

-- any join plan to off
set enable_hashjoin to off;
set enable_mergejoin to off;
set enable_nestloop to off;
-- any scan plan to off
set enable_indexscan to off;
set enable_bitmapscan to off;
set enable_seqscan to off;

set client_min_messages to warning;

-- #109
drop table if exists i109;
create table i109 as select generate_series(1,1000)::integer  id, 'c1'::text as c1, 'c2'::text as c2;
-- explain select b.c1,a.c2 from i109 as a inner join i109 as b on a.id=b.id limit 1;
select b.c1,a.c2 from i109 as a inner join i109 as b on a.id=b.id limit 1;

