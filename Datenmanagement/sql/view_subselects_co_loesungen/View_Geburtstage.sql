/*
Erstellen Sie eine View, die alle Personen ausgibt, die heute Geburtstag haben.
*/



-- Create View Geburtstage
create or replace view geburtstage 
  as select vorname, nachname 
  from person 
  where geburtsdatum = trunc(sysdate)
  order by 2;

-- Check View
select * from geburtstage;

-- ein Person hinzufügen, die heute Geburtstag hat
insert into person values (999, 'Carina', 'Maier', trunc(sysdate));
insert into person values (998, 'Sonja', 'Huber', trunc(sysdate));
insert into person values (997, 'Felix', 'Steiner', trunc(sysdate));


-- Check View
select * from geburtstage;


--Cleanup
delete from person where personid in (999, 998, 997);
drop view geburtstage;
