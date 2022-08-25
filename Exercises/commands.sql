use flight_game;
show tables;

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

alter table countries
drop column id;
alter table country
change code iso_country varchar(999);
alter table country
add primary key(iso_country);

alter table airport
add foreign key (iso_country)
references countries (iso_country);

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
