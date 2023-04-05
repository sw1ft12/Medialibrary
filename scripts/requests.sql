UPDATE Medialibrary.Actors SET first_name = 'Райан', last_name = 'Гослинг' WHERE actor_id = 8;
SELECT * FROM Medialibrary.Actors;
SELECT * FROM Medialibrary."Movie Library";
SELECT * FROM Medialibrary."Movie Desctription";
SELECT * FROM Medialibrary."Genre";
DELETE FROM Medialibrary.Genre WHERE genre_id = 1;
UPDATE Medialibrary."Movie Library" SET rating = 8.0 WHERE name = 'Железный человек';
SELECT name FROM Medialibrary."Movie Library" WHERE rating > 8;
SELECT COUNT(*) FROM Medialibrary.Actors WHERE country = 'США';
SELECT name FROM Medialibrary."Movie Library" WHERE rating = (SELECT MAX(rating) FROM Medialibrary."Movie Library")
