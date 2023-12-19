-- Виклик функції для отримання кількості ігор для платформи 'PC'
SELECT get_game_count_for_platform('PC') AS game_count;

-- Виклик процедури для оновлення року видання гри з ідентифікатором 1 на 2025
CALL update_game_year(1, 2025);

-- Виклик процедури для оновлення інформації про глобальні продажі гри з ідентифікатором 1
CALL update_game_sales(1, 1500000.50, 2023);

-- Вставка нового запису в таблицю Game
INSERT INTO Game (Name, Year, Genre, platform_id, publisher_id, gs_id)
VALUES ('New Game', 2020, 'Action', 4, 2, 1);

-- Виклик тригера, який автоматично оновлює року оновлення глобальних продаж при зміні суми продажів
UPDATE global_sales
SET sales = 2000000.75
WHERE gs_id = 1

-- Виклик функції для отримання кількості ігор для платформи 'PC' після оновлення
SELECT get_game_count_for_platform('PC') AS game_count_after_update;
