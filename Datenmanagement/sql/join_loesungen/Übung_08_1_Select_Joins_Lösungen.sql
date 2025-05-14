/*------------------------------------------------
Übung 8.1.1
Geben Sie Nachname, Vorname und Reisepassnummer der Personen aus, die einen Reisepass besitzen. 
Sortieren Sie aufsteigend nach Nachnamen und Vorname. (Punkte 4)
------------------------------------------------*/
select nachname, vorname, reisepassnr
from person p join reisepass r on p.personid = r.personid
order by nachname, vorname;


select nachname, vorname, reisepassnr
from person join reisepass using (personid)
order by nachname, vorname;










/*------------------------------------------------
Übung 8.1.2
Geben Sie alle Personen (Vorname, Nachname) aus, die aus Österreich kommen.
Sortieren Sie aufsteigend nach Nachnamen und Vorname. (Punkte 4)
------------------------------------------------*/
select vorname, nachname
from person join reisepass using (personid)
            join land using (landid)
where bezeichnung = 'Österreich'
order by nachname, vorname;


select vorname, nachname
from person pn join reisepass rp on pn.personid = rp.personid
            join land ld on rp.landid = ld.landid
where bezeichnung = 'Österreich'
order by 2, 1;










------------------------------
-- Aufgabe 5.1.3
-- Geben Sie die Vornamen und Nachnamen, sowie das Gehalt des Personals aus.
-- Sortieren Sie nach dem Gehalt in absteigender Reihenfolge, sowie Nachname und Vorname in aufsteigender Reihenfolge. (4 Punkte)
------------------------------

-- inner join =
select pn.vorname, pn.nachname, g.monatsgehalt
from person pn, personal pl, gehaltsstufe g
where pn.personID = pl.personID 
 and  pl.gehaltsstufeID = g.gehaltsstufeID
order by g.monatsgehalt desc, pn.nachname, pn.vorname;





-- inner join on
select pn.vorname, pn.nachname, g.monatsgehalt
from person pn join personal pl on pn.personID = pl.personID
               join gehaltsstufe g on pl.gehaltsstufeID = g.gehaltsstufeID
order by g.monatsgehalt desc, pn.nachname, pn.vorname;





-- inner join using
select pn.vorname, pn.nachname, g.monatsgehalt
from person pn join personal pl using(personID)
               join gehaltsstufe g using(gehaltsstufeID)
order by 3 desc, 2, 1;











/*------------------------------------------------
Übung 8.1.4
Geben Sie ein Liste der Mitarbeiter mit Vornamen, Nachnamen, Personalnummer und Sozialversicherungsnummer aus. 
Sortieren Sie absteigend nach Nachnamen und Vornamen. (Punkte 2)
------------------------------------------------*/
select vorname, nachname, personalnummer, sozversnr
from person join personal on person.personid = personal.personid
order by nachname desc, vorname desc;


select vorname, nachname, personalnummer, sozversnr
from person pn join personal pl on pn.personid = pl.personid
order by nachname desc, vorname desc;


select vorname, nachname, personalnummer, sozversnr
from person join personal using (personid)
order by nachname desc, vorname desc;










/*------------------------------------------------
Übung 8.1.5
Geben Sie eine Liste aller (!) Personen (Vorname, Nachname) aus. 
Geben Sie in der Liste für jede Person gegebenenfalls auch die Reisepassnummer aus.  (2 Punkte)
------------------------------------------------*/
select vorname, nachname, reisepassnr
from person pn left join reisepass rp on pn.personid = rp.personid;


select vorname, nachname, reisepassnr
from person left join reisepass using (personid);










/*------------------------------------------------
Übung 8.1.6
Geben Sie eine Liste aller Personen aus (Vorname, Nachname), für die keine Nationalität angegeben ist (= Personen, die keinen Reisepass haben). 
Sortieren Sie aufsteigend nach Nachnamen und Vornamen. (Punkte 4)
------------------------------------------------*/
select vorname, nachname
from person left join reisepass using (personid)
where reisepassid is null
order by nachname, vorname;


select vorname, nachname
from person pn left join reisepass rp on pn.personid = rp.personid
where reisepassid is null
order by nachname, vorname;










/*------------------------------------------------
Übung 8.1.7
Geben Sie das Durchschnittsgehalt des Flugpersonals aus. (4 Punkte)
------------------------------------------------*/
select avg(monatsgehalt) durchschnittsgehalt
from flugpersonal join personal using (personid)
                  join gehaltsstufe using (gehaltsstufeid);











/*------------------------------------------------
Übung 8.1.8
Geben Sie alle Abteilungen aus, denen keine Mitarbeiter zugeordnet sind. (2 Punkte)
------------------------------------------------*/

select bezeichnung
from abteilung ag left join bodenpersonal bl on ag.abteilungsid = bl.abteilungsid
where personid is null;


select bezeichnung
from abteilung left join bodenpersonal using(abteilungsid)
where personid is null;










/*------------------------------------------------
Übung 8.1.9
Geben Sie eine Liste aller Passagiere aus (Vorname, Nachname), die auf Flügen von „Paris
Charles de Gaulle" gebucht waren. (6 Punkte)
------------------------------------------------*/

select vorname, nachname
from person join passagierliste using (personid)
            join flug using (flugid)
            join flughafen on flughafen_abflug = flughafenid
where bezeichnung = 'Paris Charles de Gaulle';



