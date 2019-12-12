select * from artists;
select * from albums;
select * from songs;

-- how many duplicate album names

SELECT albums.name, artists.name, COUNT(albums.name) "count" from albums
JOIN artists ON albums.artist = artists._id
GROUP BY albums.name, artists.name;

SELECT albums.name, COUNT(albums.name) AS num_albums
FROM albums GROUP BY albums.name
HAVING num_albums > 1;

-- multiple albums of same name and artist with id
SELECT artists._id "id", artists.name "artist", albums.name "album"
FROM artists
INNER JOIN albums
ON albums.artist = artists._id
WHERE albums.name IN (
    SELECT albums.name FROM
    albums GROUP BY albums.name
    HAVING COUNT(albums.name) > 1
    ) ORDER BY albums.name, artists.name;
-- HAVING COUNT(*) > 1;