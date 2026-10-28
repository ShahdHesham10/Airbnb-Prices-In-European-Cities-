USE ProjectAirbnb;
GO


-- 1) Nulls and casting
-------------------------------------------------
-- Amsterdam weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[AmsterdamWeekdays];


-- Amsterdam weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[AmsterdamWeekends];


-- Casting Amsterdam weekdays --
SELECT * FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([attr_index] AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Amsterdam weekends --
SELECT * FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AmsterdamWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Athens weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[AthensWeekdays];


-- Athens weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[AthensWeekends];


-- Casting Athens weekdays --
SELECT * FROM [BRONZE].[AthensWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Athens weekends --
SELECT * FROM [BRONZE].[AthensWeekends] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[AthensWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- Barcelona weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[BarcelonaWeekdays];


-- Barcelona weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[BarcelonaWeekends];


-- Casting Barcelona weekdays --
SELECT * FROM [BRONZE].[BarcelonaWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Barcelona weekends --
SELECT * FROM [BRONZE].[BarcelonaWeekends] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- Berlin weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[BerlinWeekdays];


-- Berlin weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[BerlinWeekends];


-- Casting Berlin weekdays --
SELECT * FROM [BRONZE].[BerlinWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BarcelonaWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Berlin weekends --
SELECT * FROM [BRONZE].[BerlinWeekends] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BerlinWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- Budapest weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[BudapestWeekdays];


-- Budapest weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[BudapestWeekends];


-- Casting Budapest weekdays --
SELECT * FROM [BRONZE].[BudapestWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Budapest weekends --
SELECT * FROM [BRONZE].[BudapestWeekends] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[BudapestWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- Lisbon weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[LisbonWeekdays];


-- Lisbon weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[LisbonWeekends];


-- Casting Lisbon weekdays --
SELECT * FROM [BRONZE].[LisbonWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Lisbon weekends --
SELECT * FROM [BRONZE].[LisbonWeekends] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LisbonWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- London weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[LondonWeekdays];


-- London weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[LondonWeekends];


-- Casting London weekdays --
SELECT * FROM [BRONZE].[LondonWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting London weekends --
SELECT * FROM [BRONZE].[LondonWeekends] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[LondonWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- Paris weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[ParisWeekdays];


-- Paris weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[ParisWeekends];


-- Casting Paris weekdays --
SELECT * FROM [BRONZE].[ParisWeekdays] 
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays] 
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Paris weekends --
SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends] 
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ParisWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- Rome weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[RomeWeekdays];


-- Rome weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[RomeWeekends];


-- Casting Vienna weekdays --
SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Rome weekends --
SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[RomeWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- Vienna weekdays nulls ---
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[ViennaWeekdays];


-- Vienna weekends nulls --
SELECT
	SUM(CASE WHEN [realSum] IS NULL OR [realSum] = '' THEN 1 ELSE 0 END) as realSum,
	SUM(CASE WHEN [room_type] IS NULL OR [room_type] = '' THEN 1 ELSE 0 END) as [room_type],
	SUM(CASE WHEN [room_shared] IS NULL OR [room_shared] = '' THEN 1 ELSE 0 END) as [room_shared],
	SUM(CASE WHEN [room_private] IS NULL OR [room_private] = '' THEN 1 ELSE 0 END) as [room_private],
	SUM(CASE WHEN [host_is_superhost] IS NULL OR [host_is_superhost] = '' THEN 1 ELSE 0 END) as [host_is_superhost],
	SUM(CASE WHEN [multi] IS NULL OR [multi] = '' THEN 1 ELSE 0 END) as [multi],
	SUM(CASE WHEN [biz] IS NULL OR [biz] = '' THEN 1 ELSE 0 END) as [biz],
	SUM(CASE WHEN [cleanliness_rating] IS NULL OR [cleanliness_rating] = '' THEN 1 ELSE 0 END) as [cleanliness_rating],
	SUM(CASE WHEN [guest_satisfaction_overall] IS NULL OR [guest_satisfaction_overall] = '' THEN 1 ELSE 0 END) as [guest_satisfaction_overall],
	SUM(CASE WHEN [bedrooms] IS NULL OR [bedrooms] = '' THEN 1 ELSE 0 END) as [bedrooms],
	SUM(CASE WHEN [dist] IS NULL OR [dist] = '' THEN 1 ELSE 0 END) as [dist],
	SUM(CASE WHEN [metro_dist] IS NULL OR [metro_dist] = '' THEN 1 ELSE 0 END) as [metro_dist],
	SUM(CASE WHEN [attr_index] IS NULL OR [attr_index] = '' THEN 1 ELSE 0 END) as [attr_index],
	SUM(CASE WHEN [attr_index_norm] IS NULL OR [attr_index_norm] = '' THEN 1 ELSE 0 END) as [attr_index_norm],
	SUM(CASE WHEN [rest_index] IS NULL OR [rest_index] = '' THEN 1 ELSE 0 END) as [rest_index],
	SUM(CASE WHEN [rest_index_norm] IS NULL OR [rest_index_norm] = '' THEN 1 ELSE 0 END) as [rest_index_norm],
	SUM(CASE WHEN [lng] IS NULL OR [lng] = '' THEN 1 ELSE 0 END) as [lng],
	SUM(CASE WHEN [lat] IS NULL OR [lat] = '' THEN 1 ELSE 0 END) as [lat]
FROM [BRONZE].[ViennaWeekends];


-- Casting Vienna weekdays --
SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays] 
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays] 
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekdays]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;

-- Casting Vienna weekends --
SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([realSum] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST (REPLACE([person_capacity], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST (REPLACE([cleanliness_rating], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST (REPLACE([guest_satisfaction_overall], '.0', '') AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([bedrooms] AS INT) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([metro_dist] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([attr_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([attr_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([rest_index] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([rest_index_norm] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([lng] AS DECIMAL) IS NULL;

SELECT * FROM [BRONZE].[ViennaWeekends]
WHERE TRY_CAST ([lat] AS DECIMAL) IS NULL;


-- 1) Categoring
-------------------------------------------------

-- Amesterdam weekdays
SELECT  [room_type], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [room_type];

SELECT  [room_shared], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [room_shared];

SELECT  room_private, COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY room_private;

SELECT  [host_is_superhost], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [host_is_superhost];

SELECT  [multi], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [multi];

SELECT  [biz], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [biz];

SELECT  [cleanliness_rating], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [cleanliness_rating];

SELECT  [metro_dist], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [metro_dist];

SELECT  [attr_index], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [attr_index];

SELECT  [rest_index], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekdays]
GROUP BY [rest_index];


-- Amsterdam weekends
SELECT  [room_type], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [room_type];

SELECT  [room_shared], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [room_shared];

SELECT  room_private, COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY room_private;

SELECT  [host_is_superhost], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [host_is_superhost];

SELECT  [multi], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [multi];

SELECT  [biz], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [biz];

SELECT  [cleanliness_rating], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [cleanliness_rating];

SELECT  [metro_dist], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [metro_dist];

SELECT  [attr_index], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [attr_index];

SELECT  [rest_index], COUNT(*) AS cnt
FROM [BRONZE].[AmsterdamWeekends]
GROUP BY [rest_index];