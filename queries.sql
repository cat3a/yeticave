/* Заполняем таблицу category: */

INSERT category(category_code, name) VALUES ('boards','Доски и лыжи');
INSERT category(category_code, name) VALUES ('attachment','Крепления');
INSERT category(category_code, name) VALUES ('boots','Ботинки');
INSERT category(category_code, name) VALUES ('clothing','Одежда');
INSERT category(category_code, name) VALUES ('tools','Инструменты');
INSERT category(category_code, name) VALUES ('other','Разное');

/* Добавляем пользователей в таблицу user_info: */

INSERT user_info(login, email, password, contact) VALUES ('admin', 'admin@gmail.com', '7488e331b8b64e5794da3fa4eb10ad5d', 'тел: 1-650-555-5555, New York city');
INSERT user_info(login, email, password, contact) VALUES ('user', 'user@gmail.com', '974c3591ba68914bb9a38522ca2a2ba7', 'тел: 1-650-999-9999, 3180 S Le Jeune Rd, Miami, FL 33134');

/* Заполеняем таблицу lot: */

INSERT lot(date_create, name_lot, description, image, start_price, end_date, rate_step, category_code, login)
VALUES ('2020-10-17 02:35:43', '2014 Rossignol District Snowboard', '2014 Rossignol District Snowboard', 'img/lot-1.jpg', 10999, '2022-07-05', 0.5, 'boards', 'user');
INSERT lot(date_create, name_lot, description, image, start_price, end_date, rate_step, category_code, login)
VALUES ('2021-08-10 05:44:40', 'DC Ply Mens 2016/2017 Snowboard', 'DC Snowboard', 'img/lot-2.jpg', 159999, '2022-06-02', 0.7, 'boards', 'user');
INSERT lot(date_create, name_lot, description, image, start_price, end_date, rate_step, category_code, login)
VALUES ('2022-05-23 08:35:50', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Крепления Union Contact Pro', 'img/lot-3.jpg', 8000, '2022-08-10', 1, 'attachment', 'admin');
INSERT lot(date_create, name_lot, description, image, start_price, end_date, rate_step, category_code, login)
VALUES ('2020-06-1 23:23:43', 'Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки для сноуборда', 'img/lot-4.jpg', 10999, '2022-06-21', 1, 'boots', 'admin');
INSERT lot(date_create, name_lot, description, image, start_price, end_date, rate_step, category_code, login)
VALUES ('2022-03-04 18:12:02', 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка', 'img/lot-5.jpg', 7500, '2022-07-15', 0.5, 'clothing', 'user');
INSERT lot(date_create, name_lot, description, image, start_price, end_date, rate_step, category_code, login)
VALUES ('2021-04-20 12:10:10', 'Маска Oakley Canopy', 'Маска Oakley Canopy', 'img/lot-6.jpg', 5400, '2022-07-25', 0.6, 'other', 'user');

/* Создаем несколько ставок для объявлений в таблице rate: */

INSERT rate(date_create, sum, login, id_lot) VALUES ('2022-04-05 23:13:10', 16498.5, 'admin', 1);
INSERT rate(date_create, sum, login, id_lot) VALUES ('2022-05-07 11:30:44', 24747.75, 'user', 1);
INSERT rate(date_create, sum, login, id_lot) VALUES ('2022-05-30 13:30:22', 37121.66, 'admin', 1);
INSERT rate(date_create, sum, login, id_lot) VALUES ('2022-06-01 15:12:10', 400000, 'admin', 2);
INSERT rate(date_create, sum, login, id_lot) VALUES ('2022-06-16 08:15:20', 20000, 'user', 3);

/* Получаем все категории. */

SELECT name FROM category;

/* Получаем самые новые открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, название категории. */

SELECT lot.name_lot, lot.start_price, lot.image, MAX(rate.sum), category.name
FROM lot INNER JOIN rate ON lot.id_lot = rate.id_lot INNER JOIN category ON lot.category_code = category.category_code
WHERE end_date >= NOW()
GROUP BY lot.name_lot, lot.date_create, lot.start_price, lot.image, category.name
ORDER BY lot.date_create DESC LIMIT 3;

/* Показываем лот по его ID. Получаем также название категории, к которой принадлежит лот. */

SELECT lot.name_lot, category.name
FROM lot INNER JOIN category ON lot.category_code = category.category_code
WHERE lot.id_lot = 5 /* Нужный id */;

/* Обновляем название лота по его идентификатору. */

UPDATE lot SET name_lot = CONCAT(name_lot, 500) /* Здесь пишем на что обновляем. */ WHERE id_lot = 1 /* Нужный id */;

/* Получаем список ставок для лота по его идентификатору с сортировкой по дате. */

SELECT rate.login, rate.sum, rate.date_create
FROM lot INNER JOIN rate ON lot.id_lot = rate.id_lot
WHERE lot.id_lot = 1 /* Нужный id */
ORDER BY rate.date_create DESC;
