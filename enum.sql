/* ENUM */

---order status:
-- true - виконано
-- false - не виконано

SELECT * FROM orders
WHERE status = true;


--- 'processing' --- 'prosesing' --- '...' --- '...'

---new
---processing
---shiped
---done

CREATE TYPE order_status AS ENUM('new', 'processing', 'shiped', 'done');

ALTER TABLE orders ALTER COLUMN status TYPE order_status
USING (
    CASE status
        WHEN true THEN 'done'
        WHEN false THEN 'processing'
        ELSE 'new'
    END
)::order_status;


INSERT INTO orders (customer_id, status)
VALUES (
    10,
    'new'
  );

UPDATE orders SET status = 'shiped' WHERE id = 10;


DROP VIEW 
all_users_with_all_orders, orders_with_price, users_orders_amount, users_with_sum;


-------------------------------------------------
CREATE SCHEMA newtask;

---Задача: створити таблицю users у схемі newtask

CREATE TABLE newtask.users(
    id serial PRIMARY KEY,
    login VARCHAR(256) NOT NULL CHECK(login != '') UNIQUE,
    email VARCHAR(256) NOT NULL CHECK(login != ''),
    password VARCHAR(256) NOT NULL CHECK(login != '')
);

CREATE TABLE newtask.employees(
    name VARCHAR(256) NOT NULL CHECK(name != ''),
    salary int NOT NULL CHECK(salary > 0),
    department VARCHAR(256) NOT NULL CHECK(department != ''),
    position VARCHAR(256) NOT NULL CHECK(position!= ''),
    hire_date date DEFAULT current_date
);

/*
ДЗ. Вирішити проблеми:
1. Відсутність ключа у юзерів. Ключем має бути мейл
2. Надлишкові дані про співробітників потребують нормалізації.
Провести декомпозицію таблиці employees на дві таблиці:
співробітники та відділи
(-) 3. Зберігання паролю у сирому вигляді. Паролі мають зберігатись у захешованому вигляді
password -> password_hash
*/

ALTER TABLE newtask.users DROP COLUMN id;
ALTER TABLE newtask.users ADD PRIMARY KEY (email);

ALTER TABLE newtask.employees
ADD COLUMN id serial PRIMARY KEY;

-- 2

CREATE TABLE newtask.positions(
    id serial PRIMARY KEY,
    department varchar(200) NOT NULL CHECK(department != ''),
    position varchar(200) NOT NULL CHECK(position != '')
);

ALTER TABLE newtask.employees
DROP COLUMN department;

ALTER TABLE newtask.employees
DROP COLUMN position;

ALTER TABLE newtask.employees
ADD COLUMN position_id int REFERENCES newtask.positions(id);