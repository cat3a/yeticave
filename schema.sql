DROP DATABASE IF EXISTS yeticave;
CREATE DATABASE yeticave
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE category (
  id_category INT AUTO_INCREMENT PRIMARY KEY,
  category_code CHAR(128) NOT NULL UNIQUE,
  name CHAR(128) NOT NULL UNIQUE
);

CREATE TABLE user_info (
  id_user INT AUTO_INCREMENT PRIMARY KEY,
  login CHAR(128) NOT NULL UNIQUE,
  registration_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  email CHAR(128) NOT NULL UNIQUE,
  password CHAR(32) NOT NULL,
  contact TEXT NOT NULL
);

CREATE TABLE lot (
  id_lot INT AUTO_INCREMENT PRIMARY KEY,
  date_create DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  name_lot CHAR(128) NOT NULL,
  description TEXT NOT NULL,
  image TEXT NOT NULL,
  start_price DECIMAL(10,2) NOT NULL,
  end_date DATE NOT NULL,
  rate_step DECIMAL(10,2) NOT NULL,
  category_code CHAR(128) NOT NULL,
  login CHAR(128) NOT NULL,
  winner CHAR(128),
  FOREIGN KEY (category_code) REFERENCES category (category_code),
  FOREIGN KEY (login) REFERENCES user_info (login),
  FOREIGN KEY (winner) REFERENCES user_info (login)
);

CREATE FULLTEXT INDEX lot_search ON lot (name_lot, description);
CREATE INDEX lot_date ON lot (date_create);
CREATE INDEX lot_show ON lot (id_lot);

CREATE TABLE rate (
  id_rate INT AUTO_INCREMENT PRIMARY KEY,
  date_create DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  sum DECIMAL(10,2) NOT NULL,
  login CHAR(128) NOT NULL,
  id_lot INT NOT NULL,
  FOREIGN KEY (login)  REFERENCES user_info (login),
  FOREIGN KEY (id_lot)  REFERENCES lot (id_lot)
);

CREATE INDEX rate_show ON rate (id_rate);
CREATE INDEX rate_date ON rate(date_create);
