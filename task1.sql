-- Заполнение таблицы ЖАНРЫ
INSERT INTO genre(name_genre) VALUES 
  ('country'),
  ('pop'),
  ('rock'),
  ('indie_folk');

-- Заполнение таблицы ИСПОЛНИТЕЛИ

INSERT INTO performers (name) VALUES 
  ('Taylor Swift'),
  ('Avril Lavigne'),
  ('Ariana Grande'),
  ('Manizha'),
  ('Tina Turner');

-- Заполнение таблицы АЛЬБОМЫ

INSERT INTO albums  (name, yearofrelease) VALUES 
  ('Simple the best', 1991),
  ('Taylor Swift', 2006),
  ('Dangerous Women', 2016);

-- Заполнение таблицы ТРЕКИ

INSERT INTO tracks   (name, duration, album_id) VALUES 
  ('The Best', 247, 1),
  ('Love Thing', 267, 1),
  ('Teardrops on my Guitar', 216, 2),
  ('Dangerous Woman', 236, 3),
  ('Moonligth', 202, 3);

-- Заполнение таблицы СБОРНИКИ

INSERT INTO collections   (name, yearofrelease) VALUES 
  ('collection1', 2020),
  ('collection2', 2021),
  ('collection3', 2022),
  ('collection4', 2023);

-- Заполнение таблицы связей альбомов и исполнителей

INSERT INTO album_performer  (album_id, performer_id) VALUES 
  (2,1),
  (3,3),
  (1,5);

-- Заполнение таблицы связей сборников и треков

INSERT INTO collection_track   (collection_id, track_id) VALUES 
  (1,1),
  (1,3),
  (2,2),
  (2,4),
  (3,3),
  (3,5),
  (4,1),
  (4,6);

-- Заполнение таблицы связей жанров и исполнителей

INSERT INTO genre_performer    (genre_id, performer_id) VALUES 
  (1,1),
  (2,1),
  (2,2),
  (2,3),
  (3,2),
  (3,5),
  (4,1),
  (4,4);


