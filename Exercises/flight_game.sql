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
)
