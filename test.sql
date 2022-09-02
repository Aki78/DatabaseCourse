drop database if exists flight_game;
create database flight_game;
use flight_game;

-- set foreign_key_checks=0;

drop table if exists country;
create table country (
iso_country varchar(40),
name varchar(40),
continent varchar(40),
wikipedia_link varchar(40),
keywords varchar(40)
);

drop table if exists airport;
create table airport (
id int(11) NOT NULL,
ident varchar(40),
type varchar(40),
name varchar(40),
latitude_deg double,
longitude_deg double, 
elevation_ft int(11),
continent varchar(40),
iso_country varchar(40),
iso_region varchar(40),
municipality varchar(40),
scheduled_service varchar(40),
gps_code varchar(40),
iata_code varchar(40),
local_code varchar(40),
home_link varchar(40),
wikipedia_link varchar(40),
keywords varchar(40),
primary key (ident)
);


drop table if exists game;
create table game (
id int not null,
co2_consumed int(8),
co2_budget int(8),
screen_name varchar(10),
location varchar(40),
primary key (id)
);


drop table if exists goal;
create table goal (
id int not null,
name varchar(40),
description varchar(200),
icon varchar(8),
target varchar(40),
target_minvalue decimal(8,2),
target_maxvalue decimal(8,2),
target_text varchar(40),
primary key (id)
);

drop table if exists goal_reached;
create table goal_reached (
game_id int not null,
goal_id int not null,
primary key (game_id, goal_id),
foreign key (goal_id) references game (id),
foreign key (game_id) references goal (id)
);
