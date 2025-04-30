------------------------------
-- Übung 7.2.1
-- Geben Sie jene Personen aus, die Maier oder Mayer heißen.
-- (überlegen Sie sich wie Sie das in einem Statement abbilden ohne OR Operator abbilden können).
------------------------------

-- Listenoperator IN
select * from person
where nachname in ('Maier','Mayer');





-- Listenoperator ANY, SOME
select * from person
where nachname = any ('Maier','Mayer'); -- Oracle

select * from person
where nachname = any ('{Maier,Mayer}'); -- PostgreSQL


select * from person
where nachname = some ('Maier','Mayer'); -- Oracle

select * from person
where nachname = some ('{Maier,Mayer}'); -- PostgreSQL



-- regexp_like
select * from person
where regexp_like(nachname, 'Ma(i|y)er'); -- Oracle










------------------------------
-- Übung 7.2.2
-- Geben Sie für alle Datensätze Kennzeichen und Bezeichnung aus 
-- der Tabelle Land aus, die weder Österreich (Austria) noch 
-- Deutschland sind. (2 Lösungsmöglichkeiten)
------------------------------

-- <> and !=
select kennzeichen, bezeichnung 
from land
where bezeichnung <> 'Österreich' and bezeichnung != 'Deutschland';





-- not in
select kennzeichen, bezeichnung 
from land
where kennzeichen not in ('AUT','GER');





-- <> all
select kennzeichen, bezeichnung 
from land
where kennzeichen <> all ('AUT','GER'); -- Oracle


select kennzeichen, bezeichnung 
from land
where kennzeichen <> all ('{AUT,GER}'); -- PostgreSQL










------------------------------
-- Übung 7.2.3
-- Geben Sie alle Datensätze der Tabelle gepaeck aus, wo das 
-- Gepäck die maximale Höchstlast von 20 kg überschreitet. Geben 
-- Sie zusätzlich ein Feld "Aufpreis" aus, wo für jedes Kilo 
-- Übergewicht Euro 2,5 verrechnet wird.
------------------------------

select gepaeck.*, (gewicht -20)*2.5 as "Aufpreis"
from gepaeck
where gewicht > 20;










------------------------------
-- Übung 7.2.4
-- Geben Sie eine Liste aller unterschiedlichen Nachnamen die mehrfach vorkommen, aus und die Häufigkeit ihres Vorkommens.
-- Ordnen Sie die Ausgabe nach der Häufigkeit ihres Vorkommens in absteigender Reihenfolge und Nachnamen in aufsteigender Reihenfolge.
------------------------------

select nachname, count(*) Anzahl
from person
group by nachname
having count(nachname) > 1
order by Anzahl desc, nachname asc;










------------------------------
-- Übung 7.2.5
-- Geben Sie eine Liste aller Personen aus, die vor 1980 geboren wurden und
-- sortieren Sie die Personen nach Nachname und innerhalb des Nachnamens nach Vorname
------------------------------

-- Angabe des Datums mit to_date
select vorname, nachname, geburtsdatum
from person
where geburtsdatum < to_date('01.01.1980','dd.mm.yyyy');
order by nachname, vorname desc;





-- Umwandlung des Ausgabeformats mit to_char
select vorname, nachname, geburtsdatum
from person
where to_char(geburtsdatum, 'YYYY') < 1980 -- Oracle
order by nachname, vorname;

select vorname, nachname, geburtsdatum
from person
where cast(to_char(geburtsdatum, 'YYYY') as int) < 1980 -- PostgreSQL
order by nachname, vorname;





-- Auslesen eines bestimmten Datumsteils mit extract
select vorname, nachname, geburtsdatum
from person
where extract(year from geburtsdatum) < 1980
order by nachname, vorname desc;










------------------------------
-- Übung 7.2.6
-- Geben Sie alle Personen der Tabelle Person aus, die zwischen 28.2 und 6.3 Geburtstag haben.
------------------------------

-- between
select *
from person
where to_char(geburtsdatum, 'mm.dd.') between '02.28.' and '03.06.';





-- >=, <=
select *
from person
where to_char(geburtsdatum, 'mm.dd.') >= '02.28' and to_char(geburtsdatum, 'mm.dd.') <= '03.06';










------------------------------
-- Aufgabe 7.2.7
-- Geben Sie das durchschnittliche Alter aller Personen aus.
------------------------------

select avg(trunc(months_between(sysdate,geburtsdatum)/12)) as Durchschnittsalter -- Oracle
from person;


select avg(age(now(),geburtsdatum)) as Durchschnittsalter -- PostgreSQL
from person;

select extract(year from avg(age(now(),geburtsdatum))) as Durchschnittsalter -- PostgreSQL
from person;










------------------------------
-- Aufgabe 7.2.8
-- Geben Sie eine Liste aller Personen und deren Alter zum aktuellen Zeitpunkt aus,
-- die zum Stichtag 01.01.2021 mindestens 65 Jahre waren.
-- Ordnen Sie die Ausgabe nach dem Alter in absteigender Reihenfolge.
------------------------------

-- Oracle
select vorname, nachname, trunc(months_between(sysdate, geburtsdatum)/12) "Alter"
from person
where trunc(months_between(to_date('01.01.2021', 'dd.mm.yyyy'), geburtsdatum)/12) >= 65
order by 3 desc;



-- PostgreSQL
select vorname, nachname, extract('year' from age(now(), geburtsdatum)) "Alter"
from person
where extract('year' from age(to_date('01.01.2021', 'dd.mm.yyyy'), geburtsdatum)) >= 65
order by 3 desc;
