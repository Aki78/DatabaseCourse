create database flight_game;
use flight_game;

create table airport(
id int not null,
ident varchar(999) not null,
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
location varchar(999),
primary key (id)
);

-- foreign key (location)

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
-- ========================================
-- create table duckburger(
-- ID int not null auto_increment,
-- first_name varchar(40),
-- last_name varchar(40),
-- primary key (id)
-- );

-- create table pet(
-- ID int not null auto_increment,
-- name varchar(40),
-- primary key(id)
-- );

-- create table owns(
-- pet_ID int,
-- duckburger_ID int,
-- primary key (pet_ID, duckburger_ID),
-- foreign key (pet_ID) references pet(ID),
-- foreign key (duckburger_ID) references duckburger(ID)
-- );

-- insert into duckburger(first_name, last_name)
-- values("Donald", "Duck"),("Scrooge", "McDuck"),
-- ("Huey", "Duck"),("Magica", "De Spell"), ("Mickey", "Mouse");

-- insert into pet(name)
-- values("Bolivar"), ("Pluto"), ("Ratface");

-- insert into owns(pet_ID, duckburger_ID)
-- values(1,1),(1,3),(2,5),(3,4);
