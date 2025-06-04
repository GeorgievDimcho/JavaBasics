/*------------------------------------------------
Übung 8.2.1
Geben Sie das Gesamtgewicht aller Gepäcksstücke des Fluges mit der Flugnummer „OS1467" aus. (4 Punkte)
------------------------------------------------*/
select sum(gewicht) gesamtgewicht
from flug fg join passagierliste pl on fg.flugid = pl.flugid
             join gepaeck gk on pl.flugid = gk.flugid and pl.personid = gk.personid
             --> beim Join auf gepaeck über passagierliste müssen Gepäckstücke dem Flug UND der Person zugeordnet werden!
where flugnummer = 'OS1467';


select sum(gewicht) gesamtgewicht
from flug join passagierliste using(flugid)
          join gepaeck using(flugid, personid) --> beim Join auf gepaeck über passagierliste müssen Gepäckstücke dem Flug UND der Person zugeordnet werden!
where flugnummer = 'OS1467';


select sum(gewicht) gesamtgewicht
from flug join gepaeck using(flugid) --> direkter Join zwischen flug und gepaeck möglich
where flugnummer = 'OS1467';










/*------------------------------------------------
Übung 8.2.2
Geben Sie die Flugnummer und das Gesamtgewicht aller Gepäcksstücke für jeden Flug aus. 
Ordnen Sie die Ausgaben nach Gesamtgewicht in absteigender Reihenfolge. (4 Punkte)
------------------------------------------------*/
select flugnummer, sum(gewicht) gesamtgewicht
from flug fg join passagierliste pl on fg.flugid = pl.flugid
             join gepaeck gk on pl.flugid = gk.flugid and pl.personid = gk.personid
             --> beim Join auf gepaeck über passagierliste müssen Gepäckstücke dem Flug UND der Person zugeordnet werden!
group by flugnummer
order by 2 desc;


select flugnummer, sum(gewicht) gesamtgewicht
from flug join passagierliste using(flugid)
          join gepaeck using(flugid, personid) --> beim Join auf gepaeck über passagierliste müssen Gepäckstücke dem Flug UND der Person zugeordnet werden!
group by flugnummer
order by 2 desc;


select flugnummer, sum(gewicht) gesamtgewicht
from flug join gepaeck using(flugid) --> direkter Join zwischen flug und gepaeck möglich
group by flugnummer
order by 2 desc;
                              













/*------------------------------------------------
Übung 8.2.3
Geben Sie jene Namen (Vorname, Nachname), FlugID, Gesamtgepäckgewicht und Preis* aus,
deren Gesamtgepäck je Flug 20 kg übersteigt.
(*: pro kg Übergepäck muss der Passagier Euro 7,20 bezahlen).
Ordnen Sie die Ausgabe aufsteigend nach Nachnamen und Vornamen. (6 Punkte)
------------------------------------------------*/
select vorname, nachname, fg.flugid, count(gepaeckid) anzahl, sum(gewicht) gesamtgewicht, (sum(gewicht)-20)*7.2 aufpreis
from flug fg join passagierliste pl on fg.flugid = pl.flugid
             join gepaeck gk on pl.flugid = gk.flugid and pl.personid = gk.personid
             join person pn on pn.personid = pl.personid
group by vorname, nachname, fg.flugid
having sum(gewicht) > 20
order by nachname, vorname;


select vorname, nachname, flugid, sum(gewicht), (sum(gewicht)-20)*7.2 aufpreis
from flug join passagierliste using(flugid)
             join gepaeck using(flugid, personid)
             join person using(personid)
group by vorname, nachname, flugid
having sum(gewicht) > 20
order by nachname, vorname;










/*------------------------------------------------
Übung 8.2.4
Geben Sie Fluglinien (Name der Fluglinie) und deren Flotte (Name des Flugzeugtyps und
Anzahl) aus, wobei nur Flugzeuge berücksichtigt werden sollen, die mehr als 150 Sitzplätze
aufweisen. 
Ordnen Sie die Ausgabe aufsteigend nach den Namen der Fluglinien und absteigend nach der Anzahl der Flugzeugtypen. (4 Punkte)
------------------------------------------------*/
select fl.bezeichnung, ft.bezeichnung, count(*) as anzahl
from fluglinie fl join flugzeug using (fluglinieid)
                  join flugzeugtyp ft using (flugzeugtypid)
where sitzplaetze > 120
group by fl.bezeichnung, ft.bezeichnung
order by fl.bezeichnung, anzahl desc;










/*------------------------------------------------
Übung 8.2.5
Geben Sie eine Aufstellung der nationalen Zugehörigkeit inklusive der Anzahl der Passagiere
aus jedem Land für alle Flüge mit ungerader Flugnummer.
Ordnen Sie aufsteigend nach Flugnummer und Ländernamen. (Punkte 8)
------------------------------------------------*/
select flugnummer, bezeichnung, count(*) as anzahl
from flug join passagierliste using (flugid)
          join person using (personid) --> dieser Join kann wegelassen werden --> direkter Join von passagierliste auf reisepass mit personid möglich 
          join reisepass using (personid)
          join land using (landid)
where mod(substr(flugnummer,-1,1),2) = 1
group by flugnummer, bezeichnung
order by 1,2;



-- Ausgabe inklusive der Anzahl der Personen, die keinem Land zugeordnet werden können --> Left Join
select flugnummer, bezeichnung, count(*) as anzahl
from flug join passagierliste using (flugid)
          left join reisepass using (personid) --> Left Join, um auch alle Passagiere ohne Reisepass auszugeben
          left join land using (landid) --> Left Join von passagierliste auf reisepass muss auf land fortgeführt werden
where mod(substr(flugnummer,-1,1),2) = 1
group by flugnummer, bezeichnung
order by 1,2;










/*------------------------------------------------
Übung 8.2.6
Berechnen Sie zu welcher Ortszeit der Flug OS1467 an seinem Ziel ankommt, wenn er keine Verspätung hat. (6 Punkte)
------------------------------------------------*/
select flugnummer , dauer , ab.bezeichnung , abflugzeit , an.bezeichnung ,
to_char(abflugzeit + (dauer - ab.gmt_abweichung + an.gmt_abweichung )/24, 'yyyy-mm-dd hh24:mi:ss') as Ankunft
from flug , flughafen ab, flughafen an
where flugnummer = 'OS1467' 
  and flughafen_abflug = ab.flughafenID 
  and flughafen_destination = an.flughafenID;
  


select flugnummer , dauer , ab.bezeichnung , abflugzeit , an.bezeichnung ,
to_char(abflugzeit + (dauer - ab.gmt_abweichung + an.gmt_abweichung )/24, 'yyyy-mm-dd hh24:mi:ss') as Ankunft
from flug join flughafen ab on flughafen_abflug = ab.flughafenID
          join flughafen an on flughafen_destination = an.flughafenID
where flugnummer = 'OS1467';










/*------------------------------------------------
Übung 8.2.7
Geben Sie für alle Flüge die Anschlussflüge aus, die in einem Zeitraum von ein bis zwölf Stunden nach der Landung am Anschlussflughafen verfügbar sind. 
(Lassen Sie die GMT-Abweichung der Flughäfen unberücksichtigt.) (6 Punkte)
------------------------------------------------*/
select f1.*, f2.*
from flug f1 join flug f2 on f1.flughafen_destination = f2. flughafen_abflug -- <-- Equi-Join: Zielflughafen Flug_1 = Startflughafen Flug_2
                              and f1.abflugzeit + f1.dauer/24 <= f2.abflugzeit - 1/24 -- <-- Non-Equi-join (<=): Startzeit Flug_1 + Dauer <= Startzeit Flug_2 - 1 Stunde
                              and f2.abflugzeit <= f1.abflugzeit + f1.dauer/24 + 1/2; -- <-- Non-Equi-join (<=): Startzeit Flug_2 <= Startzeit Flug_1 + Dauer + 12 Stunden


select f1.*, f2.*
from flug f1 join flug f2 on f1.flughafen_destination = f2. flughafen_abflug
                              and f2.abflugzeit between f1.abflugzeit + (f1.dauer + 1)/24 and f1.abflugzeit + (f1.dauer + 12)/24; -- <-- Non-Equi-join (between): Startzeit Flug_2 zwischen Startzeit Flug_1 + Dauer + 1 Stunde und Startzeit Flug_1 + Dauer + 12 Stunden
                              



-- Lösung mit Ausgabe der Flughafennamen
select f1.flugnummer, ab1.bezeichnung Abflughafen1, an1.bezeichnung Ankunftsflughafen1, f1.abflugzeit Start1, f1.dauer,
       f2.flugnummer, ab2.bezeichnung Abflughafen2, an2.bezeichnung Ankunftsflughafen2, f2.abflugzeit Start2, f2.dauer
from flug f1 join flug f2 on f1.flughafen_destination = f2. flughafen_abflug
                              and f1.abflugzeit + f1.dauer/24 <= f2.abflugzeit - 1/24
                              and f2.abflugzeit <= f1.abflugzeit + f1.dauer/24 + 1/2
             join flughafen ab1 on f1.flughafen_abflug = ab1.flughafenid -- <-- Tabelle Flughafen als Abflughafen für Flug_1
             join flughafen an1 on f1.flughafen_destination = an1.flughafenid -- <-- Tabelle Flughafen als Ankunftsflughafen für Flug_1
             join flughafen ab2 on f2.flughafen_abflug = ab2.flughafenid -- <-- Tabelle Flughafen als Abflughafen für Flug_2
             join flughafen an2 on f2.flughafen_destination = an2.flughafenid; -- <-- Tabelle Flughafen als Ankunftsflughafen für Flug_2


select f1.flugnummer, ab1.bezeichnung Abflughafen1, an1.bezeichnung Ankunftsflughafen1, f1.abflugzeit Start1, f1.dauer,
       f2.flugnummer, ab2.bezeichnung Abflughafen2, an2.bezeichnung Ankunftsflughafen2, f2.abflugzeit Start2, f2.dauer
from flug f1 join flug f2 on f1.flughafen_destination = f2. flughafen_abflug
                             and f2.abflugzeit between f1.abflugzeit + (f1.dauer + 1)/24 and f1.abflugzeit + (f1.dauer + 12)/24
             join flughafen ab1 on f1.flughafen_abflug = ab1.flughafenid
             join flughafen an1 on f1.flughafen_destination = an1.flughafenid
             join flughafen ab2 on f2.flughafen_abflug = ab2.flughafenid
             join flughafen an2 on f2.flughafen_destination = an2.flughafenid;










/*------------------------------------------------
Übung 8.2.8
Geben Sie eine Liste aller Personen (Vorname, Nachname, Geburtstag, Flugnummer,
Sitzplatz) aus, die in einem Zeitraum von vier Tagen vor und vier Tagen nach ihrem Flugdatum
Geburtstag haben. (Punkte 8)
------------------------------------------------*/
-- Oracle
select vorname, nachname, geburtsdatum, flugnummer, sitzplatznummer
from person join passagierliste using (personid)
            join flug using (flugid)
where to_char(geburtsdatum, 'mmdd') between to_char(abflugzeit -4, 'mmdd') and to_char(abflugzeit +4, 'mmdd');





-- Daten für neue Person, Flug und Buchung einfügen
insert all
  into person (personid, nachname, geburtsdatum) values (999, 'Docsek', to_date('19801231','yyyymmdd'))
  into flug values (60, flugzeugid, gateid, flughafen_abflug, flughafen_destination, flugnummer, dauer, to_date('20210101','yyyymmdd'))
  into passagierliste values (60,999,'12A')
  into person (personid, nachname, geburtsdatum) values (998, 'Benno', to_date('19800102','yyyymmdd'))
  into flug values (61, flugzeugid, gateid, flughafen_abflug, flughafen_destination, flugnummer, dauer, to_date('20211230','yyyymmdd'))
  into passagierliste values (61,998,'12A')
  select * from flug where flugid = 1;


select * from person where personid in (998,999); -- Geburtsdatum: 1980-12-31
select * from flug where flugid in (60,61); -- Abflug: 2021-01-01
select * from passagierliste where flugid in (60,61); -- Buchung personid 999 auf flugid 60 
--> personid 999 hat einen Tag vor dem Flug Geburtstag, scheint aber nicht in der Liste aus.
--> Problem beim Jahreswechsel





-- Select
select vorname, nachname, geburtsdatum, flugnummer, sitzplatznummer, abflugzeit
from person join passagierliste using (personid)
            join flug using (flugid)
where to_char(geburtsdatum, 'mmdd') between to_char(abflugzeit -4, 'mmdd') and to_char(abflugzeit +4, 'mmdd') -- keine Jahresgrenze im Untersuchungszeitraum (+-4)
  or  to_date(extract(year from abflugzeit)-1||to_char(geburtsdatum,'mmdd'),'yyyymmdd') between abflugzeit -4 and abflugzeit +4 -- Jahreswechsel im Untersuchungszeitraum vor Flugdatum
  or  to_date(extract(year from abflugzeit)+1||to_char(geburtsdatum,'mmdd'),'yyyymmdd') between abflugzeit -4 and abflugzeit +4;-- Jahreswechsel im Untersuchungszeitraum nach Flugdatum



-- insert zurücknehmen
rollback;





-- PostgreSQL
-- Daten für neue Person, Flug und Buchung einfügen
insert into person (personid, nachname, geburtsdatum) values (999, 'Docsek', to_date('19801231','yyyymmdd'));
insert into flug values (60, 12, 1, 1, 10, 'OS1467', 8, to_date('20210101','yyyymmdd'));
insert into passagierliste values (60,999,'12A');
insert into person (personid, nachname, geburtsdatum) values (998, 'Benno', to_date('19800102','yyyymmdd'));
insert into flug values (61, 12, 1, 1, 10, 'OS1467', 8, to_date('20211230','yyyymmdd'));
insert into passagierliste values (61,998,'12A');


select * from person where personid in (998,999); -- Geburtsdatum: 1980-12-31
select * from flug where flugid in (60,61); -- Abflug: 2021-01-01
select * from passagierliste where flugid in (60,61); -- Buchung personid 999 auf flugid 60 
--> personid 999 hat einen Tag vor dem Flug Geburtstag, scheint aber nicht in der Liste aus.
--> Problem beim Jahreswechsel





-- Select
select vorname, nachname, flugnummer, sitzplatznummer
from person join passagierliste using (personid)
						join flug using (flugid)
where to_char(geburtsdatum,'mmdd') between to_char(abflugzeit - interval '4 day','mmdd') and to_char(abflugzeit + interval '4 day','mmdd') 
  or  to_date(extract(year from abflugzeit)-1||to_char(geburtsdatum,'mmdd'),'yyyymmdd') between abflugzeit - interval '4 day' and abflugzeit + interval '4 day' -- Jahreswechsel im Untersuchungszeitraum vor Flugdatum
  or  to_date(extract(year from abflugzeit)+1||to_char(geburtsdatum,'mmdd'),'yyyymmdd') between abflugzeit - interval '4 day' and abflugzeit + interval '4 day';-- Jahreswechsel im Untersuchungszeitraum nach Flugdatum



-- insert zurücknehmen
rollback;










