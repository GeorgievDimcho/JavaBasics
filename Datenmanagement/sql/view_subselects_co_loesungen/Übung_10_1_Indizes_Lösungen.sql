/*###########################
## Indexes ##
###########################*/

/*
Betrachten Sie folgendes select-Statement: (3)

		SELECT *
		FROM personal_view
		WHERE monatsgehalt > 3000 AND
		 bezeichnung='Chefpilot' AND
		 UPPER(nachname) < 'G'
		ORDER BY nachname, vorname;
		
Welche Indexes müssen gesetzt werden (auf den Originaltabellen !!!) um
die Performance möglichst weit zu erhöhen. Geben Sie SQL-Anweisungen
zum Erstellen der Indexes an und geben Sie Argumente für jeden Index
an.
*/

-------------------
-- 5.4.1 Indizes --
-------------------

-- Index auf nachname in person --> schnellerer Zugriff auf Nachname < G und schneller Sortierung, da Nachnamen im Index bereits sortiert vorliegen
create index idx_person_nachname on person(nachname);
	-- ev. Index (nachname, vorname) --> schnellerer Zugriff auf Nachname < G, schnellere Sortierung nach Nach- und Vorname
	create index index_person on person(nachname, vorname);

-- Index auf bezeichnung in dienstrang --> schneller Zugriff bezeichnung "Chefpilot" 
create index idx_dr_bez on dienstrang(bezeichnung);

-- Index auf monatsgehalt in gehaltsstufe --> schneller finde aller Werte > 3000 
create index idx_gs_gehalt on gehaltsstufe(monatsgehalt);


-- Index auf FK dienstrangid --> schnellere Joins dienstrang - flugpersonal
create index idx_fk_fpl_drid on flugpersonal(dienstrangid)

-- Index auf FK abteilungsid --> schnellere Joins abteilung - flugpersonal
create index idx_fk_bpl_aid on bodenpersonal(abteilungsid)



-- Überprüfen
explain plan for
	SELECT *
		FROM personal_view
		WHERE monatsgehalt > 3000 AND
		 bezeichnung='Chefpilot' AND
		 UPPER(nachname) < 'G'
		ORDER BY nachname, vorname;

SELECT * FROM table(dbms_xplan.display);






/*
Im Bereich der Flüge sind eine Reihe sinnvoller Abfragen denkbar (z.B. die
Anzeige der aktuellen Füge an den Terminals oder Sitzplatzbuchungen
etc.). Überlegen Sie sich mind. 4 verschiedene Indexes, die in diesem
Zusammenhang sinnvoll sein könnten. Geben Sie für jeden Index eine (frei
formulierte) Begründung an, warum der Index Ihrer Meinung nach wichtig
ist. 
*/

---------------------------------
-- 5.4.2 Indizes rund um Flüge --
---------------------------------
-- Flüge werden normalerweise nach Abflugzeit und Flugnummer der Reihe nach angezeigt:
CREATE INDEX panel ON flug(abflugzeit, flugnummer);

-- Index auf FK flugid in gepaeck --> schnelles Auffinden alle Gepäcksstüke zu einen Flug
CREATE INDEX fk_flugid ON gepaeck(flugid);

-- Index auf FK personid in gepaeck --> schnelles Auffinden alle Gepäcksstüke zu einer person
CREATE INDEX fk_personid ON gepaeck(personid);

-- Index auf flugnummer in flug --> schnelles Auffinden eines Flugs über Flugnummer
CREATE INDEX fl_nummer ON flug(flugnummer);

