
-- create
CREATE TABLE adresse (
  addr_id NUMBER primary key,
  strasse VARCHAR2(15) ,
  plz NUMBER,
  ort VARCHAR2(20),
  hausnummer number
);

INSERT INTO adresse VALUES (1, 'First Street', 5000, 'Wien', 1);
INSERT INTO adresse VALUES (2, 'Second Street', 4500, 'Wien2', 2);

--select * from adresse;

CREATE TABLE personen (
  pers_id NUMBER primary key,
  vorname VARCHAR2(15) ,
  nachname VARCHAR2(20),
  geschlecht VARCHAR2(20)
);

CREATE TABLE filialen (
  f_id NUMBER primary key,
  uid_num NUMBER,
  name VARCHAR2(15) ,
  telefon NUMBER,
  fax NUMBER,
  geschlossen number
);

INSERT INTO personen VALUES (1, 'First name', 'Second name', 'divers');
INSERT INTO filialen VALUES (1, 2345 ,'best filiale', 06776452344324, 987654, 0);
--select * from personen;
--select * from filialen;

ALTER TABLE personen ADD adresse number;


ALTER TABLE personen ADD CONSTRAINT fk_addr foreign key (adresse) REFERENCES adresse(addr_id);
--INSERT into personen (adresse) VALUES (2) where pers_id=1;
-- select addr_id from adresse where plz = 5000;
UPDATE personen SET adresse = 1 WHERE pers_id = 1;


ALTER TABLE filialen ADD adresse number;
ALTER TABLE filialen ADD CONSTRAINT fk_addr_filiale foreign key (adresse) REFERENCES adresse(addr_id);
--INSERT into personen (adresse) VALUES (2) where pers_id=1;
-- select addr_id from adresse where plz = 5000;
UPDATE filialen SET adresse = 2 WHERE f_id = 1;

-- test reference integrity
-- delete from adresse where addr_id='2';
create TABLE kunden (
  pers_id NUMBER primary key,
  kundennummer NUMBER unique 
);

ALTER TABLE kunden ADD CONSTRAINT fk_kunden_personen foreign key (pers_id) REFERENCES personen(pers_id);
ALTER TABLE personen ADD category char(1);
INSERT INTO kunden VALUES (1, 23);
UPDATE personen set category = 'k' where pers_id=1;
INSERT INTO personen VALUES (2, 'First name2', 'Second name2', 'divers', 2 , 'm');

--select * from personen;
--select * from kunden;
create TABLE mitarbeiter (
  pers_id NUMBER primary key,
  mitarbeiterNum NUMBER, 
  svn NUMBER,
  geburtsdatum date,
  eintritt date,
  austritt date
);
insert into mitarbeiter VALUES (2,3,12345676,TO_DATE('2000-04-24', 'YYYY-MM-DD'),TO_DATE('2000-04-24', 'YYYY-MM-DD'),TO_DATE('2000-04-24', 'YYYY-MM-DD'));
--select * from mitarbeiter;
-- select nachname of kunde with kundennummer 23
create TABLE rechnung (
  rechnungNum NUMBER primary key,
  datum_uhr timestamp
);
-- in der rechung tabele 2 spalten kunde udn mitarbeiterinenn
  --to_date('12-01-2012 21:24:00', 'dd-mm-yyyy hh24:mi:ss')
Alter table rechnung ADD filialen_id NUMBER;
ALTER TABLE rechnung ADD CONSTRAINT fk_filiale_id foreign key (filialen_id) REFERENCES filialen(f_id);

insert into rechnung VALUES (1,TO_DATE('2000-04-24 21:24:00', 'YYYY-MM-DD hh24:mi:ss'),1);
--
select * from rechnung;
alter table rechnung add mit_id NUMBER;
alter table rechnung add kunden_id NUMBER;

create table produkte (
  prod_id NUMBER primary key,
  name VARCHAR2(10),
  preis float,
  mwst NUMBER,
  ausgelaufen NUMBER
);

create table allergene (
  kurzel VARCHAR2(10) primary key,
  bezeichnugn VARCHAR2(10)
);

create table aller_prod (
  prod_id,
  kurzel,
  foreign key (prod_id) REFERENCES produkte(prod_id),
  foreign key (kurzel) REFERENCES allergene(kurzel),
  primary key (prod_id,kurzel)
);

create table rechn_prod (
  id NUMBER primary key,
  preis float,
  mwst NUMBER,
  rechn_num,
  prod_id,
  foreign key (rechn_num) REFERENCES rechnung(rechnungNum),
  foreign key (prod_id) REFERENCES produkte (prod_id)
);

