SELECT * FROM a, b
WHERE A.v = B.v;


-----
SELECT * FROM
A JOIN B
ON A.v = B.v;


----- Знайти всі замовлення юзера, у якого id = 5
SELECT * FROM users JOIN orders
ON users.id = orders.customer_id;

SELECT u.id AS "user_id", u.first_name, u.last_name, u.email, o.id AS "order_id", o.created_at FROM users AS u JOIN orders AS o
ON u.id = o.customer_id
WHERE u.id IN (5, 988, 989);


----- Знайти id всіх замовлень у чеку, де були замовлені телефони бренду Huawei
SELECT * FROM 
orders_to_products JOIN products
ON orders_to_products.product_id = products.id
WHERE products.brand = 'Huawei';


----- Порахувати скільки замовлень бренду Huawei всього було
SELECT count(*) FROM 
orders_to_products JOIN products
ON orders_to_products.product_id = products.id
WHERE products.brand = 'Huawei';


----- Зробити топ продажів, який бренд частіше за всіх купували
SELECT p.brand, count(*) FROM 
orders_to_products AS otp JOIN products AS p
ON otp.product_id = p.id
GROUP BY p.brand
ORDER BY count DESC;


-- Знайти всіх юзерів, які нічого не замовляли (JOIN)

-- version 1
SELECT u.*, count(*) FROM
users AS u JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id;

SELECT * FROM
users AS u LEFT JOIN orders AS o
ON u.id = o.customer_id
WHERE o.customer_id IS NULL;

--2
SELECT * FROM users
WHERE id IN (
  SELECT id FROM users
  EXCEPT
  SELECT customer_id FROM orders
);

-----
INSERT INTO products (
    brand,
    model,
    description,
    price,
    discounted_price,
    quantity
  )
VALUES (
    'Motorola',
    'G7',
    'phones...',
    20000,
    10000,
    15
  ) RETURNING *;


-- Знайти телефони, які ніхто ніколи не купував
SELECT * FROM
products LEFT JOIN orders_to_products
ON products.id = orders_to_products.product_id
WHERE orders_to_products.product_id IS NULL;


-- Знайти повну вартість кожного замовлення
SELECT otp.order_id, sum(p.price * otp.quantity) FROM
products AS p INNER JOIN orders_to_products AS otp
ON p.id = otp.product_id
GROUP BY otp.order_id
ORDER BY sum DESC;


-- Знайти кількість позицій в кожному замовленні
SELECT order_id, count(*)
FROM orders_to_products
GROUP BY order_id;


-- Знайти найпопулярніший товар
SELECT p.id, p.brand, p.model, sum(otp.quantity) FROM
products AS p JOIN orders_to_products AS otp
ON p.id = otp.product_id
GROUP BY p.id
ORDER BY sum DESC
LIMIT 1;


-- Середній чек по всьому магазину
SELECT avg(owc.total) FROM 
  (SELECT otp.order_id, sum(p.price * otp.quantity) AS total FROM
  products AS p INNER JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  GROUP BY otp.order_id)
AS owc;


-- Витягти всі замовлення вище середнього чеку
SELECT * FROM 
  (SELECT otp.order_id, sum(p.price * otp.quantity) AS total FROM
  products AS p INNER JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  GROUP BY otp.order_id)
AS owc
WHERE owc.total > (
  SELECT avg(owc.total) FROM 
  (SELECT otp.order_id, sum(p.price * otp.quantity) AS total FROM
  products AS p INNER JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  GROUP BY otp.order_id)
AS owc
);


WITH orders_with_total AS (
  SELECT otp.order_id, sum(p.price * otp.quantity) AS total FROM
  products AS p INNER JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  GROUP BY otp.order_id
)
SELECT * FROM orders_with_total 
WHERE orders_with_total.total > (
  SELECT avg(orders_with_total.total) FROM orders_with_total
);


-- Витягти всіх користувачів, я якіх замовлення вище середнього
WITH orders_with_count AS (
  -- Кількість замовлень кожного користувача
  SELECT customer_id, count(*) AS orders_count FROM
  orders 
  GROUP BY customer_id
) 
SELECT * FROM 
orders_with_count JOIN users
ON orders_with_count.customer_id = users.id
WHERE orders_count > (
  -- середня кількість замовлень
  SELECT avg(orders_count) FROM orders_with_count
);


-- Витягти користувачів та кількість товару, які вони замовляли (сума по otp.quantity)
SELECT u.id, u.first_name, u.last_name, sum(otp.quantity) FROM 
users AS u JOIN orders AS o
ON u.id = o.customer_id
JOIN orders_to_products AS otp
ON o.id = otp.order_id
GROUP BY u.id;
