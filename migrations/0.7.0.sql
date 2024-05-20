DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO subcategory (subcategory_id, category_id, name) 
    VALUES(
        i,
        ceil(random() * n),
        'Подкатегория №' || i
    );
    i := i + 1;
END LOOP;
END $$;