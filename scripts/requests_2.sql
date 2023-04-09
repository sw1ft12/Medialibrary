SELECT rating, COUNT(*) FROM Medialibrary."Movie Library" GROUP BY rating HAVING AVG(number_of_raitings) > 20000;
SELECT * FROM Medialibrary."Movie Library" ORDER BY rating DESC;
SELECT country, AVG(duration) OVER(PARTITION BY country) FROM Medialibrary."Movie Description";
SELECT country, COUNT(*) OVER(PARTITION BY country) FROM Medialibrary.Actors;
SELECT name, ROW_NUMBER() OVER(ORDER BY country) AS row_num FROM Medialibrary."Movie Description";
SELECT *, LAG(duration, 1, 0) OVER(ORDER BY country) AS prev_date FROM Medialibrary."Movie Description";
