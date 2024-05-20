DO $$
DECLARE
    n INT := 1000000;
    i INT := 1;
BEGIN 
  WHILE i <= n LOOP
    INSERT INTO customer_phone (phone, customer_id)
    VALUES (
      '89' || (100000000 + i),
      ceil(random() * n) 
    );
    i := i + 1;
  END LOOP;
END $$;


