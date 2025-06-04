/*------------------------------------------------
Aufgabe 8.2.1 (Toprast)
Geben Sie das Dienstalter aller aktiven Mitarbeiter aus.
Ordnen Sie die Ausgabe absteigend nach dem Dienstalter.
------------------------------------------------*/
select vorname, nachname, months_between(trunc(sysdate), eintrittsdatum)/12 Dienstalter
from personen join mitarbeiter on pers_id = fk_pers_id
where austrittsdatum is null
order by Dienstalter desc;










/*------------------------------------------------
Aufgabe 8.2.2 (Toprast)
Geben Sie die Allergene für die im Sortiment befindliche Cremeschnitte aus.
------------------------------------------------*/
select name, kuerzel, bezeichnung
from produkte join allerg_prod on produkt_id = fk_produkt_id
              join allergene on fk_kuerzel = kuerzel
where name = 'Cremeschnitte' and ausgelaufen = 0;










/*------------------------------------------------
Aufgabe 8.2.3 (Toprast)
Geben Sie eine Liste aller (!) Personen (Vorname, Nachname, Geschlecht) aus und ihre Mitarbeiternummer, Kundennummer bzw. beides, wenn vorhanden.
Ordnen Sie die Ausgabe aufsteigend nach Nachnamen und Vornamen
------------------------------------------------*/
select vorname, nachname, geschlecht, mitarbeiternummer, kundennummer
from personen left join mitarbeiter on pers_id = mitarbeiter.fk_pers_id -- <-- Left Join um alle Personen auszugeben; Qualifier für fk_pers_id erforderlich, da sonst nicht eindeutig ist, aus welcher Tabelle es stammt
              left join kunden kd on pers_id = kd.fk_pers_id -- <-- Left Join um alle Personen auszugeben; Qualifier für fk_pers_id mit Aliasnamen
order by nachname, vorname;










/*------------------------------------------------
Aufgabe 8.2.4 (Toprast)
Geben Sie alle Personen (Vorname, Nachname) aus, die in dem Ort, in dem sie wohnen auch ein Restaurant besucht haben.
Gebe Sie auch den Ortsnamen aus.
------------------------------------------------*/
select vorname, nachname, ort
from personen join kunden on pers_id = fk_pers_id
              join adressen ak on personen.fk_addr_id = ak.addr_id -- <-- Tabelle Adressen (Kundenadresse) muss zweimal verdendet werden --> Aliasname verwenden
              join rechnungen on fk_pers_id = fk_kunden_pers_id
              join filialen on fk_f_id = f_id
              join adressen af on filialen.fk_addr_id = af.addr_id -- <-- Tabelle Adressen (Filialenadresse) muss zweimal verdendet werden --> Aliasname verwenden
              join orte on af.plz = orte.plz
where ak.plz = af.plz;










/*------------------------------------------------
Aufgabe 8.2.5 (Toprast)
Geben Sie eine Liste aller Filialen (Name und Ort) aus und die Summe des Gesamtumsatzes.
Ordnen Sie absteigend nach dem Gesamtumsatz.
------------------------------------------------*/
select name, ort, sum(preis * (1 + mwst/100)) Gesamtumsatz
from filialen join adressen on fk_addr_id = addr_id
              join orte using (plz)
              join rechnungen on f_id = fk_f_id
              join rechn_prod on rechn_nr = fk_rechn_nr
group by name, ort
order by Gesamtumsatz desc;










/*------------------------------------------------
Aufgabe 8.2.6 (Toprast)
Geben Sie alle Mehrfachkunden (Vorname, Nachname) aus (= die mehr als eine Rechnung haben).
Ordnen Sie die Ausgabe absteigend nach Anzahl und aufsteigend nach Nachnamen und Vornamen. 
------------------------------------------------*/
select vorname, nachname, count(rechn_nr) anzahl
from personen join rechnungen on pers_id = fk_kunden_pers_id
group by vorname, nachname
having count(rechn_nr) > 1
order by 3 desc, 2,1;





--> Problem: Unterschiedliche Kunden mit gleichen Namen würden zu einer Gruppe zusammen gefasst.
-- Beispiel: Umbenenen eines Kunden auf den gleichen Namen eines anderen Kunden --> vorgerige Abfrage liefert Anja Hahn nun mit 6 Rechnungen
update personen
set vorname = 'Anja',
    nachname = 'Hahn'
where vorname = 'Sabine' and nachname = 'Friedrich'; 





--> Gruppieren auch nach Pers_ID (muss nicht nicht der Ausgabe sein)
select vorname, nachname, count(rechn_nr) anzahl
from personen join rechnungen on pers_id = fk_kunden_pers_id
group by pers_id, vorname, nachname -- <-- zusätzlich nach pers_id gruppieren
having count(rechn_nr) > 1
order by 3 desc, 2,1;





--> Kundennummer mitausgeben zusätlicher Join auf Tabelle Kunden
select vorname, nachname, kundennummer, count(rechn_nr) anzahl
from personen join rechnungen on pers_id = fk_kunden_pers_id
              join kunden on pers_id = fk_pers_id
group by kundennummer, vorname, nachname
having count(rechn_nr) > 1
order by 4 desc, 2,1;



-- Update zurücknehmen
rollback;

