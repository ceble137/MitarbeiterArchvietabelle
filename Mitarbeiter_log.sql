-- Beispiel-Tabelle erstellen (falls noch nicht vorhanden)
CREATE TABLE IF NOT EXISTS my_table (
    id SERIAL PRIMARY KEY,
    my_array INTEGER[]
);

-- Daten zu einem vorhandenen Array in der Tabelle hinzufügen
UPDATE my_table
SET my_array = my_array || ARRAY[4, 5, 6]
WHERE id = 1;