create database bodytemperature;
use bodytemperature;

CREATE TABLE person (
    id int,
    name NVARCHAR(100),
    start_date datetime,
    end_date datetime,
    age int,
    stay_prefecture NVARCHAR(50),
    from_country NVARCHAR(50),
    tel NVARCHAR(20)
);

CREATE TABLE body_tempareture (
    person_id int,
    registered_date datetime,
    body_tempareture float
);

CREATE TABLE age_measure (
    display_name NVARCHAR(20),
    max_age int
)