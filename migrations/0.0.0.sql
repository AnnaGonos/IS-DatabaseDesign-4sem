DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'pos') THEN
        CREATE TYPE pos AS ENUM (
            'Администратор', 
            'Менеджер'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'review_type') THEN
        CREATE TYPE review_type AS ENUM (
            'Создан',
            'В обработке',
            'Выполнен',
            'Отменен'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'order_status') THEN
        CREATE TYPE order_status AS ENUM (
            'Создан',
            'В обработке',
            'Выполнен',
            'Отменен'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'payment_method') THEN
        CREATE TYPE payment_method AS ENUM (
            'Наличные', 
            'Кредитная карта', 
            'Банковской картой',
            'Оплата через QR'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'delivery_status') THEN
        CREATE TYPE delivery_status AS ENUM (
            'В процессе доставки',
            'Доставлен',
            'Возвращен'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'delivery_type') THEN
        CREATE TYPE delivery_type AS ENUM (
            'Курьером',
            'Грузовой транспорт'
        );
    END IF;
END
$$;



