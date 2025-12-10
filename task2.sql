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
insert into albums  (name, yearofrelease)
values ('Head Above Water', 2019);

insert into album_performer  (album_id, performer_id)
values (4,2);

insert into tracks   (name, duration, album_id)
values ('Crush', 213, 4);

select a.name, count(t.id) as count_tracks
from tracks t 
left  join albums a  on a.id = t.album_id
where a.yearofrelease = 2019 or a.yearofrelease = 2020
group by a.name;

--Средняя продолжительность треков по каждому альбому
select a.name, AVG(t.duration) as avg_duration
from tracks t 
left  join albums a  on a.id = t.album_id
group by a.name;

--Все исполнители, которые выпустили альбомы НЕ в 2020 году.
select p.name as name_performer, a.name as name_album, a.yearofrelease
from performers p
join album_performer ap on ap.performer_id  = p.id
join albums a on ap.album_id = a.id
where a.yearofrelease != 2020;


--Названия сборников, в которых присутствует конкретный исполнитель.
select c.name as collection, t.name as name_track
from collections c
join collection_track ct on c.id = ct.collection_id 
join tracks t on t.id = ct.track_id 
join albums a on a.id = t.album_id
join album_performer ap  on t.album_id = ap.album_id
join performers p on p.id =ap.performer_id
where p.name = 'Tina Turner';

--Задание 4
--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select distinct a.name as name_album
from albums a 
join album_performer ap on a.id =ap.album_id
join performers p on p.id = ap.performer_id
join genre_performer gp on p.id = gp.performer_id
group by a.name
having count(gp.performer_id)>1;

--Наименования треков, которые не входят в сборники.
select t.name as name_track
from tracks t 
left join  collection_track ct  on t.id = ct.track_id
where ct.collection_id  is  NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select p.name as name_perfotmer, t.duration as min_duration
from performers p 
join album_performer ap on p.id =ap.performer_id
join tracks t on t.album_id = ap.album_id
where t.duration = (select MIN(duration ) from tracks);

--Названия альбомов, содержащих наименьшее количество треков.
select a.name as name_album, COUNT (t.id) as count_tracks
from albums a
join tracks t on a.id = t.album_id
group by a.name 
order by COUNT(t.id) asc

limit 1

