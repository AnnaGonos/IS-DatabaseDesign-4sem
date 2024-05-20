DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO order_pickup (order_number, pickup_point_id, storage_period) 
    VALUES(
        (i-1) % n + 1,
        ceil(random() * n),
        CURRENT_DATE + INTERVAL '1 day' * (random() * 10)
    );
    i := i + 1;
END LOOP;
END $$;
