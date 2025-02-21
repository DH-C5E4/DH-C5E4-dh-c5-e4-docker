-- ==========================
-- QUERIES EN LA BASE DE DATOS
-- ==========================

SELECT p.id, p.name, p.description, p.price, c.description AS product_type, 
    json_agg(DISTINCT i.url) AS images, 
    json_agg(DISTINCT jsonb_build_object('id', a.id, 'name', a.name, 'icon', a.icon)) AS features
FROM products p
JOIN product_type c ON p.product_type_id = c.id
LEFT JOIN product_image i ON p.id = i.product_id
LEFT JOIN product_features pa ON p.id = pa.product_id
LEFT JOIN features a ON pa.feature_id = a.id
GROUP BY p.id, c.description;
