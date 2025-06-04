/*###########################
## Views (Flughafen)
###########################*/

/*------------------------
9.3.1 Piloten View (Flughafen)
Erstellen Sie eine View piloten, welche Vorname, Nachname, Geburtsdatum und Alter
aller Piloten (nicht Co-Piloten und Chefpiloten) anzeigt. 
------------------------*/

create or replace view piloten
as
	select vorname, nachname, 
	       to_char(geburtsdatum, 'yyyy-mm-dd') as GEBURTSDATUM,
	       trunc(months_between(sysdate, geburtsdatum)/12) "ALTER"
	from person join flugpersonal using (personid)
							join dienstrang using (dienstrangid)
	where bezeichnung = 'Pilot'
	order by nachname, vorname;


-- Select view	
select * from piloten;





/*-------------------------
9.3.2 Personal View (Flughafen)
Erstellen Sie eine View “Personal_view”, welche für jedes Mitglied aus dem
Personal (personID, Vorname, Nachname, monatliches Gehalt) den Rang
(Bezeichnung) im Falle von Flugpersonal bzw. den Abteilungsnamen
(Bezeichnung) im Falle von Bodenpersonal angibt.
-------------------------*/

create or replace view personal_view
as
	select personid, vorname, nachname, monatsgehalt, coalesce(dienstrang.bezeichnung, abteilung.bezeichnung) as bezeichnung
	from person join personal using (personid)
							join gehaltsstufe using (gehaltsstufeid)
							left join flugpersonal using (personid)
							left join dienstrang using (dienstrangid)
							left join bodenpersonal using (personid)
							left join abteilung using (abteilungsid);


-- Select view
select * from personal_view;





-- Lösung mit tempTable und UNION
create or replace view personal_view2
as
	with personaldaten as (
										select personid, vorname, nachname, monatsgehalt, dienstrang.bezeichnung as dienstrang, abteilung.bezeichnung as abteilung
										from person join personal using (personid)
																join gehaltsstufe using (gehaltsstufeid)
																left join flugpersonal using (personid)
																left join dienstrang using (dienstrangid)
																left join bodenpersonal using (personid)
																left join abteilung using (abteilungsid))  	

	select personid, vorname, nachname, monatsgehalt, dienstrang bezeichnung from personaldaten where dienstrang is not null
	union
	select personid, vorname, nachname, monatsgehalt, abteilung from personaldaten where abteilung is not null
	union
	select personid, vorname, nachname, monatsgehalt, null from personaldaten where dienstrang is null and abteilung is null;
	

-- Select view
select * from personal_view2;





/*--------------------------------
9.3.3 DML on Personal View (Flughafen)
Versuchen Sie auf der View “Personal_view” zu selecten, inserten,
updaten, deleten. Protokollieren Sie, was passiert.
--------------------------------*/

-- select
select * from personal_view; -- no problem
select * from personal_view2; -- no problem


-- insert
insert into personal_view values (999, 'Martin', 'Docsek', 4429.32, 'Pilot'); -- ORA-01776: cannot modify more than one base table through a join view
insert into personal_view2 values (999, 'Martin', 'Docsek', 4429.32, 'Pilot'); -- ORA-01732: data manipulation operation not legal on this view


-- delete
delete from personal_view where personid = 1; -- ORA-02292: integrity constraint (SYS_C00871894) violated - child record found
delete from personal_view2 where personid = 1; -- ORA-01732: data manipulation operation not legal on this view


-- update nachname
update personal_view set nachname = 'Hai' where personid = 1; -- works
update personal_view2 set nachname = 'Wahl' where personid = 1; -- ORA-01732: data manipulation operation not legal on this view

-- update dienstrang
update personal_view set bezeichnung = 'Pilot' where personid = 1; -- ORA-01733: virtual column not allowed here
update personal_view2 set bezeichnung = 'Pilot' where personid = 1; -- ORA-01732: data manipulation operation not legal on this view

-- update monatsgehalt
update personal_view set monatsgehalt = 5000.00 where personid = 1; -- ORA-01779: cannot modify a column which maps to a non key-preserved table
update personal_view2 set monatsgehalt = 5000.00 where personid = 1; -- ORA-01732: data manipulation operation not legal on this view

select * from personal_view;




