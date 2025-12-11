--жанр
CREATE TABLE IF NOT EXISTS Genres1 (
id SERIAL PRIMARY KEY, 
name_genre VARCHAR(80) NOT NULL
);
--исполнитель
CREATE TABLE IF NOT EXISTS Performers1 (
id SERIAL PRIMARY KEY, 
name_performers VARCHAR(60) NOT NULL 
);
--Исполнители-жанры
CREATE TABLE IF NOT EXISTS Genre_Performer (
genre_id INTEGER REFERENCES Genres1(id), 
performer_id INTEGER REFERENCES Performers1(id),
CONSTRAINT pk PRIMARY KEY (genre_id, performer_id)
);

--Альбом
CREATE TABLE IF NOT EXISTS Albums1 (
id SERIAL PRIMARY KEY, 
name_albums VARCHAR(80) NOT NULL, 
YearOfRelease INTEGER NOT NULL
);
--ИСПОЛНИТЕЛЬ – АЛЬБОМ
CREATE TABLE IF NOT EXISTS Album_Performer (
album_id INTEGER REFERENCES Albums1(id), 
performer_id INTEGER REFERENCES Performers1(id),
CONSTRAINT pk2 PRIMARY KEY (album_id, performer_id)
);

--Трек
CREATE TABLE IF NOT EXISTS Tracks1 (
id SERIAL PRIMARY KEY, 
name_tracks VARCHAR(60) NOT NULL,duration INTEGER NOT NULL, 
album_id INTEGER NOT NULL REFERENCES Albums1(id)
);

--Сборник
CREATE TABLE IF NOT EXISTS Collections1 (
id SERIAL PRIMARY KEY, 
name_collections VARCHAR(60) NOT NULL, 
YearOfRelease INTEGER NOT NULL 
);
--Сборник_треки
CREATE TABLE IF NOT EXISTS Collection_Track (
collection_id INTEGER REFERENCES Collections1(id), 
track_id INTEGER REFERENCES Tracks1(id),
CONSTRAINT pk3 PRIMARY KEY (collection_id, track_id)
);
