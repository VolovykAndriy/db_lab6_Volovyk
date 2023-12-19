-- Додавання даних до таблиці Platform
INSERT INTO Platform (platform_id, Platform_Name) VALUES
(1, 'PlayStation 4'),
(2, 'Xbox One'),
(3, 'Nintendo Switch'),
(4, 'PC'),
(5, 'PlayStation 5'),
(6, 'Xbox Series X'),
(7, 'Nintendo 3DS'),
(8, 'Mobile'),
(9, 'PlayStation Portable'),
(10, 'Xbox 360');

-- Додавання даних до таблиці Publisher
INSERT INTO Publisher (publisher_id, Publisher_Name) VALUES
(1, 'Electronic Arts'),
(2, 'Ubisoft'),
(3, 'Activision'),
(4, 'Nintendo'),
(5, 'Sony Interactive Entertainment'),
(6, 'Microsoft Studios'),
(7, 'Square Enix'),
(8, 'Take-Two Interactive'),
(9, 'Capcom'),
(10, 'Sega');

-- Додавання даних до таблиці Game
INSERT INTO Game (game_id, Name, Year, Genre, platform_id, publisher_id) VALUES
(1, 'FIFA 22', 2021, 'Sports', 1, 1),
(2, 'Assassin''s Creed Valhalla', 2020, 'Action-Adventure', 2, 2),
(3, 'Call of Duty: Warzone', 2020, 'Battle Royale', 4, 3),
(4, 'The Legend of Zelda: Breath of the Wild', 2017, 'Action-Adventure', 3, 4),
(5, 'Spider-Man: Miles Morales', 2020, 'Action-Adventure', 5, 5),
(6, 'Halo Infinite', 2021, 'First-Person Shooter', 6, 6),
(7, 'Final Fantasy VII Remake', 2020, 'Role-Playing', 1, 7),
(8, 'Grand Theft Auto V', 2013, 'Action-Adventure', 4, 8),
(9, 'Resident Evil Village', 2021, 'Survival Horror', 7, 9),
(10, 'Sonic Mania', 2017, 'Platform', 8, 10);

-- Додавання даних до таблиці global_sales
INSERT INTO global_sales (gs_id, game_id, sales, year_of_update) VALUES
(1, 1, 10.5, 2022),
(2, 2, 15.2, 2022),
(3, 3, 5.8, 2022),
(4, 4, 23.5, 2022),
(5, 5, 8.7, 2022),
(6, 6, 12.3, 2022),
(7, 7, 9.1, 2022),
(8, 8, 140.0, 2022),
(9, 9, 7.4, 2022),
(10, 10, 3.6, 2022);

-- Додавання даних до таблиці Platform_has_game
INSERT INTO Platform_has_game (game_id, platform_id) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 3),
(5, 5),
(6, 6),
(7, 1),
(8, 4),
(9, 7),
(10, 8);
