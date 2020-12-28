SELECT * from product inner join category c on c.id = product.category_id;

SELECT * FROM product LEFT JOIN category c on product.category_id = c.id;

SELECT * FROM product right JOIN category c on product.category_id = c.id;

SELECT * FROM product full JOIN category c on product.category_id = c.id;

SELECT * FROM product CROSS JOIN category;

SELECT * FROM product NATURAL JOIN category;

SELECT * FROM customer WHERE id IN (
    SELECT id_customer FROM payment);

SELECT * FROM product
CROSS JOIN LATERAL (SELECT * FROM category WHERE category.id = product.category_id) m;
