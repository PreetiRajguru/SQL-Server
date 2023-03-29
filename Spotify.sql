CREATE DATABASE SpotifyTopArtist;

USE SpotifyTopArtist;

CREATE TABLE Artists
(
	ArtistId INT PRIMARY KEY,
	ArtistName VARCHAR(20)
);

SELECT * FROM Artists;

CREATE TABLE Songs
(
	SongId INT PRIMARY KEY,
	ArtistId INT FOREIGN KEY REFERENCES Artists(ArtistId)
);

SELECT * FROM Songs;

CREATE TABLE MusicCharts
(
	Day INT,
	SongId INT FOREIGN KEY REFERENCES Songs(SongId),
	Rank INT
);

SELECT * FROM MusicCharts;

INSERT INTO Artists (ArtistId, ArtistName)
VALUES
    (101, 'Ed Sheeran'),
    (120, 'Drake'),
	(301, 'Taylor Swift'),
	(140, 'Jennifer Lopez');

INSERT INTO Songs (SongId, ArtistId)
VALUES
    (45202, 101),
    (19960, 120),
	(87548, 301),
	(14257, 140);

INSERT INTO MusicCharts (Day, SongId, Rank)
VALUES
    (1, 45202, 5),
    (3, 45202, 2),
    (1, 19960, 3),
    (9, 19960, 15),
	(1, 87548, 4),
    (3, 87548, 6),
	(1, 14257, 3),
    (3, 14257, 5);

SELECT * FROM Artists;
SELECT * FROM Songs;
SELECT * FROM MusicCharts;

SELECT TOP 1 ArtistName, RANK() OVER (ORDER BY SongAppearances DESC) AS SongAppearancesRank
FROM Artists
JOIN (
    SELECT songid, COUNT(songid) AS SongAppearances
    FROM MusicCharts
    WHERE rank <= 5
    GROUP BY songid
) AS TopSongs ON Artists.ArtistId = (SELECT ArtistId FROM Songs WHERE Songs.SongId = TopSongs.Songid)
ORDER BY SongAppearancesRank;

SELECT ArtistName, SongAppearancesRank
FROM (
    SELECT Artists.ArtistName, RANK() OVER (ORDER BY SongAppearances DESC) AS SongAppearancesRank
    FROM Artists
    JOIN (
        SELECT songs.ArtistId, COUNT(songs.SongId) AS SongAppearances
        FROM MusicCharts
        JOIN Songs ON MusicCharts.SongId = Songs.SongId
        WHERE Rank <= 10
        GROUP BY songs.ArtistId
    ) AS TopArtists ON Artists.ArtistId = TopArtists.ArtistId
) AS RankedArtists
WHERE SongAppearancesRank <= 10;

SELECT TOP 5 ArtistName, RANK() OVER (ORDER BY COUNT(*) DESC) as AppearancesRank
FROM Artists
JOIN Songs ON Artists.ArtistId = Songs.ArtistId
JOIN MusicCharts ON Songs.SongId = MusicCharts.SongId
WHERE MusicCharts.Rank <= 10
GROUP BY ArtistName
ORDER BY AppearancesRank ASC;
