-- Виклик функції
SELECT get_average_sales('FIFA 22', 2022, 2023) AS average_sales;

-- Виклик процедури
CALL update_sales_for_game('FIFA 22', 2022, 15.0);

-- Перевірка роботи тригера (вставка нового запису)
INSERT INTO global_sales (gs_id, game_id, sales, year_of_update) VALUES (12, 1, 10.0, 2023);

-- Перегляд логу змін
SELECT * FROM change_log;
