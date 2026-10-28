CREATE SCHEMA GOLD;
GO

USE ProjectAirbnb;
GO

--1) GOLD.DIM_CITY
CREATE TABLE GOLD.DIM_CITY( cityId INT NOT NULL PRIMARY KEY, cityName VARCHAR(50) )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 1, 'Amsterdam' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 2, 'Athens' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 3, 'Barcelona' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 4, 'Berlin' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 5, 'Budapest' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 6, 'Lisbon' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 7, 'London' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 8, 'Paris' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 9, 'Rome' )
INSERT INTO GOLD.DIM_CITY( cityId, cityName )
VALUES( 10, 'Vienna' )

--2) GOLD.DIM_WEEK_TYPE
CREATE TABLE GOLD.DIM_WEEK_TYPE( weektype_ID INT NOT NULL PRIMARY KEY, weektype_name varchar(50) )
INSERT INTO GOLD.DIM_WEEK_TYPE( weektype_ID, weektype_name )
VALUES ( 1, 'Weekday' )
INSERT INTO GOLD.DIM_WEEK_TYPE ( weektype_ID, weektype_name )
VALUES ( 2, 'Weekend' )

--3) GOLD.DIM_ROOM_TYPE
CREATE TABLE GOLD.DIM_ROOM_TYPE( roomtype_id INT NOT NULL PRIMARY KEY, roomtype_name varchar(50) )
INSERT INTO GOLD.DIM_ROOM_TYPE( roomtype_id, roomtype_name )
VALUES ( 1, 'Private room' )
INSERT INTO GOLD.DIM_ROOM_TYPE ( roomtype_id, roomtype_name )
VALUES ( 2, 'Entire room/apt' )
INSERT INTO GOLD.DIM_ROOM_TYPE( roomtype_id, roomtype_name )
VALUES ( 3, 'Shared room' )


---------------------------------
CREATE VIEW ALL_Tables AS
SELECT *, 'Amsterdam' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[AmsterdamWeekdays]
UNION ALL
SELECT *, 'Amsterdam' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[AmsterdamWeekends]
UNION ALL
SELECT *, 'Athens' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[AthensWeekdays]
UNION ALL
SELECT *, 'Athens' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[AthensWeekends]
UNION ALL
SELECT *, 'Barcelona' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[BarcelonaWeekdays]
UNION ALL
SELECT *, 'Barcelona' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[BarcelonaWeekends]
UNION ALL
SELECT *, 'Berlin' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[BerlinWeekdays]
UNION ALL
SELECT *, 'Berlin' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[BerlinWeekends]
UNION ALL
SELECT *, 'Budapest' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[BudapestWeekdays]
UNION ALL
SELECT *, 'Budapest' AS city_name, 'Weekend' AS week_type
FROM [SILVER].[BudapestWeekends]
UNION ALL
SELECT *, 'Lisbon' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[LisbonWeekdays]
UNION ALL
SELECT *, 'Lisbon' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[LisbonWeekends]
UNION ALL
SELECT *, 'London' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[LondonWeekdays]
UNION ALL
SELECT *, 'London' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[LondonWeekends]
UNION ALL
SELECT *, 'Paris' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[ParisWeekdays]
UNION ALL
SELECT *, 'Paris' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[ParisWeekends]
UNION ALL
SELECT *, 'Rome' AS city_name, 'Weekday' AS week_type
FROM [SILVER].[RomeWeekdays]
UNION ALL
SELECT *, 'Rome' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[RomeWeekends]
UNION ALL
SELECT *, 'Vienna' AS city_name, 'Weekday' AS week_type 
FROM [SILVER].[BarcelonaWeekdays]
UNION ALL
SELECT *, 'Vienna' AS city_name, 'Weekend' AS week_type 
FROM [SILVER].[ViennaWeekends]

--4) GOLD.DIM_APARTMENT
CREATE TABLE GOLD.DIM_APARTMENT ( 
	aptID INT IDENTITY(1,1) NOT NULL PRIMARY KEY, bedrooms INT, host_is_superhost BIT, multi BIT, biz BIT
)
INSERT INTO GOLD.DIM_APARTMENT ( bedrooms, host_is_superhost, multi, biz )
SELECT DISTINCT 
	bedrooms,
	host_is_superhost,
	multi,
	biz
FROM ALL_Tables

--5) GOLD.DIM_LOCATION 
CREATE TABLE GOLD.DIM_LOCATION ( 
	location_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	dist DECIMAL(9,4),
	metro_dist DECIMAL(9,4),
	attr_index DECIMAL(9,4),
	rest_index DECIMAL(9,4),
	lng DECIMAL(9,4),
	lat DECIMAL(9,4)
)
INSERT INTO GOLD.DIM_LOCATION( dist, metro_dist, attr_index, rest_index, lng, lat )
SELECT DISTINCT
	dist,
	metro_dist,
	attr_index,
	rest_index,
	lng,
	lat
FROM ALL_Tables

--6) GOLD.DIM_RATING
CREATE TABLE GOLD.DIM_RATING( 
	rating_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	realSum DECIMAL(9,4),
    cleanliness_rating INT,
    guest_satisfaction_overall INT,
    
    cityId INT FOREIGN KEY REFERENCES [GOLD].[DIM_CITY](cityId),
    weektype_ID INT FOREIGN KEY REFERENCES [GOLD].[DIM_WEEK_TYPE](weektype_ID),
    roomtype_id INT FOREIGN KEY REFERENCES [GOLD].[DIM_ROOM_TYPE](roomtype_id),
    property_id INT FOREIGN KEY REFERENCES [GOLD].[DIM_APARTMENT](aptID),
    location_ID INT FOREIGN KEY REFERENCES [GOLD].[DIM_LOCATION](location_ID)
);
INSERT INTO GOLD.DIM_RATING(
    realSum, 
    cleanliness_rating, 
    guest_satisfaction_overall, 
    cityId,
    weektype_ID,
    roomtype_id,
    aptID,
    location_ID )
SELECT
    s.realSum,
    s.cleanliness_rating,
    s.guest_satisfaction_overall,
    c.cityId,
    wt.weektype_ID,
    rt.roomtype_id,
    p.aptID,
    l.location_ID
FROM ALL_Tables

JOIN [GOLD].[DIM_CITY] c ON s.cityName = c.cityName

JOIN [GOLD].[DIM_WEEK_TYPE] wt ON s.week_type = wt.weektype

JOIN [GOLD].[DIM_ROOM_TYPE] rt ON s.room_type = rt.roomtype

JOIN [GOLD].[DIM_APARTMENT] p 
   ON s.bedrooms = p.bedrooms 
   AND s.person_capacity = p.person_capacity 
   AND s.host_is_superhost = p.host_is_superhost
   AND s.multi = p.multi
   AND s.biz = p.biz

JOIN [GOLD].[DIM_LOCATION] l 
   ON s.dist = l.dist 
   AND s.metro_dist = l.metro_dist 
   AND s.lat = l.lat
   AND s.lng = l.lng
   AND s.attr_index_norm = l.attr_index
   AND s.rest_index_norm = l.rest_index;

--7) Indexing
CREATE INDEX IX_FACT_cityId      ON  [GOLD].[DIM_RATING]([city_id]);
CREATE INDEX IX_FACT_weektypeId  ON [GOLD].[DIM_RATING]([weektype_ID]);
CREATE INDEX IX_FACT_roomTypeId  ON [GOLD].[DIM_RATING]([roomtype_id]);
CREATE INDEX IX_FACT_aptID       ON [GOLD].[DIM_RATING]([aptID]);
CREATE INDEX IX_FACT_location_ID ON [GOLD].[DIM_RATING]([location_ID]);