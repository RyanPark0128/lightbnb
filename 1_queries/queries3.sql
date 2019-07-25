SELECT property_id as id, owner_id, title, description, thumbnail_photo_url as thumbnail, cover_photo_url as coverphoto, cost_per_night as costnight, parking_spaces, number_of_bathrooms as bathrooms, number_of_bedrooms, country, street, city, province, post_code, active
FROM properties
JOIN property_reviews ON properties.property_id = properties(property_id)
ORDER BY rating DESC
