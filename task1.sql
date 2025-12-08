--жанр
CREATE TABLE IF NOT EXISTS Genres (
id SERIAL PRIMARY KEY, 
name VARCHAR(80) NOT NULL
);
--исполнитель
-- Заполнение таблицы ЖАНРЫ

insert into genres (name)
values ('country')

insert into genres (name)
values ('pop')

insert into genres (name)
values ('rock')

insert into genres (name)
values ('indie_folk')

-- Заполнение таблицы ИСПОЛНИТЕЛИ

insert into performers (name)
values ('Taylor Swift')

insert into performers (name)
values ('Avril Lavigne')

insert into performers (name)
values ('Ariana Grande')

insert into performers (name)
values ('Manizha')

insert into performers (name)
values ('Tina Turner')

-- Заполнение таблицы АЛЬБОМЫ

insert into albums  (name, yearofrelease)
values ('Simple the best', 1991)

insert into albums  (name, yearofrelease)
values ('Taylor Swift', 2006)

insert into albums  (name, yearofrelease)
values ('Dangerous Women', 2016)

-- Заполнение таблицы ТРЕКИ

insert into tracks   (name, duration, album_id)
values ('The Best', 247, 1)

insert into tracks   (name, duration, album_id)
values ('Love Thing', 267, 1)

insert into tracks   (name, duration, album_id)
values ('Tim McGraw', 232, 2)

insert into tracks   (name, duration, album_id)
values ('Teardrops on my Guitar', 216, 2)

insert into tracks   (name, duration, album_id)
values ('Dangerous Woman', 236, 3)

insert into tracks   (name, duration, album_id)
values ('Moonligth', 202, 3)

-- Заполнение таблицы СБОРНИКИ

insert into collections   (name, yearofrelease)
values ('collection1', 2020)

insert into collections   (name, yearofrelease)
values ('collection2', 2021)

insert into collections   (name, yearofrelease)
values ('collection3', 2022)

insert into collections   (name, yearofrelease)
values ('collection4', 2023)

-- Заполнение таблицы связей альбомов и исполнителей

insert into album_performer  (album_id, performer_id)
values (2,1)

insert into album_performer  (album_id, performer_id)
values (3,3)

insert into album_performer  (album_id, performer_id)
values (1,5)

-- Заполнение таблицы связей сборников и треков

insert into collection_track   (collection_id, track_id)
values (1,1)

insert into collection_track   (collection_id, track_id)
values (1,3)

insert into collection_track   (collection_id, track_id)
values (2,2)

insert into collection_track   (collection_id, track_id)
values (2,4)

insert into collection_track   (collection_id, track_id)
values (3,3)

insert into collection_track   (collection_id, track_id)
values (3,5)

insert into collection_track   (collection_id, track_id)
values (4,1)

insert into collection_track   (collection_id, track_id)
values (4,6)

-- Заполнение таблицы связей жанров и исполнителей

insert into genre_performer    (genre_id, performer_id)
values (1,1)

insert into genre_performer    (genre_id, performer_id)
values (2,1)

insert into genre_performer    (genre_id, performer_id)
values (2,2)

insert into genre_performer    (genre_id, performer_id)
values (2,3)

insert into genre_performer    (genre_id, performer_id)
values (3,2)

insert into genre_performer    (genre_id, performer_id)
values (3,5)

insert into genre_performer    (genre_id, performer_id)
values (4,1)

insert into genre_performer    (genre_id, performer_id)
values (4,4)