INSERT INTO product_status (description) VALUES 
('Disponible'),
('Agotado'),
('En Oferta'),
('Descontinuado');

INSERT INTO categories (title, description, image) VALUES 
('L’Art Classique', 'Categoría de vajilla con diseños clásicos y elegantes.', 'art-classique.jpg'),
('Boho Chic', 'Estilo bohemio con patrones naturales y coloridos.', 'boho-chic.jpg'),
('Vintage Elegance', 'Diseños vintage con toques elegantes.', 'vintage-elegance.jpg'),
('Modern Minimal', 'Estilo moderno con diseños limpios y minimalistas.', 'modern-minimal.jpg'),
('Rustic Luxe', 'Combinación de lujo con elementos rústicos.', 'rustic-luxe.jpg'),
('Jardin Enchanté', 'Inspiración en la naturaleza y jardines.', 'jardin-enchante.jpg');

INSERT INTO products (name, description, price, category_id, product_status_id, main_image_url) VALUES 
('Set Imperial Dorado', 'Elegante juego de vajilla con detalles dorados y diseño barroco.', 350.00, 1, 1, 'imperial-dorado.jpg'),
('Colección Real Azul', 'Vajilla con tonos azul profundo y bordes dorados para cenas sofisticadas.', 420.00, 1, 1, 'real-azul.jpg'),

('Set Naturaleza Boho', 'Vajilla con diseños florales en tonos tierra, perfecta para ambientes relajados.', 280.00, 2, 1, 'naturaleza-boho.jpg'),
('Vajilla Étnica Orgánica', 'Inspirada en patrones étnicos con un toque moderno.', 310.00, 2, 1, 'etnica-organica.jpg'),

('Set Perla Azul', 'Delicada vajilla en tonos azul perla con bordes plateados.', 390.00, 3, 1, 'perla-azul.jpg'),
('Vajilla Dorado Majestuoso', 'Conjunto de platos con detalles dorados y cristalería elegante.', 450.00, 3, 1, 'dorado-majestuoso.jpg'),

('Set Blanco Puro', 'Vajilla monocromática con líneas modernas y minimalistas.', 260.00, 4, 1, 'blanco-puro.jpg'),
('Vajilla Negra Contemporánea', 'Diseño moderno en color negro mate con detalles dorados.', 310.00, 4, 1, 'negra-contemporanea.jpg'),

('Set Rústico Campestre', 'Vajilla inspirada en la naturaleza con acabados en terracota.', 220.00, 5, 1, 'rustico-campestre.jpg'),
('Colección Madera y Arcilla', 'Perfecta combinación de madera y cerámica para un estilo auténtico.', 290.00, 5, 1, 'madera-arcilla.jpg'),

('Set Floral Encantado', 'Vajilla inspirada en jardines florales con colores vibrantes.', 275.00, 6, 1, 'floral-encantado.jpg'),
('Colección Botánica Vintage', 'Vajilla con ilustraciones botánicas inspiradas en la naturaleza.', 325.00, 6, 1, 'botanica-vintage.jpg');

INSERT INTO product_images (product_id, url) VALUES 
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/lart-classique-1_nlkoc4.webp'),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/lart-classique-1_nlkoc4.webp'),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664248/boho-chic-1_rzqgto.webp'),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664248/boho-chic-1_rzqgto.webp'),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/vintage-elegance-1_eqwu39.webp'),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1739664249/vintage-elegance-1_eqwu39.webp');

INSERT INTO attributes (description, icon) VALUES 
('Diseño elegante', 'ElegantIcon'),
('Detalles dorados', 'GoldIcon'),
('Material ecológico', 'EcoIcon'),
('Hecho a mano', 'HandmadeIcon'),
('Resistente a golpes', 'ShockResistantIcon'),
('Apto para lavavajillas', 'DishwasherSafeIcon');

INSERT INTO product_attributes (product_id, attribute_id) VALUES 
(1, 1), (1, 2), (1, 6),
(2, 1), (2, 2), (2, 6),
(3, 3), (3, 4), (3, 6),
(4, 3), (4, 4), (4, 6);

INSERT INTO users (name, surname, email, password) VALUES 
('Admin', 'SuperUser', 'admin@example.com', 'adminpassword'),
('Juan', 'Pérez', 'juan@example.com', 'password123'),
('Maria', 'Gomez', 'maria@example.com', 'password123'),
('Carlos', 'Rodriguez', 'carlos@example.com', 'password123'),
('Luisa', 'Fernandez', 'luisa@example.com', 'password123');

INSERT INTO roles (role_name) VALUES 
('ADMIN'),
('CLIENT');

INSERT INTO user_roles (user_id, role_id) VALUES 
(1, 1),  
(2, 2),  
(3, 2), 
(4, 2), 
(5, 2);
