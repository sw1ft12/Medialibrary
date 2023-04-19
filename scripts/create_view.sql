/*Информация об актерё со скрытыми именем и фамилией*/
CREATE VIEW Medialibrary.protected_actor_info AS
SELECT md5(first_name) AS actor_name, md5(last_name) AS actor_surname, country FROM Medialibrary.Actors;

/*Информация о фильме со скрытым описанием сюжета*/

CREATE VIEW Medialibrary.protected_movie_description AS
SELECT name, md5(description) AS movie_description, country, duration, date FROM Medialibrary."Movie Description";

/*Подробная информация о фильме*/

CREATE VIEW Medialibrary.movie_info AS
    SELECT ml.name, rating, country, duration
    FROM Medialibrary."Movie Library" ml
	JOIN Medialibrary."Movie Description" md ON ml.movie_id = md.movie_id;

/*Фильм и его жанр*/

CREATE VIEW Medialibrary.movie_genre AS
    SELECT ml.name, g.genre_name
    FROM Medialibrary."Movie Library" ml
	JOIN Medialibrary."Movie-Genre" mg ON ml.movie_id = mg.movie_id JOIN Medialibrary.Genre g ON mg.genre_id = g.genre_id;

/* Фильм и его актёрский состав*/

CREATE VIEW Medialibrary.movie_cast AS
    SELECT ml.name, CONCAT(a.first_name, ' ', a.last_name)
    FROM Medialibrary."Movie Library" ml
	JOIN Medialibrary.Cast c ON ml.movie_id = c.movie_id JOIN Medialibrary.Actors a ON c.actor_id = a.actor_id;

/* Информация о каждом актёре - в скольких фильмах он снялся */

CREATE VIEW Medialibrary.actor_movie_number AS
    SELECT CONCAT(a.first_name, ' ', a.last_name) AS full_actor_name, COUNT(ml.name)
    FROM Medialibrary."Movie Library" ml
	JOIN Medialibrary.Cast c ON ml.movie_id = c.movie_id JOIN Medialibrary.Actors a ON c.actor_id = a.actor_id GROUP BY full_actor_name;
