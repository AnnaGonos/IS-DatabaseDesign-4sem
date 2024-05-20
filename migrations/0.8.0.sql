DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
    WHILE i <= n LOOP
        INSERT INTO product (product_id, name, price, subcategory_id, weight, length, width, height, image, description, return_product, warranty)
        VALUES (
            i,
            'Товар ' || i,
            (random() * 1000)::decimal(10,2), 
            ceil(random() * n),
            (random() * 1000)::decimal(10,2),
            (random() * 1000)::decimal(10,2),
            (random() * 1000)::decimal(10,2), 
            (random() * 1000)::decimal(10,2), 
            'image_' || i || '.png',
            'Описание товара ' || i,
            CASE round(random())
                WHEN 0 THEN 'TRUE'
                ELSE 'FALSE'
            END::BOOL,
            floor(random() * 5) + 1 
        );
        i := i + 1;
    END LOOP;
END $$;