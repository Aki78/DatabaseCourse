drop database flight_game;
create database flight_game;
use flight_game;

create table airport(
id int,
ident varchar(999),
type varchar(999),
name varchar(999),
latitude_deg float(53),
longitude_deg float(53),
elevation_ft int,
continent varchar(999),
iso_country varchar(999),
iso_region varchar(999),
municipality varchar(999),
scheduled_service varchar(999),
gps_code varchar(999),
iata_code varchar(999),
local_code varchar(999),
home_link varchar(999),
wikipedia_link varchar(999),
keywords varchar(999)
);

create table goal(
id int not null,
name varchar(999),
description varchar(999),
icon varchar(999),
target varchar(999),
target_minvalue float(53),
target_maxvalue float(53),
target_text varchar(999),
primary key (id)
);

create table game(
id int not null,
co2_consumed float(53),
co2_budget float(53),
screen_name varchar(999),
location varchar(999),
primary key (id)
);

create table goal_reached(
goal_id int not null,
game_id int not null,
primary key (goal_id, game_id),
-- primary key (goal_id),
foreign key (goal_id) references goal(id),
foreign key (game_id) references game(id)

);

create table country(
id int not null,
code varchar(999),
name varchar(999),
continent varchar(999),
wikipedia_link varchar(999),
keywords varchar(999)
);

load data local infile '/home/aki/DatabaseCourse/Exercises/airports.csv'
into table airport
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data local infile '/home/aki/DatabaseCourse/Exercises/countries.csv'
into table airport
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

alter table country
drop column id;
alter table country
change code iso_country varchar(999);
alter table country
add primary key(iso_country);

alter table airport
add foreign key (iso_country)
references country (iso_country);

alter table game
add foreign key (location)
references airport (ident);

insert into game(id, co2_consumed, co2_budget, location)
values
(1, 2000, 10 000, ”Heini”, ”EFHK”),
(2, 3000, 10 000, ”Vesa”, ”EGCC” ),
(3, 8000, 10 000, ”Ilkka”, ”EGKK”);

insert into game_reached(goal_id, game_id)
values
(1,4),
(1,7),
(2,4),
(3,7);
