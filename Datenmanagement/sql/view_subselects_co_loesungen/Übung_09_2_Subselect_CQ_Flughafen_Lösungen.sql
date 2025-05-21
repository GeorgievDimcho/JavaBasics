------------------------------
-- Aufgabe 5.2.1 (Flughafen)
-- Geben Sie alle Personen (Vorname, Nachname) des Flugpersonals aus, 
-- die nicht als Fluggäste eingetragen sind
-- (verschiedene Lösungsmöglichkeiten)
-- (Punkte 4)
------------------------------

-- Subselects
select vorname, nachname
from person
where personID in (select personID from flugpersonal) and
	  personID not in (select personID from passagierliste)
order by 2,1;





-- Oracle und PostgreSQL
-- Equi-Join über alle Tabellen mit Left Join auf Passagierliste
select vorname, nachname
from person pn join personal pl on pn.personID = pl.personID
			   join flugpersonal fp on pl.personid = fp.personID
			   left join passagierliste pa on fp.personID = pa.personID
where pa.personID IS NULL
order by 2,1; 





-- Equi-Join direkt von Tabelle Person auf Flugpersonal mit Left Join auf Passagierliste
select vorname, nachname
from person pn join flugpersonal fp on pn.personid = fp.personID
			   left join passagierliste pa on fp.personID = pa.personID
where pa.personID IS NULL
order by 2,1;





-- Non-Equi-Join
select distinct vorname, nachname
from person pn join flugpersonal fp on pn.personid = fp.personID
			   left join passagierliste pa on fp.personID <> pa.personID
order by 2,1; 










------------------------------
-- Aufgabe 5.2.2 (Flughafen)
-- Geben Sie eine Liste aus, die anzeigt wie oft welcher Pilot 
-- (Vor u. Nachname) mit welchem Copiloten (Vor u. Nachname) geflogen ist.
------------------------------

-- Subquery Pilot, Subquery Copilot, Join in Where (=)
select pilot.bezeichnung, pilot.vorname, pilot.nachname, copilot.bezeichnung, copilot.vorname, copilot.nachname, count(pilot.flugid) as "Anzahl"

from (select c.flugid, d.bezeichnung, p.vorname, p.nachname        --|
      from crew c, flugpersonal f, dienstrang d, person p          --|
      where c.personID = f.personID and                            --|--> Subselect Piloten
            f.personID = p.personID and                            --|
            f.dienstrangID = d.dienstrangID and                    --|
            d.bezeichnung = 'Pilot') pilot,                        --|
	
     (select c.flugid, d.bezeichnung, p.vorname, p.nachname        --|
      from crew c, flugpersonal f, dienstrang d, person p          --|
      where c.personID = f.personID and                            --|--> Subselect Co-Piloten
            f.personID = p.personID and                            --|
            f.dienstrangID = d.dienstrangID and                    --|
            d.bezeichnung = 'Co-Pilot') copilot                    --|

where pilot.flugID = copilot.flugID --> Inner join in Where

group by pilot.bezeichnung, pilot.vorname, pilot.nachname, copilot.bezeichnung, copilot.vorname, copilot.nachname;



-- Subquery Pilot, Subquery Copilot, Join in From (Join on)
select pilot.bezeichnung, pilot.vorname, pilot.nachname, copilot.bezeichnung, copilot.vorname, copilot.nachname, count(pilot.flugid) as "Anzahl"

from (select c.flugid, d.bezeichnung, p.vorname, p.nachname        --|
      from crew c, flugpersonal f, dienstrang d, person p          --|
      where c.personID = f.personID and                            --|--> Subselect Piloten
            f.personID = p.personID and                            --|
            f.dienstrangID = d.dienstrangID and                    --|
            d.bezeichnung = 'Pilot') pilot                         --|

      join                                                         --> Join in From
	  
	  (select c.flugid, d.bezeichnung, p.vorname, p.nachname       --|
       from crew c, flugpersonal f, dienstrang d, person p         --|
       where c.personID = f.personID and                           --|--> Subselect Co-Piloten
             f.personID = p.personID and                           --|
             f.dienstrangID = d.dienstrangID and                   --|
             d.bezeichnung = 'Co-Pilot') copilot                   --|

      on pilot.flugID = copilot.flugID

group by pilot.bezeichnung, pilot.vorname, pilot.nachname, copilot.bezeichnung, copilot.vorname, copilot.nachname;



-- Join in From (Join on) auch in Subqueries
select pilot.bezeichnung, pilot.vorname, pilot.nachname, copilot.bezeichnung, copilot.vorname, copilot.nachname, count(pilot.flugid) as "Anzahl"

from (select c.flugid, d.bezeichnung, p.vorname, p.nachname               --|
      from crew c join flugpersonal f on c.personID = f.personID          --|
                  join dienstrang d on f.dienstrangID = d.dienstrangID    --|--> Subselect Piloten
                  join person p on f.personID = p.personID                --|
      where d.bezeichnung = 'Pilot') pilot                                --|

      join 
	  
	  (select c.flugid, d.bezeichnung, p.vorname, p.nachname              --|
       from crew c join flugpersonal f on c.personID = f.personID         --|
                   join dienstrang d on f.dienstrangID = d.dienstrangID   --|--> Subselect Co-Piloten
                   join person p on f.personID = p.personID               --|
       where d.bezeichnung = 'Co-Pilot') copilot                          --|

      on pilot.flugID = copilot.flugID

group by pilot.bezeichnung, pilot.vorname, pilot.nachname, copilot.bezeichnung, copilot.vorname, copilot.nachname;










------------------------------
-- Aufgabe 5.2.3 (Flughafen)
-- Geben Sie die Vornamen und Nachnamen aller jener Personen aus, die sowohl vom 
-- Flughafen Madrid (Madrid Borajas) als auch vom Flughafen Amsterdam (Amsterdam Flughafen Schipol) gestartet sind.
-- (3 verschiedene Möglichkeiten)
-- (Punkte 8)
------------------------------

-- Mengenabfrage (Intersection): Menge aller Personen mit Flügen von Amsterdam,
-- die sich mit der Menge der Personen mit Flügen von Madrid überschneidet.
SELECT personID, vorname, nachname
FROM person JOIN passagierliste USING (personid)
			JOIN flug USING (flugid)
			JOIN flughafen ON flughafen_abflug = flughafenid
WHERE bezeichnung = 'Amsterdam Flughafen Schipol'

INTERSECT

SELECT personID, vorname, nachname
FROM person JOIN passagierliste USING (personid)
			JOIN flug USING (flugid)
			JOIN flughafen ON flughafen_abflug = flughafenid
WHERE bezeichnung = 'Madrid Borajas';





-- Subselect: alle Personen mit Fügen von Amsterdam und einer PersonID aus Flügen von Madrid
SELECT personID, vorname, nachname
FROM person JOIN passagierliste USING (personid)
			JOIN flug USING (flugid)
			JOIN flughafen ON flughafen_abflug = flughafenid
WHERE bezeichnung = 'Amsterdam Flughafen Schipol' AND
	  personid IN (SELECT personid
                   FROM person JOIN passagierliste USING (personid)
							   JOIN flug USING (flugid)
							   JOIN flughafen ON flughafen_abflug = flughafenid
                   WHERE bezeichnung = 'Madrid Borajas');




				   
-- Listenoberator, Group by und Having: alle PersonenIDs und Flughafenbezeichungen (Amsterdam oder Madrid) ohne doppelte Einträge
-- gruppiert nach vorname, nachname mit Anzahl der Bezeichungen = 2 in Having Klausel
SELECT DISTINCT personID, vorname, nachname
FROM person JOIN passagierliste USING (personID)
			JOIN flug USING (flugID)
			JOIN flughafen ON flughafen_abflug = flughafenID
WHERE bezeichnung IN ('Amsterdam Flughafen Schipol','Madrid Borajas')
GROUP BY personID, vorname, nachname
HAVING COUNT(personid) = 2;











------------------------------
-- Aufgabe 5.2.4 (Flughafen)
-- Fügen Sie einen neuen Flug mit der Flugnummer "OS1469"  und einer um 1,5 Stunden späteren Abflugzeit 
-- als der Flug "OS1467" (flugID 1) in die Datenbank ein.
-- Der die übrigen Daten des neuen Flugs sollen die gleichen Werte haben, wie Flug "OS1467" (flugID 1).
-- Buchen Sie anschließend Frau Sabine Kroll (personID 19) und ihr Gepäck von Flug "OS1467" auf den neuen Flug "OS1469" um. 
-- Der Sitzplatz bleibt unverändert.
-- (Punkte 10)
------------------------------

-- Oracle - insert flug
insert into flug (flugID, flugzeugID, gateID, flughafen_abflug, flughafen_destination, abflugzeit, flugnummer, dauer)
	select (select max(flugID) + 1 from flug), flugzeugID, gateID, flughafen_abflug, flughafen_destination, abflugzeit + 3/48, 'OS1469', dauer
	from flug
	where flugnummer = 'OS1467';


-- PostgreSQL - insert flug
insert into flug (flugID, flugzeugID, gateID, flughafen_abflug, flughafen_destination, abflugzeit, flugnummer, dauer)
	select (select max(flugID) + 1 from flug), flugzeugID, gateID, flughafen_abflug, flughafen_destination, abflugzeit + interval '90 minute', 'OS1469', dauer
	from flug
	where flugnummer = 'OS1467';
	




-- Oracle und PostgreSQL - neuen Eintrag in Passagierliste hinzufügen (Update nicht möglich, da Constraint Violation durch Gepäck)
insert into passagierliste 
	select (select max(flugID) from flug), personID, sitzplatznummer
	from passagierliste
	where flugID = (select flugID from flug where flugnummer = 'OS1467') and 
				personID = (select personID from person where nachname = 'Kroll' and vorname = 'Sabine');
	

-- Oracle und PostgreSQL - neuen Eintrag in Passagierliste hinzufügen mit Subselect für personID mit zusammengesetztem Namen
insert into passagierliste 
	select (select max(flugID) from flug), personID, sitzplatznummer
	from passagierliste
	where flugID = (select flugID from flug where flugnummer = 'OS1467') and 
	      personID = (select personID from person where vorname||nachname = 'Sabine'||'Kroll');
	




-- Oracle und PostgreSQL -- Gepäck auf neuen Flug umbuchen mit Subselect für personID mit zusammengesetztem Namen
update gepaeck
	set flugID = (select max(flugID) from flug)
	where flugID = (select flugID from flug where flugnummer = 'OS1467') and 
	      personID = (select personID from person where vorname||nachname = 'Sabine'||'Kroll');





-- Oracle und PostgreSQL -- alte Buchung löschen
delete from passagierliste
	where flugID = (select flugID from flug where flugnummer = 'OS1467') and 
	      personID = (select personID from person where vorname||nachname = 'Sabine'||'Kroll');





-- Einträge prüfen
select * from flug where flugnummer in ('OS1467','OS1469');
select * from passagierliste where personid = (select personID from person where vorname||nachname = 'Sabine'||'Kroll');
select * from gepaeck where flugid in ((select flugID from flug where flugnummer = 'OS1467'), 
                                       (select max(flugID) from flug)) and 
                            personid = (select personID from person where vorname||nachname = 'Sabine'||'Kroll');;


-- commit; -- zum Bestätigen der Transaktion
rollback; -- um die Transaktion rückgängig zu machen


