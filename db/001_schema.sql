CREATE TABLESPACE mytablespace LOCATION '/var/lib/postgresql/data';

-- Tabla de Categorías
CREATE TABLE IF NOT EXISTS categories (
    category_id BIGSERIAL PRIMARY KEY,
    is_active BOOLEAN DEFAULT TRUE,
    title VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    cloudinary_folder VARCHAR(255) NULL,
    public_id VARCHAR(255) NULL,
    image VARCHAR(255)
    
) TABLESPACE mytablespace;

-- Tabla de Estado de Productos
CREATE TABLE IF NOT EXISTS product_status (
    product_status_id BIGSERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL
) TABLESPACE mytablespace;

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS products (
    product_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    price NUMERIC(38,2) NOT NULL,
    category_id BIGINT NOT NULL,
    product_status_id BIGINT NOT NULL,
    cloudinary_folder VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
    FOREIGN KEY (product_status_id) REFERENCES product_status(product_status_id) ON DELETE CASCADE
) TABLESPACE mytablespace;

-- Tabla de Imágenes de Productos
CREATE TABLE IF NOT EXISTS product_images (
    product_image_id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    url VARCHAR(255) NOT NULL,
    public_id VARCHAR(200) NOT NULL,
    is_main BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
) TABLESPACE mytablespace;

-- Tabla de Características de Productos
CREATE TABLE IF NOT EXISTS attributes (
    attribute_id BIGSERIAL PRIMARY KEY,
    is_active BOOLEAN DEFAULT TRUE,
    icon VARCHAR(150) NOT NULL,
    description VARCHAR(255) UNIQUE NOT NULL
) TABLESPACE mytablespace;

-- Relación Producto - Características (Muchos a Muchos)
CREATE TABLE IF NOT EXISTS product_attributes (
    product_attributes_id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    attribute_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (attribute_id) REFERENCES attributes(attribute_id) ON DELETE CASCADE
) TABLESPACE mytablespace;

-- Tabla de Roles
CREATE TABLE IF NOT EXISTS roles (
    role_id BIGSERIAL PRIMARY KEY,
    role_name VARCHAR(255) UNIQUE NOT NULL
) TABLESPACE mytablespace;

-- Tabla de Usuarios con relación 1 a 1 con Roles
CREATE TABLE IF NOT EXISTS users (
    user_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id BIGINT UNIQUE NOT NULL,  -- Relación uno a uno
    is_active boolean default true,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
) TABLESPACE mytablespace;

-- Relación Usuarios - Productos (Usuarios que poseen productos)
CREATE TABLE IF NOT EXISTS product_users (
    product_users_id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) TABLESPACE mytablespace;
