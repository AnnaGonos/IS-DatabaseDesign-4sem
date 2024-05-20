DO $$
DECLARE
    i INT := 1;
    n INT := 1000000; -- Количество желаемых записей
BEGIN
    WHILE i <= n LOOP 
        INSERT INTO customer (customer_id, password, email, full_name, address, birth_date, registration_date)
        VALUES (
            i, 
            CHR((97 + random() * 25)::INT) || CHR((97 + random() * 25)::INT) || CHR((97 + random() * 25)::INT) || 
            CHR((97 + random() * 25)::INT) || CHR((97 + random() * 25)::INT) || CHR((97 + random() * 25)::INT) || 
            round(1000 + random() * 8999), 
            'customer' || i || '@mail.ru',
            'ФИО' || i,
            'Адресс ' || i,
            TIMESTAMP '1950-01-01' + random() * (TIMESTAMP '2024-04-08' - TIMESTAMP '1950-01-01'),
            current_date
        );
    i := i + 1;
END LOOP;
END $$;



