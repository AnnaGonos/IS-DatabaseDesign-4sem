DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO employees (employee_id, position_id, full_name, passport_data, date_of_birth, inn, gender, phone, address)
    VALUES (
        i,
        ceil(random() * n),
        'ФИО' || i,
        TIMESTAMP '1950-01-01' + random() * (TIMESTAMP '2024-04-08' - TIMESTAMP '1950-01-01'),
        TIMESTAMP '1950-01-01' + random() * (TIMESTAMP '2024-04-08' - TIMESTAMP '1950-01-01'),
        'ИНН' || i,
        CASE round(random())
            WHEN 0 THEN 'M'
            WHEN 1 THEN 'Ж'
        END,
        '89' || (100000000 + i),
        'Адрес ' || i
    );
    i := i + 1;
END LOOP;
END $$;
