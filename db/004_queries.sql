-- ==========================
-- QUERIES EN LA BASE DE DATOS
-- ==========================

SELECT 
    p.product_id AS id, 
    p.name, 
    p.description, 
    p.price, 
    c.title AS category, 
    json_agg(DISTINCT i.url) AS images, 
    json_agg(DISTINCT jsonb_build_object(
        'id', a.attribute_id, 
        'name', a.description, 
        'icon', a.icon
    )) AS features
FROM products p
JOIN categories c ON p.category_id = c.category_id
LEFT JOIN product_images i ON p.product_id = i.product_id
LEFT JOIN product_attributes pa ON p.product_id = pa.product_id
LEFT JOIN attributes a ON pa.attribute_id = a.attribute_id
GROUP BY p.product_id, c.title;
