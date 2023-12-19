--Цей тригер буде викликаний при кожному INSERT, UPDATE або DELETE в таблиці global_sales, і буде вносити запис в журнал змін
-- Створення таблиці для логування змін
CREATE TABLE change_log (
    log_id SERIAL PRIMARY KEY,
    table_name VARCHAR(50),
    action_type VARCHAR(10),
    record_id INT,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Створення тригера для логування змін
CREATE OR REPLACE FUNCTION log_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO change_log (table_name, action_type, record_id)
        VALUES (TG_TABLE_NAME, 'INSERT', NEW.gs_id);
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO change_log (table_name, action_type, record_id)
        VALUES (TG_TABLE_NAME, 'UPDATE', NEW.gs_id);
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO change_log (table_name, action_type, record_id)
        VALUES (TG_TABLE_NAME, 'DELETE', OLD.gs_id);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

-- Прикріплення тригера до таблиці global_sales
CREATE TRIGGER log_changes_trigger
AFTER INSERT OR UPDATE OR DELETE ON global_sales
FOR EACH ROW
EXECUTE FUNCTION log_changes();

-- Перевірка роботи тригера
INSERT INTO global_sales (gs_id, game_id, sales, year_of_update) VALUES (11, 1, 8.0, 2023);
UPDATE global_sales SET sales = 15.0 WHERE gs_id = 1;
DELETE FROM global_sales WHERE gs_id = 2;

-- Перегляд логу змін
SELECT * FROM change_log;


