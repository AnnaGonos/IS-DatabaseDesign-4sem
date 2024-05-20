DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
    WHILE i <= n LOOP
        -- Генерация случайных данных для pickup_points
        INSERT INTO pickup_points (pickup_point_id, address, working_hours)
        VALUES (
            i,
            'Адрес пункта выдачи ' || i,
            CURRENT_DATE + INTERVAL '1 day' * i
        );
        
        i := i + 1;
    END LOOP;
END $$;