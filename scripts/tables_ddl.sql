CREATE SCHEMA Medialibrary;

CREATE TABLE IF NOT EXISTS Medialibrary."Movie Library"
(
    movie_id			SERIAL PRIMARY KEY,
	name				VARCHAR(128) NOT NULL,
	rating				NUMERIC(5, 2),
	number_of_raitings	INTEGER
);


CREATE TABLE IF NOT EXISTS Medialibrary."Movie Description"
(
	movie_id 		SERIAL PRIMARY KEY,
	name			VARCHAR(128) NOT NULL,
	description		VARCHAR(4096),
	country			VARCHAR(64),
	duration		INTEGER,
	date			DATE,
	FOREIGN KEY (movie_id)  REFERENCES Medialibrary."Movie Library" (movie_id)  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Medialibrary.Actors
(
   	actor_id		SERIAL PRIMARY KEY,
	first_name		VARCHAR(64) NOT NULL,
	last_name		VARCHAR(64),
	birth_day		DATE,
	country			VARCHAR(64)
);

CREATE TABLE IF NOT EXISTS Medialibrary.Cast
(
	movie_id			SERIAL NOT NULL,
   	actor_id			SERIAL NOT NULL,
	role				VARCHAR(64),
	role_description	VARCHAR(1024),
	FOREIGN KEY	(movie_id) REFERENCES Medialibrary."Movie Description" (movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES  Medialibrary.Actors (actor_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Medialibrary.Genre
(
	genre_id			SERIAL PRIMARY KEY,
	genre_name			VARCHAR(128),
	genre_description	VARCHAR(2048)
);


CREATE TABLE IF NOT EXISTS Medialibrary."Movie-Genre"
(
	movie_id			SERIAL NOT NULL,
	genre_id			SERIAL NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES Medialibrary."Movie Library" (movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(genre_id) REFERENCES Medialibrary.Genre (genre_id) ON DELETE CASCADE ON UPDATE CASCADE	
);
