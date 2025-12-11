--Задание 2
-- Название и продолжительность самого длительного трека
select  name, duration from tracks
where duration = (select MAX(duration) from tracks);

--Название треков, продолжительность которых не менее 3,5 минут
select name, duration from tracks
where duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
select name, yearofrelease  from collections
where yearofrelease >= 2018 and yearofrelease <=2020;

--Исполнители, чьё имя состоит из одного слова
select name  from performers
where name not like '% %';

--Название треков, которые содержат слово «мой» или «my»
select name  from tracks
where lower(name) like 'мой %' or lower(name) like '% мой' or lower(name) like '% мой %' or lower(name) like 'мой' 
or lower(name) like 'my %' or lower(name) like '% my' or lower(name) like '% my %' or lower(name) like 'my';

--Задание 3
--Количество исполнителей в каждом жанре 
select g.name, count(gp.performer_id) as count_performers
from genres g 
left  join genre_performer gp  on g.id = gp.genre_id
group by g.name
order by count_performers desc;

--Количество треков, вошедших в альбомы 2019–2020 годов
select count(name) from tracks t 
join albums1 a on t.album_id = t.album_id 
where a.YearOfRelease between 2019 and 2020;

--Средняя продолжительность треков по каждому альбому
select a.name, AVG(t.duration) as avg_duration
from tracks t 
left  join albums a  on a.id = t.album_id
group by a.name;

--Все исполнители, которые выпустили альбомы НЕ в 2020 году.
select name from performers p 
where name not in (
select name from albums a 
join album_performer ea on ea.album_id = a.id
join performers p on ea.performer_id = p.id
where a.yearofrelease = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель.
select c.name as collection, t.name as name_track
from collections c
join collection_track ct on c.id = ct.collection_id 
join tracks t on t.id = ct.track_id 
join albums a on a.id = t.album_id
join album_performer ap  on t.album_id = ap.album_id
join performers p on p.id =ap.performer_id
where p.name = 'Tina Turner';




