CREATE FUNCTION Medialibrary.check_movie_new()
    RETURNS TRIGGER AS $$
    DECLARE
    BEGIN
        RAISE NOTICE 'New movie was added';
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_new
    AFTER INSERT ON Medialibrary."Movie Library"
    FOR EACH ROW
    EXECUTE PROCEDURE Medialibrary.check_movie_new();


CREATE FUNCTION Medialibrary.check_movie_update()
    RETURNS TRIGGER AS $$
    DECLARE
    BEGIN
        RAISE NOTICE 'Updating movie library';
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_update
    AFTER UPDATE ON Medialibrary."Movie Library"
    FOR EACH ROW
    EXECUTE PROCEDURE Medialibrary.check_movie_update();
