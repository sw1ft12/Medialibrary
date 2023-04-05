/* Исправление ошибки в имени */
UPDATE Medialibrary.Actors SET first_name = 'Райан', last_name = 'Гослинг' WHERE actor_id = 8;
/*Таблица актёров*/
SELECT * FROM Medialibrary.Actors;
/*Таблица фильмов*/
SELECT * FROM Medialibrary."Movie Library";
/*Таблица подробного описания фильма*/
SELECT * FROM Medialibrary."Movie Desctription";
/*Таблица жанров*/
SELECT * FROM Medialibrary."Genre";
/*Первый жанр в таблице*/
DELETE FROM Medialibrary.Genre WHERE genre_id = 1;
/*Изменение рейтинга фильма*/
UPDATE Medialibrary."Movie Library" SET rating = 8.0 WHERE name = 'Железный человек';
/*Фильмы с оценкой выше 8*/
SELECT name FROM Medialibrary."Movie Library" WHERE rating > 8;
/*Количество фильмов, снятых в США*/
SELECT COUNT(*) FROM Medialibrary.Actors WHERE country = 'США';
/*Фильм с самой высокой оценкой*/
SELECT name FROM Medialibrary."Movie Library" WHERE rating = (SELECT MAX(rating) FROM Medialibrary."Movie Library")
