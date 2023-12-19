CREATE TABLE Platform
(
  platform_id SERIAL PRIMARY KEY,
  Platform_Name VARCHAR(50) NOT NULL
);


CREATE TABLE Publisher
(
  publisher_id SERIAL PRIMARY KEY,
  Publisher_Name VARCHAR(200) NOT NULL
);


CREATE TABLE global_sales
(
  gs_id SERIAL PRIMARY KEY,
  sales DECIMAL(10, 2) NOT NULL,
  year_of_update INT NOT NULL
);


CREATE TABLE Game
(
  game_id SERIAL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Year INT NOT NULL,
  Genre VARCHAR(50) NOT NULL,
  platform_id INT NOT NULL,
  publisher_id INT NOT NULL,
  gs_id INT NOT NULL,
  FOREIGN KEY (platform_id) REFERENCES Platform(platform_id),
  FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id),
  FOREIGN KEY (gs_id) REFERENCES global_sales(gs_id)
);


CREATE TABLE Platform_has_game
(
  game_id INT NOT NULL,
  platform_id INT NOT NULL,
  PRIMARY KEY (game_id, platform_id),
  FOREIGN KEY (game_id) REFERENCES Game(game_id),
  FOREIGN KEY (platform_id) REFERENCES Platform(platform_id)
);
