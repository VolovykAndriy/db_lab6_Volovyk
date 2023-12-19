-- populate.sql

-- Додати дані до таблиці Platform
INSERT INTO Platform (Platform_Name) VALUES
  ('PlayStation'),
  ('Xbox'),
  ('Nintendo Switch'),
  ('PC'),
  ('Mobile');

-- Додати дані до таблиці Publisher
INSERT INTO Publisher (Publisher_Name) VALUES
  ('Electronic Arts'),
  ('Ubisoft'),
  ('Activision'),
  ('Nintendo'),
  ('Square Enix');

-- Додати дані до таблиці global_sales
INSERT INTO global_sales (sales, year_of_update) VALUES
  (1000000.00, 2022),
  (750000.50, 2022),
  (500000.75, 2022),
  (1200000.25, 2023),
  (900000.50, 2023);

-- Додати дані до таблиці Game
INSERT INTO Game (Name, Year, Genre, platform_id, publisher_id, gs_id) VALUES
  ('FIFA 23', 2023, 'Sports', 1, 1, 4),
  ('Assassin''s Creed Valhalla', 2020, 'Action-Adventure', 2, 2, 1),
  ('The Legend of Zelda: Breath of the Wild', 2017, 'Action-Adventure', 3, 4, 5),
  ('Cyberpunk 2077', 2020, 'Role-Playing', 4, 3, 2),
  ('Super Mario Odyssey', 2017, 'Platformer', 3, 4, 3);

-- Додати дані до таблиці Platform_has_game
INSERT INTO Platform_has_game (game_id, platform_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 3),
  (4, 4),
  (5, 3);
