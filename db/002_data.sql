-- ==========================
-- DATA EN LA BASE DE DATOS
-- ==========================

-- Insertando tipos de producto
INSERT INTO product_type (description) VALUES ('L’Art Classique');
INSERT INTO product_type (description) VALUES ('Boho Chic');
INSERT INTO product_type (description) VALUES ('Vintage Elegance');
INSERT INTO product_type (description) VALUES ('Modern Minimal');
INSERT INTO product_type (description) VALUES ('Rustic Luxe');
INSERT INTO product_type (description) VALUES ('Jardin Enchanté');

-- Insertando productos con su tipo correspondiente
INSERT INTO products (name, description, price, product_type_id) VALUES 
('Set Imperial Dorado', 'Elegante juego de vajilla con detalles dorados y diseño barroco.', 350.00, 1),
('Colección Real Azul', 'Vajilla con tonos azul profundo y bordes dorados para cenas sofisticadas.', 420.00, 1),

('Set Naturaleza Boho', 'Vajilla con diseños florales en tonos tierra, perfecta para ambientes relajados.', 280.00, 2),
('Vajilla Étnica Orgánica', 'Inspirada en patrones étnicos con un toque moderno.', 310.00, 2),

('Set Perla Azul', 'Delicada vajilla en tonos azul perla con bordes plateados.', 390.00, 3),
('Vajilla Dorado Majestuoso', 'Conjunto de platos con detalles dorados y cristalería elegante.', 450.00, 3),

('Set Blanco Puro', 'Vajilla monocromática con líneas modernas y minimalistas.', 260.00, 5),
('Vajilla Negra Contemporánea', 'Diseño moderno en color negro mate con detalles dorados.', 310.00, 5),

('Set Rústico Campestre', 'Vajilla inspirada en la naturaleza con acabados en terracota.', 220.00, 4),
('Colección Madera y Arcilla', 'Perfecta combinación de madera y cerámica para un estilo auténtico.', 290.00, 4),

('Set Floral Encantado', 'Vajilla inspirada en jardines florales con colores vibrantes.', 275.00, 6),
('Colección Botánica Vintage', 'Vajilla con ilustraciones botánicas inspiradas en la naturaleza.', 325.00, 6);

-- Insertando imágenes de productos
INSERT INTO product_image (product_id, url) VALUES 
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/lart-classique-1_nlkoc4.webp'),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/lart-classique-1_nlkoc4.webp'),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/lart-classique-1_nlkoc4.webp'),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/lart-classique-1_nlkoc4.webp'),

(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664248/boho-chic-1_rzqgto.webp'),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664248/boho-chic-1_rzqgto.webp'),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664248/boho-chic-1_rzqgto.webp'),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664248/boho-chic-1_rzqgto.webp'),

(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/vintage-elegance-1_eqwu39.webp'),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/vintage-elegance-1_eqwu39.webp'),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/vintage-elegance-1_eqwu39.webp'),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/vintage-elegance-1_eqwu39.webp'),

(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/modern-minimal-1_hi4cld.webp'),
(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/modern-minimal-1_hi4cld.webp'),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/modern-minimal-1_hi4cld.webp'),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/modern-minimal-1_hi4cld.webp'),

(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/rustic-luxe-1_tdbxis.webp'),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/rustic-luxe-1_tdbxis.webp'),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/rustic-luxe-1_tdbxis.webp'),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/rustic-luxe-1_tdbxis.webp'),

(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/jardin-enchante-1_qqauf5.webp'),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/jardin-enchante-1_qqauf5.webp'),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/jardin-enchante-1_qqauf5.webp'),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/jardin-enchante-1_qqauf5.webp');

-- Insertando características generales de productos
INSERT INTO features (name, icon) VALUES 
('Diseño elegante', 'ElegantIcon'),
('Detalles dorados', 'GoldIcon'),
('Material ecológico', 'EcoIcon'),
('Hecho a mano', 'HandmadeIcon'),
('Resistente a golpes', 'ShockResistantIcon'),
('Apto para lavavajillas', 'DishwasherSafeIcon');

-- Relacionando productos con sus características
INSERT INTO product_features (product_id, feature_id) VALUES 
(1, 1), (1, 2), (1, 6),
(2, 1), (2, 2), (2, 6),

(3, 3), (3, 4), (3, 6),
(4, 3), (4, 4), (4, 6),

(5, 1), (5, 5), (5, 6),
(6, 1), (6, 2), (6, 5),

(7, 3), (7, 4), (7, 5),
(8, 3), (8, 4), (8, 5),

(9, 1), (9, 6), (9, 3),
(10, 1), (10, 2), (10, 6),

(11, 4), (11, 3), (11, 6),
(12, 4), (12, 3), (12, 6);
