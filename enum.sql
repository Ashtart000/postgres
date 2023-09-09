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