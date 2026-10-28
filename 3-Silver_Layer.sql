CREATE SCHEMA SILVER;
GO

Use ProjectAirbnb;
GO
-- If schema "SILVER" does not exist, create it and if it exists, don't create it again.
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'SILVER'
)
    EXEC('CREATE SCHEMA SILVER');
GO

--1) [SILVER].[AmsterdamWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[AmsterdamWeekdays]
FROM [BRONZE].[AmsterdamWeekdays]


--2) [SILVER].[AmsterdamWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[AmsterdamWeekends]
FROM [BRONZE].[AmsterdamWeekends]

--3) [SILVER].[AthensWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[AthensWeekdays]
FROM [BRONZE].[AthensWeekdays]

--4) [SILVER].[AthensWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[AthensWeekends]
FROM [BRONZE].[AthensWeekends]

--5) [SILVER].[BarcelonaWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[BarcelonaWeekdays]
FROM [BRONZE].[BarcelonaWeekdays]

--6) [SILVER].[BarcelonaWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[BarcelonaWeekends]
FROM [BRONZE].[BarcelonaWeekends]

--7) [SILVER].[BerlinWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[BerlinWeekdays]
FROM [BRONZE].[BerlinWeekdays]

--8) [SILVER].[BerlinWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[BerlinWeekends]
FROM [BRONZE].[BerlinWeekends]

--9) [SILVER].[BudapestWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[BudapestWeekdays]
FROM [BRONZE].[BudapestWeekdays]

--10) [SILVER].[BudapestWeekdends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[BudapestWeekends]
FROM [BRONZE].[BudapestWeekends]

--11) [SILVER].[LisbonWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[LisbonWeekdays]
FROM [BRONZE].[LisbonWeekdays]

--12) [SILVER].[LisbonWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[LisbonWeekends]
FROM [BRONZE].[LisbonWeekends]

--13) [SILVER].[LondonWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[LondonWeekdays]
FROM [BRONZE].[LondonWeekdays]

--14) [SILVER].[LondonWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[LondonWeekends]
FROM [BRONZE].[LondonWeekends]

--15) [SILVER].[ParisWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[ParisWeekdays]
FROM [BRONZE].[ParisWeekdays]

--16) [SILVER].[ParisWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[ParisWeekends]
FROM [BRONZE].[ParisWeekends]

--17) [SILVER].[RomeWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[RomeWeekdays]
FROM [BRONZE].[RomeWeekdays]

--18) [SILVER].[RomeWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[RomeWeekends]
FROM [BRONZE].[RomeWeekends]

--19) [SILVER].[ViennaWeekdays]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[ViennaWeekdays]
FROM [BRONZE].[ViennaWeekdays]

--20) [SILVER].[ViennaWeekends]
SELECT
	TRY_CAST([Column 0] AS INT)                                         AS list_num,
	TRY_CAST([realSum] AS DECIMAL(9,4))                                 AS [realSum],
	NULLIF(LTRIM(RTRIM([room_type])), '')                               AS [room_type],
	NULLIF(LTRIM(RTRIM([room_shared])), '')                             AS [room_shared],
	TRY_CAST(REPLACE([person_capacity], '.0', '') AS INT)               AS [person_capacity],
	NULLIF(LTRIM(RTRIM([host_is_superhost])), '')                       AS [host_is_superhost],
	NULLIF(LTRIM(RTRIM([multi])), '')                                   AS [multi],	
	NULLIF(LTRIM(RTRIM([biz])), '')                                     AS [biz],
	TRY_CAST(REPLACE([cleanliness_rating], '.0', '') AS INT)		    AS [cleanliness_rating],
	TRY_CAST(REPLACE([guest_satisfaction_overall], '.0', '') AS INT)    AS [guest_satisfaction_overall],
	TRY_CAST([bedrooms] AS INT)                                         AS [bedrooms],
	TRY_CAST([dist] AS DECIMAL(9,4))                                    AS [dist],
	TRY_CAST([metro_dist] AS DECIMAL(9,4))                              AS [metro_dist],
	TRY_CAST([attr_index] AS DECIMAL(9,4))                              AS [attr_index],
	TRY_CAST([attr_index_norm] AS DECIMAL(9,4))                         AS [attr_index_norm],
	TRY_CAST([rest_index] AS DECIMAL(9,4))                              AS [rest_index],
	TRY_CAST([rest_index_norm] AS DECIMAL(9,4))                         AS [rest_index_norm],
	TRY_CAST([lng] AS DECIMAL(9,4))                                     AS [lng],
	TRY_CAST([lat] AS DECIMAL(9,4))                                     AS [lat]
INTO [SILVER].[ViennaWeekends]
FROM [BRONZE].[ViennaWeekends]