DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO orders (order_number, order_date, order_statuses, order_cost, payment_methods, customer_id, employee_id) 
    VALUES(
        i,
        current_date,
        CASE floor(random()*4)
            WHEN 0 THEN 'Создан'
            WHEN 1 THEN 'В обработке'
            WHEN 3 THEN 'Выполнен'
            ELSE 'Отменен'
        END::order_status,
        (random() * 1000)::decimal(10,2),
        CASE floor(random()*4)
            WHEN 0 THEN 'Наличные'
            WHEN 1 THEN 'Кредитная карта'
            WHEN 3 THEN 'Банковской картой'
            ELSE 'Оплата через QR'
        END::payment_method,
        ceil(random() * n),
        ceil(random() * n)
    );
    i := i + 1;
END LOOP;
END $$;
