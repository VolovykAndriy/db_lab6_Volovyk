-- Повертає середню кількість продажів для заданої гри за певний період часу. 
-- Функція буде приймати назву гри, початковий та кінцевий рік, і повертати середню кількість продажів за цей період.
-- Створення функції
CREATE OR REPLACE FUNCTION get_average_sales(game_name VARCHAR(350), start_year INT, end_year INT)
RETURNS FLOAT AS $$
DECLARE
    total_sales FLOAT;
    num_records INT;
    avg_sales FLOAT;
BEGIN
    -- Розрахунок сумарних продаж та кількості записів
    SELECT COALESCE(SUM(gs.sales), 0), COUNT(gs.gs_id)
    INTO total_sales, num_records
    FROM global_sales gs
    JOIN game g ON gs.game_id = g.game_id
    WHERE g.Name = game_name AND gs.year_of_update BETWEEN start_year AND end_year;

    -- Розрахунок середніх продаж
    IF num_records > 0 THEN
        avg_sales := total_sales / num_records;
        RETURN avg_sales;
    ELSE
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE PLPGSQL;

-- Виклик функції для перевірки
SELECT get_average_sales('FIFA 22', 2022, 2023) AS average_sales;
