------------------------------
-- Übung 1.1.1
-- Geben Sie alle Postleitzahlen von Wien aus.
-- (alle Postleitzahlen, die mit einer 1 beginnen und als LAND_ID 43 haben.)
------------------------------

-- Ortsbezeichnung ist Wien
select plz from ort where bezeichnung = 'Wien';





-- In Österreich (landID = 43) sind Postleitzahlen 4-stellig und wiener Postleitzahlen beginnen mit 1
select plz from ort where landID = 43 and plz like '1___'; -- Oracle

select plz from ort where landID = 43 and cast(plz as varchar) like '1___'; -- PostgreSQL





-- Wiener Postleitzahlen müssen zwischen (einschließlich) 1000 und 1999 liegen
select plz from ort where landID = 43 and plz between 1000 and 1999;










------------------------------
-- Übung 1.1.2
-- Geben Sie alle Personen aus, die mit Vorname Alexander heißen 
-- und deren Nachname mit M oder N beginnen
------------------------------

-- mit like
select * from person
where vorname = 'Alexander' and (Nachname like 'M%' or nachname like 'N%'); 





-- mit Substring und Listenvergleich
select * from person
where vorname = 'Alexander' and substr(nachname,1,1) in ('M','N');





-- mit >= und <
select * from person
where vorname = 'Alexander' and nachname >= 'M' and nachname < 'O';





-- mit between
select * from person
where vorname = 'Alexander' and nachname between 'M' and 'O'; -- in diesem Fall wäre Personen mit Nachname O inkludiert








----------------------------
-- Übung 1.1.3
-- Geben Sie Vorname und Nachname als ein Attribut aus
-- (d.h. verbinden Sie die beiden Attribute mit einem Leerzeichen dazwischen)
------------------------------

-- mit || Operator
select vorname || ' ' || nachname as "Name" from person;





-- mit Concation Funktion CONCAT
select concat(concat(vorname, ' '), nachname) as "Name" from person; -- Oracle

select concat(vorname, ' ', nachname) as "Name" from person; -- PostgreSQL









------------------------------
-- Übung 1.1.4
-- Geben Sie jene Gehaltsstufen aus, in denen die Mitarbeiter die
-- mindestens 2000 maximal aber 3000 Euro verdienen. (Überlegen Sie sich 2 Lösungen!)
------------------------------

-- between
select * from gehaltsstufe
where monatsgehalt between 2000 and 3000;





-- >= und <=
select * from gehaltsstufe
where monatsgehalt >= 2000 and monatsgehalt <= 3000;










------------------------------
-- Übung 1.1.5
-- Geben Sie alle unterschiedlichen Vornamen aus (ohne Mehrfachnennungen)
------------------------------

select distinct vorname from person;










------------------------------
-- Übung 1.1.6
-- Geben Sie zu jeder GehaltsstufeID der Tabelle Gehaltsstufe anstatt 
-- des Monatsgehalts das Jahresgehalt (14 Monatsgehälter) aus. 
------------------------------

select gehaltsstufeID, monatsgehalt * 14 as "Jahresgehalt"
from gehaltsstufe;










------------------------------
-- Übung 1.1.7
-- Wie viele Abteilungen sind derzeit in der Datenbank gespeichert.
------------------------------

select count(*) as Anzahl
from abteilung;










------------------------------
-- Übung 1.1.8
-- Geben Sie jene Flugzeuge der Flugzeugtyptabelle aus, deren 
-- Sitzplatzanzahl zwischen 100 und 160 Sitzplätzen liegt und die 
-- über 10.000 km weit fliegen können.
------------------------------

select *
from flugzeugtyp
where sitzplaetze between 100 and 160 and flugstrecke_maximal > 10000;










------------------------------
-- Übung 1.1.9
-- Geben Sie jene Reisepassnummern aus, die mit 2 beginnen, 
-- auf 0 enden und wo mindestens 2x die Zahl 5 vorkommt.
------------------------------

select reisepassnr
from reisepass
where reisepassnr like '2%5%5%0';










------------------------------
-- Übung 1.1.10
-- 10.	Geben Sie alle Postleitzahlen und Ortsnamen aus. 
-- Ordnen Sie sie Ausgabe nach Ortsnamen und Postleitzahl. 
------------------------------

-- Sortierung nach Attributsnamen
select plz, bezeichnung
from ort
order by bezeichnung, plz;



-- Sortierung nach Aliasnamen
select plz postleitzahl, bezeichnung as ortsname
from ort
order by ortsname, postleitzahl;



-- Sortierung nach Positionsnummer der Attribute in der Select-Klausel
select plz, bezeichnung
from ort
order by 2, 1;
