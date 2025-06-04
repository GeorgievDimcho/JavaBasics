--------------------------------------------------
-- Tabellen erstellen
-- Tabelle employees
create table employees (
  ssn number,
  dep_id integer,
  surname varchar2(50),
  first_name varchar2(50),
  sex char(1),
  birthdate date
);

-- Tabelle departments
create table departments (
  id integer,
  name varchar2(30),
  location varchar(20)
);





--------------------------------------------------
-- Tabellendefinition anzeigen
desc employees;
desc departments;





--------------------------------------------------
-- keine Constraints
-- Insert Datensatz in departments
insert into departments (id, name, location) values (1, 'marketing', 'main building');
insert into departments values (1, 'marketing', 'main building');
insert into departments (id) values (1);
insert into departments values (null, null, null);

-- Insert Datensatz in employees
insert into employees values (1111111111, 99, 'Müller', 'Franz', 'X', null);

commit;





--------------------------------------------------
-- Tabelleninhalte anzeigen
-- Datensätze in den Tabellen ausgeben
select * from departments;
select * from employees;





--------------------------------------------------
-- alle Datensätze in den Tabellen löschen
delete from departments;
delete from employees;

commit;



--------------------------------------------------
-- Constraints einfügen
-- Primary Key (ADD)
alter table employees
  add primary key (ssn);
  
-- Not Null (MODIFY)
alter table employees
  modify (surname not null,
          first_name not null);

-- Not Null (MODIFY)
alter table employees
  modify surname null
  modify first_name null;
  
-- Foreign Key (ADD)
alter table employees
  add foreign key (dep_id) references departments (id);
  
-- -> Fehler, weil das Attribut, auf das referenziert wird, nicht als eindeutig definiert ist
-- -> In der Tabelle departments muss zuerst das Attribut id als Primary Key definiert werden
 
alter table departments
  add primary key (id)
  modify name not null
;


-- -> Jetzt kann der Foreign Key in der Tabelle employees erstellt werden
-- Foreign Key (ADD)
alter table employees
  add foreign key (dep_id) references departments (id);


-- Check Constraint in Tabelle employees
alter table employees
  modify sex check(sex in ('M', 'F', 'D'));




--------------------------------------------------
-- Beschreibung anzeigen (DB Explorer)
desc employees;
desc departments;




--------------------------------------------------
-- Tabellen löschen
drop table departments cascade constraints;
drop table employees;





--------------------------------------------------
-- Tabellen mit Constraints erstellen
-- Tabelle employees
create table employees (
  ssn number primary key,
  dep_id integer references departments (id),
  surname varchar2(50) not null,
  first_name varchar2(50) not null,
  sex char(1) check (sex in ('M','F','D')),
  birthdate date
);

-- Tabelle departments
create table departments (
  id integer primary key,
  name varchar2(30) not null,
  location varchar(20),
  unique (name)
);


-- ACHTUNG:
-- Wenn die Constraints gleich bei der Tabellenerstellung mitangelegt werden, 
-- muss speziell bei der Verwendung von FK Constraints auf die Reihenfolge der Tabellenerstellung geachtet werden.
-- Wird in einer Tabelle auf eine andere Tabelle referenziert, muss die referenzierte Tabelle zuerst erstellt werden.

-- --> korrekte Reihenfolge im Beispiel: zuerste Tabelle departments erstellen, dann Tabelle employees erstellen.


--------------------------------------------------
-- Beschreibung anzeigen (DB Explorer)
desc employees;
desc departments;

select * from departments;


--------------------------------------------------
-- insert Datensatz in employees - Test Constraints
insert into employees values (1234130332, 2, 'Müller', 'Franz', 'M', to_date('13.03.1932', 'dd.mm.yyyy')); --> Fehler: unique constraint violated






--------------------------------------------------
-- Einfügen der Abteilungen
insert into departments values (1, 'marketing', 'main building');
insert into departments values (2, 'graphic&design'); --> Fehler: not enough values
insert into departments values (2, 'graphic&design', 'top floor');
insert into departments (id, name, location) values (3, 'development', 'pavillion');
insert into departments (id, name) values (4, 'administration');

select * from departments;

-- Transactionhandling
-- Zurücknehmen
rollback;

-- bestätigen
commit;





--------------------------------------------------
-- Andern des Werts location der Abteilung 4 - Administration
update departments
	set location = 'main building';
	

-- Tabelle departments anzeigen
select * from departments;

-- Änderungen zurücknehmen
rollback;

-- Tabelle departments anzeigen
select * from departments;


-- Andern des Werts location der Abteilung 4 - Administration
update departments
	set location = 'main building'
	where name = 'administration';


-- Tabelle departments anzeigen
select * from departments;

-- Änderungen bestätigen
commit;





--------------------------------------------------
-- insert Datensatz in employees
insert into employees values (1234130332, 99, 'Müller', 'Franz', 'M', to_date('13.03.1932', 'dd.mm.yyyy')); --> Fehler: integrity constraint violated - parent key not found
insert into employees values (1234130332, 2, 'Müller', 'Franz', 'M', to_date('13.03.1932', 'dd.mm.yyyy'));

insert into employees values (3333270286, 'Maier', 'Ilse', 'F', to_date('27.02.1986', 'dd.mm.yyyy')); -- Fehler: not enough values
insert into employees values (3333270286, null, 'Maier', 'Ilse', 'F', to_date('27.02.1986', 'dd.mm.yyyy')); -- Einfügen von Nullwerten

insert into employees values (1622031276, 1, 'Strohmaier', 'Gerhard', 'm', to_date('03.12.1976', 'dd.mm.yyyy')); --> Fehler: check constraint violated (nur M, F oder D für Geschlecht erlaubt)
insert into employees values (1622031276, 1, 'Strohmaier', 'Gerhard', 'M', to_date('03.12.1976', 'dd.mm.yyyy'));

insert into employees (ssn, surname, first_name, sex) values (1234567890, null, 'James', 'M'); --> Spalten angeben, in die die Werte eingefügt werden sollen. Die restlichen Spalten werden mit NULL befüllt (wenn erlaubt --> hier Fehler: cannot insert NULL into surname) 
insert into employees (ssn, surname, first_name, sex) values (1234567890, 'Brown', 'James', 'M'); --> Spalten angeben, in die die Werte eingefügt werden sollen. Die restlichen Spalten werden mit NULL befüllt (wenn erlaubt)


-- Tabelle employees anzeigen
select * from employees;

-- Änderungen zurücknehmen
rollback;


-- insert Datensätze zusammen einfügen
insert all
	into employees values (1234130332, 2, 'Müller', 'Franz', 'M', to_date('13.03.1932', 'dd.mm.yyyy'))
	into employees values (3333270286, null, 'Maier', 'Ilse', 'F', to_date('27.02.1986', 'dd.mm.yyyy'))
	into employees values (1622031276, 1, 'Strohmaier', 'Gerhard', 'M', to_date('03.12.1976', 'dd.mm.yyyy'))
	into employees (ssn, surname, first_name, sex) values (1234567890, 'Brown', 'James', 'M')
	select * from dual;

	
-- Tabelle employees anzeigen
select * from employees;

-- Änderungen bestätigen
commit;
	




--------------------------------------------------
-- Mitarbeiter James Brown einer Abteilung zuordnen

-- Tabelle employees anzeigen
select * from employees;


-- Mitarbeiter James Brown einer Abteilung zuordnen
update employees
	set dep_ID = 2
	where surname = 'Brown'; -- besser: where ssn = 1234567890;


-- Tabelle employees anzeigen
select * from employees;

-- Änderungen zurücknehmen
rollback;

-- Tabelle employees anzeigen
select * from employees;


-- Mitarbeiter James Brown einer Abteilung mit Subselect zuordnen
update employees
	set dep_ID = (select id from departments where name = 'graphic&design')
	where surname = 'Brown';


-- Tabelle employees anzeigen
select * from employees;

-- Änderungen bestätigen
commit;





--------------------------------------------------
-- Datensätze löschen
-- bestimmte Datensätze löschen
delete from employees
	where surname = 'Brown';

-- Tabelle employees anzeigen
select * from employees;


-- alle Datensätze einer Tabelle löschen
delete from employees;

-- Tabelle employees anzeigen
select * from employees;

-- Änderungen zurücknehmen
rollback;





--------------------------------------------------
-- SELECT

-- Abfragen
select * from employees; -- alle Datensätze anzeigen
select 3*5 from dual; -- arithmetische Auusdrücke und Funktionen
select * from dual; -- Oracle Dummy Tabelle
select 3*5 from employees; -- Ergebnis wird für jeden Datensatz berechnet


select first_name, surname from employees; -- einzelne Spalten auswählen
select location from departments;
select distinct location from departments; -- nur Unterschiedliche Ergbenisdatensätze ausgeben


-- Ausgabe auf bestimmte Datensätze einschränken
select name from departments
	where location = 'main building';

select name from departments
	where location = 'top floor' or location = 'pavillion'; -- Verwendung logischer Operatoren in der Where Klausel
select name from departments
	where location in ('top floor', 'pavillion'); -- Verwendung von Listenoperatoren in der Where-Klausel

select * from employees
	where dep_id = 2; -- alle Angestellten, die zur Abteilung mit der ID 2 gehören
	
select * from employees
	where dep_id is null; -- alle Angestellten, die zu keiner Abteilung gehören
	
select * from employees
	where dep_id is not null; -- alle Angestellent, die zu einer Abteilung gehören
	

-- Wildcards
select surname from employees
	where surname like 'M%r'; -- alle Nachnamen, die mit M beginnen und mit r enden
select surname from employees
	where surname like '%r'; -- Alle Nachnamen, die mit r enden
select surname from employees
	where surname like 'M___r'; -- alle Nachnamen, die mit M beginnen, mit r enden und 5 Zeichen lang sind


-- Aliasnamen für Ausgebespalten
select id as "Departmentnummer" from departments;
select id as Departmentnummer from departments;
select id as "Department Nummer" from departments;
sel
ect id "Department Nummer" from departments;


select count(*) from employees;
select count(*) "Anzahl der Angestellten" from employees;

select count(dep_id) as "Anzahl Abteilungszuornungen" from employees;
select count(distinct dep_id) as "unterschieldiche Zuornungen" from employees;

select count(*) "Angestellte in Abteilung 2" from employees
	where dep_id = 2;


select min(birthdate) from employees;

