DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO order_items (catalog_product_id, order_number, product_id) 
    VALUES(
        i,
        ceil(random() * n),
        ceil(random() * n)
    );
    i := i + 1;
END LOOP;
END $$;
