-- Ця процедура приймає назву гри, рік та нову кількість продажів. 
-- Вона оновлює кількість продажів для вказаної гри та року. Якщо для даної гри та року немає запису, то процедура вставляє новий запис.
-- Створення процедури
CREATE OR REPLACE PROCEDURE update_sales_for_game(game_name VARCHAR(350), update_year INT, new_sales FLOAT)
LANGUAGE PLPGSQL AS $$
BEGIN
    -- Оновлення кількості продажів для вказаної гри та року
    UPDATE global_sales
    SET sales = new_sales
    WHERE game_id = (SELECT game_id FROM game WHERE Name = game_name)
      AND year_of_update = update_year;

    -- Якщо не знайдено записів для оновлення, вставити новий запис
    IF NOT FOUND THEN
        INSERT INTO global_sales (game_id, sales, year_of_update)
        VALUES ((SELECT game_id FROM game WHERE Name = game_name), new_sales, update_year);
    END IF;
END;
$$;

-- Виклик процедури для перевірки
CALL update_sales_for_game('FIFA 22', 2022, 12.5);
