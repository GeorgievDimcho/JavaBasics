------------------------------
-- Übung 7.2.1 (Toprast)
-- Wie viele Adressen gibt es in der Toprast Datenbank?
------------------------------

Select count(*) Anzahl from adressen;










------------------------------
-- Übung 7.2.2 (Toprast)
-- Geben Sie eine Liste aller unterschiedlichen Ortsnamen aus.
-- Ordnen Sie in aufsteigender Reihenfolge.
------------------------------

Select distinct ort from orte
order by ort;










------------------------------
-- Übung 7.2.3 (Toprast)
-- Wie viele unterschiedliche Nachnamen gibt es in der Datenbank.
------------------------------

Select count(distinct nachname) from personen;










------------------------------
-- Übung 7.2.4 (Toprast)
-- Geben Sie alle geschlossenen Filialen aus.
------------------------------

Select * from filialen
where geschlossen = 1;










------------------------------
-- Übung 7.2.5 (Toprast)
-- Geben Sie alle Rechnungen aus, die anonym ausgestellt wurden.
------------------------------

Select * from rechnungen
where fk_kunden_pers_id is null;











------------------------------
-- Übung 7.2.6 (Toprast)
-- Wie viele Rechnungen sind Kunden zugeordnet?
------------------------------

-- Filter in Where Klausel
Select count(*) anzahl from rechnungen
where fk_kunden_pers_id is not null;



-- nur KundenIDs zählen
select count(fk_kunden_pers_id) anzahl from rechnungen;










------------------------------
-- Übung 7.2.7 (Toprast)
-- Geben Sie jene Personen aus, die Maier oder Mayer heißen.
-- (überlegen Sie sich wie Sie das in einem Statement abbilden ohne OR Operator abbilden können).
------------------------------

-- Listenoperator IN
select * from personen
where nachname in ('Maier','Mayer');



-- Listenoperator ANY, SOME
select * from personen
where nachname = any ('Maier','Mayer'); -- Oracle

select * from personen
where nachname = any ('{Maier,Mayer}'); -- PostgreSQL



select * from personen
where nachname = some ('Maier','Mayer'); -- Oracle

select * from personen
where nachname = some ('{Maier,Mayer}'); -- PostgreSQL



-- regexp_like
select * from personen
where regexp_like(nachname, 'Ma(i|y)er'); -- Oracle










------------------------------
-- Übung 7.2.8 (Toprast)
-- Wann wurde die älteste Rechnung ausgestellt?
------------------------------

select min(datum) from rechnungen;










------------------------------
-- Übung 7.2.9 (Toprast)
-- Geben Sie eine Liste aller Nachname aus und die Häufigkeit ihres Vorkommens
-- Ordnen Sie absteigend nach der Häufigkeit.
------------------------------

select nachname, count(nachname) anzahl
from personen
group by nachname
order by 2 desc;










------------------------------
-- Übung 7.2.10 (Toprast)
-- Geben Sie eine Liste aller Rechnungsnummer und die Gesamtsumme aus.
-- Ordnen Sie absteigend nach der Gesamtsumme.
------------------------------

select fk_rechn_nr rechnungsnummer, sum(preis*(1+mwst/100)) Gesamtsumme
from rechn_prod
group by fk_rechn_nr
order by 2 desc;

