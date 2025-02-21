-- ==========================
-- CONSTRAINTS EN LA BASE DE DATOS
-- ==========================

-- Evitar nombres duplicados en productos
ALTER TABLE products 
ADD CONSTRAINT unique_product_name UNIQUE (name);

-- Garantizar que el precio del producto sea positivo
ALTER TABLE products 
ADD CONSTRAINT check_positive_price CHECK (price > 0);