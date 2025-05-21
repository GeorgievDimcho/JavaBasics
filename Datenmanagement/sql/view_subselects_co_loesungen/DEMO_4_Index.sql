----------------------------------------------------
-- create sequence
----------------------------------------------------
create sequence s_kid;


----------------------------------------------------
-- create table
----------------------------------------------------
create table kunden
as
select s_kid.nextval as kid, p.vorname, p.nachname, o.plz, o.bezeichnung as ort
from flughafenbase.person p, flughafenbase.ort o;


----------------------------------------------------
-- add primary key
----------------------------------------------------
alter table kunden
  add primary key (kid);


----------------------------------------------------
-- insert more rows (execute 2 times)
----------------------------------------------------
insert into kunden 
  select s_kid.nextval, 'Sonja', 'Stoop', o.plz, o.bezeichnung from flughafenbase.person p, flughafenbase.ort o;

commit;



----------------------------------------------------
-- check table kunden
----------------------------------------------------
select * from kunden;

----------------------------------------------------
-- check Anzahl Namen je Ort / Orte je Namen
----------------------------------------------------
select count(*) from kunden where ort = 'Wien';
select count(*) from kunden where ort = 'Hollabrunn';
select count(*) from kunden where nachname = 'Altmann';
select count(*) from kunden where nachname = 'Stoop';


select ort, count(nachname) from kunden where ort = 'Wien' and nachname = 'Altmann' group by ort order by 2 desc;
select ort, count(nachname) from kunden where ort = 'Hollabrunn' group by ort order by 2 desc;
select nachname, count(ort) from kunden group by nachname order by 2 desc;





----------------------------------------------------
-- check execution plan
----------------------------------------------------

-- exection: nachname = 'Altmann' and ort = 'Wien'
explain plan for
  select * 
  from kunden
  where nachname = 'Altmann'
  and ort = 'Wien';

-- show execution plan  
SELECT * FROM table(dbms_xplan.display);


-- exection: rt = 'Wien' and nachname = 'Altmann'
explain plan for
  select * 
  from kunden
  where ort = 'Wien'
  and nachname = 'Altmann';
  
-- show execution plan  
SELECT * FROM table(dbms_xplan.display);


-- exection: nachname = 'Stoop' and ort = 'Hollabrunn'
explain plan for
  select * 
  from kunden
  where nachname = 'Stoop'
  and ort = 'Hollabrunn';
  
-- show execution plan  
SELECT * FROM table(dbms_xplan.display);


-- exection: ort = 'Hollabrunn' and nachname = 'Stoop'
explain plan for
  select * 
  from kunden
  where ort = 'Hollabrunn'
  and nachname = 'Stoop';

-- show execution plan  
SELECT * FROM table(dbms_xplan.display);





----------------------------------------------------
-- create index
----------------------------------------------------
create index ind_nachname on kunden (nachname);
create index ind_ort on kunden (ort);
create index ind_name_ort on kunden (nachname, ort);
create index ind_ort_name on kunden (ort, nachname);

----------------------------------------------------
-- drop index
----------------------------------------------------
drop index ind_nachname;
drop index ind_ort;
drop index ind_name_ort;
drop index ind_ort_name;

----------------------------------------------------
-- show user indexes
----------------------------------------------------
select * from user_indexes where table_name = 'KUNDEN';





----------------------------------------------------
-- cleanup
----------------------------------------------------
drop table kunden;
drop sequence s_kid;
