DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO positions (position_id, position_name, salary) 
    VALUES(
        i,
        CASE round(random())
            WHEN 0 THEN 'Администратор'
            ELSE 'Менеджер' 
        END::pos,
        (random() * 1000)::decimal(10,2)
    );
    i := i + 1;
END LOOP;
END $$;