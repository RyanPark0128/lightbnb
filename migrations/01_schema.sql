DROP TABLE IF EXISTS property_reviews CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255),
    description TEXT,
    thumbnail_photo_url TEXT,
    cover_photo_url TEXT,
    cost_per_night INTEGER,
    parking_spaces INTEGER,
    number_of_bathrooms INTEGER,
    number_of_bedrooms INTEGER,
    country VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(255),
    post_code VARCHAR(255),
    active BOOLEAN
);

CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
    guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    start_date DATE,
    end_date DATE
);

CREATE TABLE property_reviews (
    property_review_id SERIAL PRIMARY KEY,
    guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    reservation_id INTEGER NOT NULL REFERENCES reservations(id) ON DELETE CASCADE,
    property_id INTEGER NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
    rating INTEGER,
    message TEXT
);