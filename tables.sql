DROP TABLE IF EXISTS playlist CASCADE;
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS albums;


CREATE TABLE albums(

id int PRIMARY KEY,
album_name text NOT NULL
);
--albums
INSERT INTO albums(id,album_name)
values(1,'ANGELWARE');

INSERT INTO albums(id,album_name)
values(2,'HIVEMIND PT.2');

INSERT INTO albums(id,album_name)
values(3,'Adventure(Deluxe)');

INSERT INTO albums(id,album_name)
values(4,'Afterimage');

INSERT INTO albums(id,album_name)
values(5,'BLISS2k');

INSERT INTO albums(id,album_name)
values(6,'Greatest Remix Album of All Time');

CREATE TABLE tracks(

id int PRIMARY KEY,
track_name text NOT NULL,
track_length int NOT NULL

);

--Tracks
INSERT INTO tracks(id,track_name,track_length)
values(1,'ANGELWARE',3);

INSERT INTO tracks(id,track_name,track_length)
values(2,'415',1);

INSERT INTO tracks(id,track_name,track_length)
values(3,'Shallow Breathing',3);

INSERT INTO tracks(id,track_name,track_length)
values(4,'LONG LIVE',3);

INSERT INTO tracks(id,track_name,track_length)
values(5,'Pay no mind (feat. Passion Pit)',4);

INSERT INTO tracks(id,track_name,track_length)
values(6,'Beings ',5);

INSERT INTO tracks(id,track_name,track_length)
values(7,'Afterimage ',3);

INSERT INTO tracks(id,track_name,track_length)
values(8,'BLISS 2k',4);

INSERT INTO tracks(id,track_name,track_length)
values(9,'Pray for Riddim-Control Freak Remix',2);

INSERT INTO tracks(id,track_name,track_length)
values(10,'Miss you-Resurge REMIX',1);

--link table 

CREATE TABLE playlist(
    id serial PRIMARY KEY,
    track_id integer REFERENCES tracks(id),  ---fk1
    album_id integer REFERENCES albums(id)   ---fk2
);

INSERT INTO playlist(track_id,album_id)
values
(1,1),
(2,2),
(3,2),
(4,2),
(5,3),
(6,3),
(7,4),
(8,5),
(9,6),
(10,6);

--join 
--5

SELECT T.track_name,A.album_name
FROM tracks as T
INNER JOIN playlist as P
ON T.id = P.track_id
INNER JOIN albums AS A 
ON P.album_id = A.id; 

--6
SELECT T.track_name,A.album_name,T.track_length
FROM tracks as T
INNER JOIN playlist as P
ON T.id = P.track_id
INNER JOIN albums AS A 
ON P.album_id = A.id; 
--7

SELECT COUNT(*), tracks.track_name, albums.id, albums.album_name
FROM tracks
INNER JOIN albums ON tracks.id=albums.id 
WHERE tracks.id <> 1
GROUP BY albums.id, tracks.track_name ;
--8
SELECT  COUNT(*) TotalCount,  
        b.album_name
FROM    tracks a
        INNER JOIN albums b
            ON a.id = b.id 
WHERE   a.id >= 1
GROUP   BY b.id, b.album_name;



