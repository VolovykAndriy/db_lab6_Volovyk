-- Процедура для оновлення року продажів та суми продажів гри за її ідентифікатором
CREATE OR REPLACE PROCEDURE update_game_sales(p_game_id INT, p_new_sales FLOAT, p_new_year_of_update INT)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE global_sales
  SET sales = p_new_sales,
      year_of_update = p_new_year_of_update
  WHERE gs_id = (SELECT gs_id FROM Game WHERE game_id = p_game_id);

  COMMIT;
END;
$$;

CALL update_game_sales(1, 1500000.70, 2023);

