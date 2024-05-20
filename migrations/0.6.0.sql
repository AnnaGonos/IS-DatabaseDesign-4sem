DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO category (category_id, name) 
    VALUES(
        i,
        'Категория №' || i
    );
    i := i + 1;
END LOOP;
END $$;