/*------------------------------------------------
Übung 9.2.1 (Toprast)
Geben Sie Namen und Alter der ältesten Person des Personals aus.
------------------------------------------------*/
select vorname, nachname, trunc(months_between(sysdate, geburtsdatum)/12) "ALTER"
from personen join mitarbeiter on pers_id = fk_pers_id
where geburtsdatum = (select min(geburtsdatum) from mitarbeiter);










/*------------------------------------------------
Übung 9.2.2 (Toprast)
Welche Personen scheinen weder als Mitarbeiter noch als Kunde auf Rechnungen auf. 
Ordnen Sie aufsteigend nach Nachnamen und Vornamen.
------------------------------------------------*/
-- Subselect
select pers_id, vorname, nachname
from personen
where pers_id not in (select fk_kunden_pers_id from rechnungen where fk_kunden_pers_id is not null)
  and pers_id not in (select fk_mitarbeiter_pers_id from rechnungen where fk_mitarbeiter_pers_id is not null)
order by nachname, vorname;





-- Join
select  pers_id, vorname, nachname from personen
                left join rechnungen on fk_kunden_pers_id = pers_id or fk_mitarbeiter_pers_id = pers_id
where fk_kunden_pers_id is null and fk_mitarbeiter_pers_id is null
order by nachname, vorname;










-- Mengenoperation
-- alle Personen
select pers_id, vorname, nachname
  from personen

  minus

-- Kunden auf Rechnungen
select pers_id, vorname, nachname
  from personen join rechnungen on pers_id = fk_kunden_pers_id

  minus

-- Mitaebeiter auf Rechnungen
select pers_id, vorname, nachname
  from personen join rechnungen on pers_id = fk_mitarbeiter_pers_id

order by nachname, vorname;


/*------------------------------------------------
Übung 9.2.3 (Toprast)
Welche Mitarbeiter sind auch Kunden.
Ordnen Sie aufsteigend nach Nachnamen und Vornamen.
------------------------------------------------*/

-- Mengenabfrage: Überschneidungsmenge Kunden/Mitarbeiter
select pers_id, vorname, nachname --> Pers_ID verwenden, das sonst falsches Ergebnis --> Mitarbeiter Uwe König und Kunde Uwe König sind verschiedene Personen!
from personen join mitarbeiter on pers_id = fk_pers_id

  intersect

select pers_id, vorname, nachname
from personen join kunden on pers_id = fk_pers_id

order by nachname, vorname;





-- Subselect
select vorname, nachname
from personen
where pers_id in (select fk_pers_id from mitarbeiter)
  and pers_id in (select fk_pers_id from kunden)
order by nachname, vorname;





-- join
select vorname, nachname
from personen join mitarbeiter ma on pers_id = ma.fk_pers_id
              join kunden kd on pers_id = kd.fk_pers_id;










/*------------------------------------------------
Übung 9.2.4 (Toprast)
Geben Sie die Rechnung (Rechnungsnummer, Gesamtsumme) mit der größten Gesamtsumme aus.
------------------------------------------------*/

-- 2 Subselects: 1. Liste alles Gesamtsummen, 2. Höchste Gesammtsumme als Filter
select rechnungsnummer, gesamtsumme
  from (select fk_rechn_nr rechnungsnummer, sum(preis * (1 + mwst/100)) gesamtsumme
        from rechn_prod
        group by fk_rechn_nr)
  where gesamtsumme = (select max(gesamtsumme) 
                        from (select sum(preis * (1 + mwst/100)) gesamtsumme
                                from rechn_prod
                                group by fk_rechn_nr));
                                


-- Aus sortiertem Subselect nur erete Zeile ausgeben --> Probelm bei zwei Rechnungen mit gleicher Gesamtsumme 
select rechnungsnummer, gesamtsumme 
  from (select fk_rechn_nr rechnungsnummer, 
               sum(preis * (1 + mwst/100)) gesamtsumme 
        from rechn_prod
        group by fk_rechn_nr
        order by 2 desc ,1)
where rownum = 1;




-- Subselect in with Klausel
with rechnungsliste as (select fk_rechn_nr rechnungsnummer, 
                               sum(preis * (1 + mwst/100)) gesamtsumme
                          from rechn_prod
                          group by fk_rechn_nr)
        
select rechnungsnummer, gesamtsumme
  from rechnungsliste
  where gesamtsumme = (select max(gesamtsumme) 
                        from rechnungsliste);
                        










/*------------------------------------------------
Übung 9.2.5 (Toprast)
Geben Sie für jede Filiale die Angestellten mit dem höchsten Umsatz aus und ordnen Sie aufsteigend nach Filialen. 
Ausgabe: Filiale, Mitarbeiternummer, Vorname, Nachname, Umsatz.
------------------------------------------------*/

-- Synchronisierte Subselects
select filiale, pers_id, vorname, nachname, umsatz
from (select name filiale, pers_id, vorname, nachname, sum(preis * (1 + mwst/100)) umsatz
        from filialen join rechnungen on f_id = fk_f_id
                      join personen on fk_mitarbeiter_pers_id = pers_id
                      join rechn_prod on rechn_nr = fk_rechn_nr
                      group by name, pers_id, vorname, nachname) mq

where umsatz = (select max(sum(preis * (1 + mwst/100)))
                  from filialen sq join rechnungen on f_id = fk_f_id
                                   join personen on fk_mitarbeiter_pers_id = pers_id
                                   join rechn_prod on rechn_nr = fk_rechn_nr
                  where sq.name = mq.filiale 
                  group by name, pers_id, vorname, nachname)
order by filiale;





-- With Klausel & synchronisiertes Subselect
with mitarbeiterumsatz as (select name filiale, pers_id, vorname, nachname, sum(preis * (1 + mwst/100)) umsatz
        from filialen join rechnungen on f_id = fk_f_id
                      join personen on fk_mitarbeiter_pers_id = pers_id
                      join rechn_prod on rechn_nr = fk_rechn_nr
                      group by name, pers_id, vorname, nachname)
                      
select filiale, pers_id, vorname, nachname, umsatz
  from mitarbeiterumsatz mq
  where umsatz = (select max(umsatz)
                    from mitarbeiterumsatz sq
                    where mq.filiale = sq.filiale)
order by filiale;




