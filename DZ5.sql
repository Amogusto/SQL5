ALTER TABLE users DROP COLUMN updated_at;
ALTER TABLE users DROP COLUMN created_at;

ALTER TABLE users ADD COLUMN updated_at VARCHAR(50);
ALTER TABLE users ADD COLUMN created_at VARCHAR(50);


-- 1. 
UPDATE users 
	SET created_at = NOW(), updated_at = NOW();
	
-- 2.
 UPDATE users 
 	SET 
 	created_at = STR_TO_DATE(created_at, '%Y-%m-%d %k:%i:%s'),
 	updated_at = STR_TO_DATE(created_at, '%Y-%m-%d %k:%i:%s');
 	
 ALTER TABLE users MODIFY COLUMN created_at DATETIME NULL;
 ALTER TABLE users MODIFY COLUMN updated_at DATETIME NULL;

-- 3.

INSERT INTO storehouses_products (id, storehouse_id, product_id, value,created_at, updated_at)
VALUES
(1, 1, 1, 3, NOW(), NOW()),
(2, 2, 2, 0, NOW(), NOW()),
(3, 1, 3, 3, NOW(), NOW()),
(4, 1, 4, 2, NOW(), NOW()),
(5, 3, 5, 13, NOW(), NOW()),
(6, 3, 6, 0, NOW(), NOW()),
(7, 1, 7, 3, NOW(), NOW()),
(8, 1, 8, 1, NOW(), NOW()),
(9, 5, 9, 2, NOW(), NOW()),
(10, 5, 10, 6, NOW(), NOW()),
(11, 4, 11, 7, NOW(), NOW());

SELECT * from storehouses_products 
ORDER BY CASE WHEN value = 0 THEN 999999 ELSE value END;
 
-- 4. 
SELECT * FROM users WHERE birthday_at RLIKE '^[0-9]{4}-(05|08)-[09]{2}';




-- Практическое задание по теме агрегация данных

-- 1.
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) FROM users;

-- 2. 
SELECT 
DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day, 
count(*) AS total from users
GROUP BY DAY;
-- 3.
SELECT round(exp(sum(id))), 10) from users;