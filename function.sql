-- Функція для отримання загальної кількості ігор для вказаної платформи
CREATE OR REPLACE FUNCTION get_game_count_for_platform(platform_name VARCHAR(50))
RETURNS INTEGER AS $$
DECLARE
  total_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO total_count
  FROM Game
  JOIN Platform ON Game.platform_id = Platform.platform_id
  WHERE Platform.Platform_Name = get_game_count_for_platform.platform_name;

  RETURN total_count;
END;
$$ LANGUAGE plpgsql;


SELECT get_game_count_for_platform('PC') AS game_count;
