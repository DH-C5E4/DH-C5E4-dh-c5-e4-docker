-- ==========================
-- SCHEMA EN LA BASE DE DATOS
-- ==========================

CREATE TABLE product_type (
    id SERIAL PRIMARY KEY,
    description VARCHAR(100) NOT NULL
);

CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    product_type_id INT NOT NULL,
    FOREIGN KEY (product_type_id) REFERENCES product_type(id) ON DELETE CASCADE
);


CREATE TABLE product_image (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    url TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);


CREATE TABLE features(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    icon VARCHAR(100) NOT NULL
);

CREATE TABLE product_features (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    feature_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (feature_id) REFERENCES features(id) ON DELETE CASCADE
);
