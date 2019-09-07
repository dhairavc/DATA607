DROP DATABASE IF EXISTS Movies;
create database Movies;
use Movies;

CREATE TABLE movies (
VID INT Not Null,
Title Varchar(50),
URL Varchar(256) NOT NULL,
PRIMARY KEY (VID)
);

CREATE TABLE Reviews (
RID INT NOT NULL, 
VID INT NOT NULL,
UName Varchar(20) NOT NULL,  
CHECK(Rating >= 1 and Rating <= 5)  , 
PRIMARY KEY (RID),
FOREIGN KEY (VID) REFERENCES movies(VID)
);

INSERT INTO movies
(VID, Title, URL)
VALUES
(1, "Spider-Man: Into the Spider-Verse", "https://www.imdb.com/title/tt4633694/"), 
(2, "The Imitation Game", "https://www.imdb.com/title/tt2084970/"), 
(3, "Interstellar", "https://www.imdb.com/title/tt0816692/"),
(4, "Good Will Hunting", "https://www.imdb.com/title/tt0119217/"),
(5, "A Beautiful Mind", "https://www.imdb.com/title/tt0268978/"),
(6, "Forest Gump", "https://www.imdb.com/title/tt0109830/");

INSERT INTO Reviews
(RID, VID, UName, Rating)
Values
(1, 1, "Koalassy", 3),
(2, 2, "Koalassy", 1),
(3, 3, "Koalassy", 4),
(4, 4, "Koalassy", 5),
(5, 5, "Koalassy", 3),
(6, 6, "Koalassy", 2),
(7, 1, "Gooze", 1),
(8, 2, "Gooze", null),
(9, 3, "Gooze", 4),
(10, 4, "Gooze", 4),
(11, 5, "Gooze", 2),
(12, 6, "Gooze", 5), 
(13, 1, "LandTermite", null),
(14, 2, "LandTermite", null),
(15, 3, "LandTermite", 5),
(16, 4, "LandTermite", 5),
(17, 5, "LandTermite", 5),
(18, 6, "LandTermite", 5),
(19, 1, "RhythmTiger", 4),
(20, 2, "RhythmTiger", 1),
(21, 3, "RhythmTiger", 3),
(22, 4, "RhythmTiger", 4),
(23, 5, "RhythmTiger", 5),
(24, 6, "RhythmTiger", 4),
(25, 1, "ArtisticAlbatross", null),
(26, 2, "ArtisticAlbatross", 2),
(27, 3, "ArtisticAlbatross", 1),
(28, 4, "ArtisticAlbatross", 1),
(29, 5, "ArtisticAlbatross", 1),
(30, 6, "ArtisticAlbatross", 3);

select Movies.Title, Movies.URL, Reviews.UName as UserName, Reviews.Rating from
movies Join Reviews
Where Movies.VID = Reviews.VID