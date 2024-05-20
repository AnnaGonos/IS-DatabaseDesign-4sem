DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN
WHILE i <= n LOOP
    INSERT INTO bank_card (customer_id, card_number, cardholder_name, verification_code, expiration_date)
    VALUES (
        ceil(random() * n),
        floor(1000000000000000 + random() * 9000000000000000)::bigint,
        'Cardholder ' || i,
        (100 + random() * 900),
        CURRENT_DATE + INTERVAL '1 year' * (random()*5)
    );
    i := i + 1;
END LOOP;
END $$;