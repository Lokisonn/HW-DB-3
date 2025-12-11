--Задание 2
-- Название и продолжительность самого длительного трека
select  name_tracks, duration from tracks1
where duration = (select MAX(duration) from tracks1);

--Название треков, продолжительность которых не менее 3,5 минут
select name_tracks, duration from tracks1
where duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
select name_collections, yearofrelease  from collections1
where yearofrelease >= 2018 and yearofrelease <=2020;

--Исполнители, чьё имя состоит из одного слова
select name_performers  from performers1
where name_performers not like '% %';

--Название треков, которые содержат слово «мой» или «my»
select name_tracks  from tracks1
where lower(name_tracks) like 'мой %' or lower(name_tracks) like '% мой' or lower(name_tracks) like '% мой %' or lower(name_tracks) like 'мой' 
or lower(name_tracks) like 'my %' or lower(name_tracks) like '% my' or lower(name_tracks) like '% my %' or lower(name_tracks) like 'my';

--Задание 3
--Количество исполнителей в каждом жанре 
select g.name_genre, count(gp.performer_id) as count_performers
from Genres1 g 
left  join Genre_performer gp  on g.id = gp.genre_id
group by g.name_genre
order by count_performers desc;

--Количество треков, вошедших в альбомы 2019–2020 годов
select count(name_tracks) from tracks1 t 
join albums1 a on t.album_id = t.album_id 
where a.YearOfRelease between 2019 and 2020;

--Средняя продолжительность треков по каждому альбому
select a.name_albums, AVG(t.duration) as avg_duration
from tracks1 t 
left  join albums1 a  on a.id = t.album_id
group by a.name_albums;

--Все исполнители, которые выпустили альбомы НЕ в 2020 году.
select name_performers from performers1 p 
where name_performers  not in (
select name_albums from albums1 a 
join album_performer ea on ea.album_id = a.id
join performers1 p on ea.performer_id = p.id
where a.yearofrelease = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель.
select c.name_collections as collection1, t.name_tracks as name_track
from collections1 c
join collection_track ct on c.id = ct.collection_id 
join tracks1 t on t.id = ct.track_id 
join albums1 a on a.id = t.album_id
join album_performer ap  on t.album_id = ap.album_id
join performers1 p on p.id =ap.performer_id
where p.name_performers = 'Tina Turner'
