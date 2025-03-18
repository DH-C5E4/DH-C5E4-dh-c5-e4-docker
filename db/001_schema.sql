drop tablespace if exists maisonTablespace;

CREATE TABLESPACE maisonTablespace LOCATION '/var/lib/postgresql/data';

-- drop EXTENSION if exists unaccent;
create extension if not exists unaccent schema public;

-- Tabla de Roles
CREATE TABLE IF NOT EXISTS roles (
    role_id BIGSERIAL PRIMARY KEY,
    role_name VARCHAR(255) UNIQUE NOT NULL
) TABLESPACE maisonTablespace;

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS users (
    user_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id BIGINT  NOT NULL, -- Relación uno a uno
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
) TABLESPACE maisonTablespace;

-- Manejo de sesiones
CREATE TABLE tokens (
	token_id BIGSERIAL PRIMARY KEY,
	"token" varchar(255) NOT NULL,
	expired boolean NOT NULL,
	revoked boolean NOT NULL,
	user_id bigserial NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
) TABLESPACE maisonTablespace;

-- Tabla de Categoría de Productos
CREATE TABLE IF NOT EXISTS categories (
    category_id BIGSERIAL PRIMARY KEY,
    is_active BOOLEAN DEFAULT TRUE,
    title VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    cloudinary_folder VARCHAR(255) NULL,
    public_id VARCHAR(255) NULL,
    image VARCHAR(255)
) TABLESPACE maisonTablespace;

-- Tabla de Estado de Productos
CREATE TABLE IF NOT EXISTS product_status (
    product_status_id BIGSERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL
) TABLESPACE maisonTablespace;

-- Tabla de Dirección del Evento
CREATE TABLE IF NOT EXISTS event_address (
    event_address_id BIGSERIAL PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    postal_code VARCHAR(15) NOT NULL    
) TABLESPACE maisonTablespace;

-- Tabla de Productos (indexar tabla producto)
CREATE TABLE IF NOT EXISTS products (
    product_id BIGSERIAL PRIMARY key,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    category_id BIGINT NOT NULL,
    product_status_id BIGINT NOT NULL,
    cloudinary_folder VARCHAR(255),
    price NUMERIC(38,2) NOT NULL,
	quantity smallint not null,
    rating_average NUMERIC(38,2) DEFAULT 0,
    total_sum_review INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
    FOREIGN KEY (product_status_id) REFERENCES product_status(product_status_id) ON DELETE cascade
) TABLESPACE maisonTablespace;

-- Tabla de Estado de Reservas
CREATE TABLE IF NOT EXISTS booking_status (
    booking_status_id BIGSERIAL PRIMARY KEY,
    status VARCHAR(255) NOT NULL
) TABLESPACE maisonTablespace;

-- Tabla de Reservas (Bookings)
CREATE TABLE IF NOT EXISTS bookings (
    booking_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    booking_status_id BIGINT NOT NULL,
    event_address_id BIGINT NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    booking_date DATE NOT NULL,
    number_guests INT NOT NULL,
    delivery_schedule TIMESTAMP NOT NULL,
    collection_schedule TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email_sent BOOLEAN DEFAULT FALSE,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (booking_status_id) REFERENCES booking_status(booking_status_id) ON DELETE CASCADE,
    FOREIGN KEY (event_address_id) REFERENCES event_address(event_address_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
) TABLESPACE maisonTablespace;

-- Tabla de Imágenes de Productos
CREATE TABLE IF NOT EXISTS product_images (
    product_image_id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    url VARCHAR(255) NOT NULL,
    public_id VARCHAR(200) NOT NULL,
    is_main BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
) TABLESPACE maisonTablespace;

-- Tabla de Características de Productos
CREATE TABLE IF NOT EXISTS attributes (
    attribute_id BIGSERIAL PRIMARY KEY,
    is_active BOOLEAN DEFAULT TRUE,
    icon VARCHAR(150) NOT NULL,
    description VARCHAR(255) UNIQUE NOT NULL
) TABLESPACE maisonTablespace;

-- Relación Producto - Características (Muchos a Muchos)
CREATE TABLE IF NOT EXISTS product_attributes (
    product_attributes_id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    attribute_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (attribute_id) REFERENCES attributes(attribute_id) ON DELETE CASCADE
) TABLESPACE maisonTablespace;

-- Tabla de Favoritos
CREATE TABLE IF NOT EXISTS favorites (
    favorite_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
) TABLESPACE maisonTablespace;

-- Tabla de Reseñas de Clientes
CREATE TABLE IF NOT EXISTS customer_review (
    customer_review_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    booking_id BIGINT NOT NULL,
    rating smallint NOT NULL,
    title varchar(200) NOT null,
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
) TABLESPACE maisonTablespace;


CREATE INDEX idx_product_name ON products(name);
CREATE INDEX idx_booking_date ON bookings(booking_date);
CREATE INDEX idx_customer_review_booking_id ON customer_review(booking_id);

CREATE OR REPLACE FUNCTION update_product_rating()
RETURNS TRIGGER AS $$
DECLARE
    v_product_id BIGINT;
BEGIN
    -- Obtener el product_id asociado al booking_id de la reseña
    SELECT p.product_id INTO v_product_id
    FROM bookings b
    JOIN products p ON b.product_id = p.product_id
    WHERE b.booking_id = NEW.booking_id;

    -- Si el product_id existe
    IF v_product_id IS NOT NULL THEN
        -- Actualizar el rating en la tabla products
        UPDATE products
        SET rating_average = (
            SELECT COALESCE(AVG(rating), 0) 
            FROM customer_review 
            WHERE booking_id IN (
                SELECT booking_id FROM bookings WHERE product_id = v_product_id
            )
        ),
        total_sum_review = (
            SELECT COUNT(*) 
            FROM customer_review 
            WHERE booking_id IN (
                SELECT booking_id FROM bookings WHERE product_id = v_product_id
            )
        )
        WHERE product_id = v_product_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_rating
AFTER INSERT ON customer_review
FOR EACH ROW
EXECUTE FUNCTION update_product_rating();