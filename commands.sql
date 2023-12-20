/*
Using the CONCAT function, generate the following output:
+---------------------------------------------+
| Recording                                   |
+---------------------------------------------+
| Dawn of Midi recorded Dysnomia              |
| Interpol recorded Turn on the Bright Lights |
| Melvins recorded Houdini                    |
| Mogwai recorded Come on Die Young           |
| Mogwai recorded Every Country’s Sun         |
| The Chrome Cranks recorded Dead Cool        |
| Warpaint recorded Heads Up                  |
+---------------------------------------------+
*/

USE music;

SELECT CONCAT((SELECT artist_name FROM artist WHERE artist_id = album.artist_id), ' ','recorded', ' ', album.album_name) AS Recording
FROM album;

/*
Complete the following nested query in order to achieve the following MySQL result: SELECT artist_name FROM artist WHERE artist_id = ();. Note that the empty parens is where you’d include the nested query; it’s not a function.
+-------------------+---------------------------+
| artist_name       | album_name                |
+-------------------+---------------------------+
| Dawn of Midi      | Dysnomia                  |
| Interpol          | Turn on the Bright Lights |
| The Chrome Cranks | Dead Cool                 |
| Melvins           | Houdini                   |
| Mogwai            | Come on Die Young         |
| Mogwai            | Every Country’s Sun       |
| Warpaint          | Heads Up                  |
+-------------------+---------------------------+
*/

SELECT artist_name, album_name FROM artist
JOIN album ON artist.artist_id = album.artist_id
WHERE artist.artist_id IN (SELECT artist_id FROM album WHERE artist_id IS NOT NULL);

/*
-- Using the relation Compiles, write a MySQL command that shows all the albums created by artists, exactly like the output above.

-- Using the relation Contains, write a MySQL command that shows all the tracks belonging to every album. Ensure you include track name and album name.

-- Using the relation WasPlayedAt, write a MySQL command that shows all played tracks. Ensure you include track name and track time in your output.
*/

SELECT * FROM contains;

SELECT * FROM played;

SELECT * FROM compiles;
