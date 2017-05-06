DROP TABLE IF EXISTS adoptions;
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
  location VARCHAR(255)
);

