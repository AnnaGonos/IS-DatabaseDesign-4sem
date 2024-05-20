DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO delivery (order_number, total_weight, total_volume, delivery_date, delivery_time, address, delivery_cost, employee_id, delivery_statuses, delivery_types)
    VALUES (
        i,
        (random() * 1000)::decimal(10,2),
        (random() * 1000)::decimal(10,2),
        CURRENT_DATE + INTERVAL '1 day' * i,
        '00:00'::time + (random() * '24 hours'::interval),
        'Адресс доставки ' || i,
        (random() * 1000)::decimal(10,2),
        ceil(random() * n),
        CASE floor(random()*3)
            WHEN 0 THEN 'В процессе доставки'
            WHEN 1 THEN 'Доставлен'
            ELSE 'Возвращен'
        END::delivery_status,
        CASE floor(random()*2)
            WHEN 0 THEN 'Курьером'
            ELSE 'Грузовой транспорт'
        END::delivery_type
    );
    i := i + 1;
END LOOP;
END $$;