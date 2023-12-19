-- Тригер для оновлення року оновлення глобальних продаж гри при зміні суми продажів
CREATE OR REPLACE FUNCTION update_global_sales_sales()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.sales IS DISTINCT FROM OLD.sales THEN
    UPDATE global_sales
    SET sales = NEW.sales,
        year_of_update = EXTRACT(YEAR FROM CURRENT_DATE)
    WHERE gs_id = NEW.gs_id;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Додаємо тригер до таблиці Game
CREATE TRIGGER game_update_trigger
AFTER UPDATE ON Game
FOR EACH ROW
EXECUTE FUNCTION update_global_sales_sales();
