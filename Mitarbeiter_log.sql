-- Beispiel-Tabelle erstellen
CREATE TABLE IF NOT EXISTS public.MA (
    id SERIAL PRIMARY KEY,
    Vorname VARCHAR[],
    Nachname VARCHAR[],
    Straße VARCHAR[],
    Hausnummer int[],
    PLZ int[],
    ORT varchar[],
    Hierarchie varchar[],
    Bereich varchar[],
    Zeitstempel timestamp[]
);

-- Beispiel-Tabelle füllen
insert into public.MA (Vorname, Nachname, Straße, Hausnummer, PLZ, ORT, Hierarchie, Bereich, Zeitstempel) 
values 
	('{"Max"}', '{"Mustermann"}', '{"Musterstr."}',	'{1}', '{12345}', '{"Musterstadt"}', '{"Manangement"}',	'{"GF"}', ARRAY[CURRENT_TIMESTAMP]),
	('{"Wärter"}', '{"Karl"}', '{"Forstweg"}', '{5}', '{41450}', '{"Dormagen"}', '{"Bereichsleiter"}', '{"INFRA"}', ARRAY[CURRENT_TIMESTAMP]),
	('{"Herr"}', '{"Tierlieb"}', '{"Römerstrasse"}', '{111}', '{41460}', '{"Neuss"}', '{"Sachbearbeiter"}', '{"HR"}', ARRAY[CURRENT_TIMESTAMP]),
	('{"John"}', '{"Doe"}', '{"Hauptstraße"}', '{555}', '{55555}', '{"Köln"}', '{"Bereichsleiter"}', '{"IT"}', ARRAY[CURRENT_TIMESTAMP]),
	('{"Karla"}', '{"Kolumna"}', '{"Seitenstraße"}', '{321}', '{40213}', '{"Düsseldorf"}', '{"Sachbearbeiter"}', '{"IT"}', ARRAY[CURRENT_TIMESTAMP])
;

-- Daten zu einem vorhandenen Array in der Tabelle hinzufügen
UPDATE public.MA
SET 
    Hierarchie = Hierarchie || ARRAY['Bereichsleiter'],
    Bereich = Bereich || ARRAY[''],    
	Zeitstempel = Zeitstempel || ARRAY[CURRENT_TIMESTAMP]
WHERE id = 3;

-- Neuer Mitarbeiter
insert into public.MA (Vorname, Nachname, Straße, Hausnummer, PLZ, ORT, Hierarchie, Bereich, Zeitstempel) 
values 
	('{"Norman"}', '{"Neumann"}', '{"Nordmanntannenallee"}', '{777}', '{75493}', '{"Umgebung"}', '{"Sachbearbeiter"}', '{"DATA"}', ARRAY[CURRENT_TIMESTAMP]);

-- Neuer Mitarbeiter zieht um
UPDATE public.MA
SET Straße = ARRAY['Hohe Straße'],
	Hausnummer = array [15]
WHERE id = 6;

