DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
    WHILE i <= n LOOP
        INSERT INTO product_rating (product_id, customer_id, rating)
        VALUES (
            ceil(random() * n),
            ceil(random() * n),
            (random() * 5)::decimal(2,1)
        );
        i := i + 1;
    END LOOP;
END $$;