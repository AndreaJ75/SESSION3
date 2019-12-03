-----------------------------------------------------------------
-------------   TRANSPORTATION
------------------------------------------------------------------

create table Vehicule_class
(
  -- definition de la clé primaire
  id serial
    constraint Vehicule_class_pk
      primary key,
  -- puis les autres colonnes
  vehicule_category varchar             --(vehicle_class from vehicles.csv)

);

create table Model
(
  -- definition de la clé primaire
  id serial
    constraint Model_pk
      primary key,
  -- puis les autres colonnes
  model_category varchar                --(model from vehicles.csv)

);

create table Manufacturer
(
  -- definition de la clé primaire
  id serial
    constraint Manufacturer_pk
      primary key,
  -- puis les autres colonnes
  manufacturer_name varchar             --(manufacturer from vehicles.csv)

);


create table Transportation
(
  -- definition de la clé primaire
  id serial
    constraint transportation_pk
      primary key,
  -- puis les autres colonnes
  type_id int				-- foreign key from Vehicule_Class table
    constraint vehicule_class_fk
      references Vehicule_class,

  name varchar,
  model_id int 				-- foreign key from Model table
    constraint model_fk
      references Model,

  manufacturer_id int			-- foreign key from Manufacturer table
    constraint manufacturer_fk
      references Manufacturer,

  cost_in_credits int,
  length decimal,
  max_atmosphere_speed int,
  crew int,
  passenger int,
  cargo_capacity int,
  consumables time
);

create table Starship_class
(
  -- definition de la clé primaire
  id serial
    constraint starship_class_pk
      primary key,
  -- puis les autres colonnes
  starship_category varchar

);

create table Starship
(
  -- definition de la clé primaire
  id serial
    constraint starship_pk
      primary key,
  -- puis les autres colonnes
  vehicule_id int			-- foreign key from Transportation table
    constraint transportation_fk
      references Transportation,

  hyperdrive_rating decimal,
  mglt decimal,
  starship_id int			-- foreign key from Starship_class table
    constraint starship_class_fk
      references Starship_class

);


-----------------------------------------------------------------
-------------   PLANET
------------------------------------------------------------------

create table Climate
(
    -- primary key
    id serial
        constraint climate_pk
        primary key,
    -- other data
    Type varchar   --- climate type (temperate, hot, cold)
);


create table Terrain
(
    -- primary key
    id serial
        constraint terrain_pk
        primary key,
    -- other data
    Type varchar   --- terrain type (jungle, montains)
);


create table Planet
(  -- primary key
  id serial
    constraint planet_pk
    primary key,
    --- other data
  name varchar,
  rotation_period int,
  orbital_period int,
  diameter int,
  climate_id int    -- foreign key Climate table
    constraint climate_fk
      references Climate,
  gravity decimal,
  terrain_id int    -- foreign key Terrain table
    constraint terrain_fk
        references Terrain,

  water_Surface decimal,
  population int
);

-----------------------------------------------------------------
-------------   BEINGS
------------------------------------------------------------------

create table Gender
(
    -- primary key
    id serial
        constraint gender_pk
        primary key,
  -- gender type
    gender_type varchar
);

create table Language
(
    -- primary key
    id serial
        constraint language_pk
        primary key,
  -- gender type
    language_type varchar
);

create table classification
(
    -- primary key
    id serial
        constraint classification_pk
        primary key,
  -- gender type
    classification_type varchar
);

create table Designation
(
    -- primary key
    id serial
        constraint designation_pk
        primary key,
  -- gender type
    designation_type varchar
);

create Type hair_color as ENUM ('blond', 'brown', 'grey', 'auburn', 'white', 'black');
create Type skin_color as ENUM ('fair','gold', 'white', 'blue', 'red', 'light', 'green');
create Type eye_color as ENUM ('blue', 'yellow', 'red');

create table Species
(
    -- primary key
    id serial
        constraint species_pk
        primary key,
    -- other data
    name varchar,
    classification int          -- foreign key
        constraint classification_fk
        references Classification,

    designation int          -- foreign key
        constraint designation_fk
        references Designation,

    avge_height int,   -- average height
    color_hair hair_color,
    color_skin skin_color,
    color_eye eye_color,

    avge_lifespan int,  -- average lifespan

    language_id int       -- foreign key
    constraint language_fk
        references Language,

    homeworld_id  int     -- foreign key
    constraint homeworld_fk
        references Planet

);


create table Characters
(
    -- primary key
    id serial
        constraint characters_pk
        primary key,
    -- other data
    name varchar,
    height int,
    mass decimal,
    color_hair hair_color,
    color_skin skin_color,
    color_eye eye_color,
    birth_year varchar,
    gender_id int       -- foreign key
    constraint gender_fk
        references Gender,

    homeworld_id  int     -- foreign key
    constraint homeworld_fk
        references Planet,

    species_id  int       -- foreign key
       constraint species_fk
        references Species
);


