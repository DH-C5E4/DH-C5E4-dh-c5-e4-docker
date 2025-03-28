--drop tablespace if exists maisonTablespace;
--CREATE TABLESPACE maisonTablespace LOCATION '/var/lib/postgresql/data';

drop schema if exists public cascade;
create schema public;
set schema 'public';

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

create table if not exists products_rating (
	product_rating_id BIGSERIAL PRIMARY key,
	five_stars int2 default 0,
	four_stars int2 default 0,
	three_stars int2 default 0,
	two_stars int2 default 0,
	one_star int2 default 0
) TABLESPACE maisonTablespace;

-- Tabla de Productos (indexar tabla producto)
CREATE TABLE IF NOT EXISTS products (
    product_id BIGSERIAL PRIMARY key,
    category_id BIGINT NOT NULL,
    product_status_id BIGINT NOT NULL,
    product_rating_id BIGINT,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    cloudinary_folder VARCHAR(255),
    price NUMERIC(38,2) NOT NULL,
	quantity smallint not null,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
    FOREIGN KEY (product_status_id) REFERENCES product_status(product_status_id) ON DELETE cascade,
    FOREIGN KEY (product_rating_id) REFERENCES products_rating(product_rating_id)
    
) TABLESPACE maisonTablespace;

-- Tabla de Estado de Reservas
CREATE TABLE IF NOT EXISTS booking_status (
    booking_status_id BIGSERIAL PRIMARY KEY,
    status VARCHAR(255) NOT NULL
) TABLESPACE maisonTablespace;

-- Tabla de Dirección del Evento
CREATE TABLE IF NOT EXISTS event_address (
    event_address_id BIGSERIAL PRIMARY KEY,
    country varchar(50) not null,
    state VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    neighborhood varchar(255) not null
) TABLESPACE maisonTablespace;

-- Tabla de Reservas (Bookings)
CREATE TABLE IF NOT EXISTS bookings (
    booking_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    booking_status_id BIGINT NOT NULL,
    event_address_id BIGINT NOT NULL,
    event_date DATE NOT NULL,
    delivery_schedule DATE NOT NULL,
    collection_schedule DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email_sent BOOLEAN DEFAULT FALSE,
    folio varchar(15) UNIQUE,
    comment varchar(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (booking_status_id) REFERENCES booking_status(booking_status_id) ON DELETE CASCADE,
    FOREIGN KEY (event_address_id) REFERENCES event_address(event_address_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE cascade
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
CREATE TABLE IF NOT EXISTS customer_reviews (
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
CREATE INDEX idx_event_date ON bookings(event_date);
CREATE INDEX idx_customer_reviews_booking_id ON customer_reviews(booking_id);

--  función de validación
CREATE OR REPLACE FUNCTION check_product_availability()
RETURNS TRIGGER AS $$
DECLARE
    existing_booking INT;
BEGIN
    -- Verifica si ya hay una reserva para el mismo producto en las fechas dadas
    SELECT COUNT(*) INTO existing_booking
    FROM bookings
    WHERE product_id = NEW.product_id
    AND booking_status_id NOT IN (3, 4)  -- No considerar reservas COMPLETED o CANCELLED
    AND (
        delivery_schedule BETWEEN  NEW.delivery_schedule AND  NEW.collection_schedule
        OR event_date = BETWEEN  NEW.delivery_schedule AND  NEW.collection_schedule
        OR collection_schedule = BETWEEN  NEW.delivery_schedule AND  NEW.collection_schedule
    );

    -- Si ya hay una reserva en esas fechas, bloquear el INSERT
    IF existing_booking >= 1 THEN
        RAISE EXCEPTION 'El producto ya está reservado en una de las fechas seleccionadas';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER prevent_duplicate_booking
BEFORE INSERT ON bookings
FOR EACH ROW
EXECUTE FUNCTION check_product_availability();