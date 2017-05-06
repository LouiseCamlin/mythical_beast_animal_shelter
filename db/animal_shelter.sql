DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  gender VARCHAR(255),
  admission_date DATE,
  breed VARCHAR(255),
  ready_to_adopt BOOLEAN
);


CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  animal_id INT4 REFERENCES animals(id) ON DELETE CASCADE
);

