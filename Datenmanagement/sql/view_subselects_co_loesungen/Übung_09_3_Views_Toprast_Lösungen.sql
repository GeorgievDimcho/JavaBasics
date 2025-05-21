/*###########################
## Views (TOPRAST)
###########################*/

/*------------------------------------------------
Aufgabe 9.3.1 (Toprast)
Erstellen Sie eine View Rechnungsposten, die für jede Rechnungsnummer die bestellten Produkte auflistet
Ausgabe: Rechnungsnummer, Produktname, Nettopreis, MwSt, Steuer, Bruttopreis
------------------------------------------------*/
create or replace view rechnungsposten as
  select fk_rechn_nr Rechnungsnummer, name Produktname, rp.preis Nettopreis, rp.mwst, (rp.preis*rp.mwst/100) Steuer, round(rp.preis * (1 + rp.mwst/100), 2) Bruttopreis
  from toprast.rechn_prod rp join toprast.produkte on fk_prod_id = produkt_id
  order by Rechnungsnummer, id;



-- Produkte auf der Rechnung mit der Rechnungsnummer 5
select * from rechnungsposten
where rechnungsnummer = 5;










/*------------------------------------------------
Aufgabe 9.3.2 (Toprast)
Erstellen Sie eine View Steuern, die für jede Steuersatz einer Rechnung folgenden Daten ausgibt:
Rechnungsnummer, MwSt, Nettowert, Steuer, Bruttowert
------------------------------------------------*/
create or replace view Steuern as
  select rechnungsnummer, mwst, sum(nettopreis) Netto, sum(steuer) Steuer, sum(bruttopreis) Brutto
  from rechnungsposten            --> Abfrage auf View Rechnungsposten
  group by rechnungsnummer, mwst
  order by rechnungsnummer, mwst;



-- Steuern auf der Rechnung mit der Rechnungsnummer 5
select * from steuern
where rechnungsnummer = 5;



-- Gesamtsteuer auf der Rechnung mit der Rechnungsnummer 5
select sum(steuer) Gesamtsteuer from steuern
where rechnungsnummer = 5;










/*------------------------------------------------
Aufgabe 9.3.3 (Toprast)
Erstellen Sie eine View, die folgenden Rechnungsinformationen ausgibt:
Rechnungsnummer, Datum
Filiale:  UID, Filialname, Telefon, Fax
          Filialadresse: Straße, Hausnummer, PLZ, Ort
Kunde:  Nachname, Vorname
        Kundenadresse: Straße, Hausnummer, PLZ, Ort
Rechnungssumme
Mitarbeiter: Nachname, Geschlecht
------------------------------------------------*/
--View mit Joins
create or replace view rechnungsdaten as
	select rechn_nr Rechnungsnummer, datum,                                              --> Rechnungsnummer und Datum
		
		"uid" "UID", name Filiale, telefon, fax,                                           --> Filialdaten
			af.strasse F_Strasse, af.hausnummer F_Hausnummer, af.plz F_PLZ, ofi.ort F_Ort,   --> Filialadresse
		
		kd.nachname K_Nachname, kd.vorname K_Vorname,                                      --> Kundenname
			ak.strasse K_Strasse, ak.hausnummer K_Hausnummer, ak.plz K_PLZ, ok.ort K_Ort,    --> Kundenadresse
			
		sum(bruttopreis) Rechnungssumme,                                                   --> Rechnungssumme (Bruttopreis aus View Rechnungsposten)
		
		ma.nachname M_Nachname, ma.geschlecht M_Geschlecht                                 --> Mitarbeiterdaten
		
	from toprast.rechnungen 
			join toprast.filialen fi on fk_f_id = f_id                                       --|
			join toprast.adressen af on fi.fk_addr_id = af.addr_id                           --|--> Joins für Filialdaten, Filialadresse, Filialort
			join toprast.orte ofi on af.plz = ofi.plz                                        --|
					
			left join toprast.personen kd on fk_kunden_pers_id = kd.pers_id                  --|
			left join toprast.adressen ak on kd.fk_addr_id = ak.addr_id                      --|--> Joins für Kundendaten, Kundenadresse, Kundenort; Left Join für anonyme Rechnungen
			left join toprast.orte ok on ak.plz = ok.plz                                     --|
					
			join toprast.personen ma on fk_mitarbeiter_pers_id = ma.pers_id                  --> Join für Mitarbeiterdaten
					
			join rechnungsposten on rechn_nr = rechnungsnummer                       --> Join auf View Rechnungsposten für Berechnung der Rechnungssumme
	
	group by rechn_nr, datum, "uid", name, telefon, fax, af.strasse, af.hausnummer, af.plz, ofi.ort,
			kd.nachname, kd.vorname, ak.strasse, ak.hausnummer, ak.plz, ok.ort,
			ma.nachname, ma.geschlecht;
			



-- Rechnungsdaten der Filiale Gralla ausgeben
select * from Rechnungsdaten
where filiale = 'Gralla'
order by datum;



-- Gesamtumsatz für Filiale Gralla ausgeben
select sum(rechnungssumme) Gesamtumsatz
from rechnungsdaten
where filiale = 'Gralla';



-- Cleanup: Views löschen
drop view rechnungsdaten;
drop view steuern;
drop view rechnungsposten;

