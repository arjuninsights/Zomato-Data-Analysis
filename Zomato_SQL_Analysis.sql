-- ============================================================
-- ZOMATO RESTAURANT ANALYSIS
-- ============================================================


-- ============================================================
-- CHECKING DATA IMPORTED SUCCESSFULLY
-- ============================================================

SELECT *
FROM zomato_data
FETCH FIRST 5 ROWS ONLY;


-- ============================================================
-- 1. RESTAURANT MARKET ANALYSIS
-- ============================================================


-- ------------------------------------------------------------
-- Q1. How many restaurants are listed on Zomato?
-- ------------------------------------------------------------

SELECT COUNT(*) AS total_restaurants
FROM zomato_data;


-- ------------------------------------------------------------
-- Q2. Which type of restaurant is most common in the dataset?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS restaurant_count
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY restaurant_count DESC
FETCH FIRST 1 ROW ONLY;


-- ------------------------------------------------------------
-- Q3. Which type of restaurant is least common in the dataset?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS restaurant_count
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY restaurant_count ASC
FETCH FIRST 1 ROW ONLY;


-- ------------------------------------------------------------
-- Q4. How are restaurants distributed across
--     Buffet, Cafes, Dining and Other categories?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS restaurant_count,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM zomato_data),
        2
    ) AS percentage
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY restaurant_count DESC;



-- ============================================================
-- 2. ONLINE ORDERING ANALYSIS
-- ============================================================


-- ------------------------------------------------------------
-- Q1. How many restaurants offer online ordering?
-- ------------------------------------------------------------

SELECT COUNT(*) AS online_order_restaurants
FROM zomato_data
WHERE ONLINE_ORDER = 'Yes';


-- ------------------------------------------------------------
-- Q2. How many restaurants do not offer online ordering,
--     and what are their names?
-- ------------------------------------------------------------

SELECT 
    NAME
FROM zomato_data
WHERE ONLINE_ORDER = 'No';


-- Count of restaurants without online ordering

SELECT COUNT(*) AS restaurants_without_online_order
FROM zomato_data
WHERE ONLINE_ORDER = 'No';


-- ------------------------------------------------------------
-- Q3. What percentage of restaurants offer online ordering?
-- ------------------------------------------------------------

SELECT 
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN ONLINE_ORDER = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS online_order_percentage
FROM zomato_data;


-- ------------------------------------------------------------
-- Q4. Which restaurant type has the highest adoption
--     of online ordering?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS total_restaurants,
    SUM(
        CASE 
            WHEN ONLINE_ORDER = 'Yes' THEN 1
            ELSE 0
        END
    ) AS online_order_restaurants,
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN ONLINE_ORDER = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS online_order_percentage
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY online_order_percentage DESC;


-- ------------------------------------------------------------
-- Q5. How does average customer engagement differ between
--     restaurants with and without online ordering?
-- ------------------------------------------------------------

SELECT 
    ONLINE_ORDER,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(VOTES), 2) AS average_votes
FROM zomato_data
GROUP BY ONLINE_ORDER;


-- Online Order vs Average Votes and Rating

SELECT 
    ONLINE_ORDER,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(VOTES), 2) AS average_votes,
    ROUND(AVG(RATING), 2) AS average_rating
FROM zomato_data
GROUP BY ONLINE_ORDER;



-- ============================================================
-- 3. TABLE BOOKING ANALYSIS
-- ============================================================


-- ------------------------------------------------------------
-- Q1. How many restaurants offer table booking?
-- ------------------------------------------------------------

SELECT COUNT(*) AS table_booking_restaurants
FROM zomato_data
WHERE BOOK_TABLE = 'Yes';


-- ------------------------------------------------------------
-- Q2. How many restaurants do not offer table booking,
--     and what are their names?
-- ------------------------------------------------------------

SELECT NAME
FROM zomato_data
WHERE BOOK_TABLE = 'No';


-- Count of restaurants without table booking

SELECT COUNT(*) AS restaurants_without_table_booking
FROM zomato_data
WHERE BOOK_TABLE = 'No';


-- ------------------------------------------------------------
-- Q3. What percentage of restaurants offer table booking?
-- ------------------------------------------------------------

SELECT 
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN BOOK_TABLE = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS table_booking_percentage
FROM zomato_data;


-- ------------------------------------------------------------
-- Q4. Which restaurant type has the highest adoption
--     of table booking?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS total_restaurants,
    SUM(
        CASE 
            WHEN BOOK_TABLE = 'Yes' THEN 1
            ELSE 0
        END
    ) AS table_booking_restaurants,
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN BOOK_TABLE = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS table_booking_percentage
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY table_booking_percentage DESC;


-- ------------------------------------------------------------
-- Q5. How does average restaurant rating differ between
--     restaurants with and without table booking?
-- ------------------------------------------------------------

SELECT 
    BOOK_TABLE,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(RATING), 2) AS average_rating
FROM zomato_data
GROUP BY BOOK_TABLE;


-- Table Booking vs Average Rating and Votes

SELECT 
    BOOK_TABLE,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(RATING), 2) AS average_rating,
    ROUND(AVG(VOTES), 2) AS average_votes
FROM zomato_data
GROUP BY BOOK_TABLE;



-- ============================================================
-- 4. CUSTOMER ANALYSIS
-- ============================================================


-- ------------------------------------------------------------
-- Q1. Which restaurant has received the highest number
--     of customer votes?
-- ------------------------------------------------------------

SELECT 
    NAME,
    VOTES
FROM zomato_data
ORDER BY VOTES DESC
FETCH FIRST 1 ROW ONLY;


-- ------------------------------------------------------------
-- Q2. Which restaurant has the highest rating?
-- ------------------------------------------------------------

SELECT 
    NAME,
    RATING
FROM zomato_data
ORDER BY RATING DESC
FETCH FIRST 1 ROW ONLY;


-- Highest Rated Restaurant with Votes

SELECT 
    NAME,
    RATING,
    VOTES
FROM zomato_data
ORDER BY RATING DESC
FETCH FIRST 1 ROW ONLY;


-- ------------------------------------------------------------
-- Q3. Which restaurant type receives the highest average
--     number of customer votes?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(VOTES), 2) AS average_votes
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY average_votes DESC;


-- ------------------------------------------------------------
-- Q4. How does the average rating vary across
--     restaurant types?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(RATING), 2) AS average_rating
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY average_rating DESC;


-- ------------------------------------------------------------
-- Q5. Which restaurants have above-average customer votes
--     but below-average ratings?
-- ------------------------------------------------------------

SELECT 
    NAME,
    VOTES,
    RATING,
    COST
FROM zomato_data
WHERE VOTES > (
    SELECT AVG(VOTES)
    FROM zomato_data
)
AND RATING < (
    SELECT AVG(RATING)
    FROM zomato_data
)
ORDER BY VOTES DESC;



-- ============================================================
-- 5. PRICING ANALYSIS
-- ============================================================


-- ------------------------------------------------------------
-- Q1. Which restaurant has the highest cost?
-- ------------------------------------------------------------

SELECT 
    NAME,
    COST
FROM zomato_data
ORDER BY COST DESC
FETCH FIRST 1 ROW ONLY;


-- ------------------------------------------------------------
-- Q2. What is the average cost for each restaurant type?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(COST), 2) AS average_cost
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY average_cost DESC;


-- ------------------------------------------------------------
-- Q3. Which restaurant type has the lowest average cost?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    ROUND(AVG(COST), 2) AS average_cost
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY average_cost ASC
FETCH FIRST 1 ROW ONLY;


-- ------------------------------------------------------------
-- Q4. How does restaurant cost vary with rating?
-- ------------------------------------------------------------

-- Analysis by Restaurant Type

SELECT 
    LISTED_IN_TYPE,
    ROUND(AVG(COST), 2) AS average_cost,
    ROUND(AVG(RATING), 2) AS average_rating
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY average_rating DESC;


-- Analysis by Cost Category

SELECT
    CASE
        WHEN COST < 500 THEN 'Low Cost'
        WHEN COST BETWEEN 500 AND 1000 THEN 'Medium Cost'
        ELSE 'High Cost'
    END AS cost_category,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(RATING), 2) AS average_rating
FROM zomato_data
GROUP BY
    CASE
        WHEN COST < 500 THEN 'Low Cost'
        WHEN COST BETWEEN 500 AND 1000 THEN 'Medium Cost'
        ELSE 'High Cost'
    END
ORDER BY average_rating DESC;


-- ------------------------------------------------------------
-- Q5. How does restaurant cost relate to customer engagement?
-- ------------------------------------------------------------

SELECT 
    LISTED_IN_TYPE,
    ROUND(AVG(COST), 2) AS average_cost,
    ROUND(AVG(VOTES), 2) AS average_votes
FROM zomato_data
GROUP BY LISTED_IN_TYPE
ORDER BY average_votes DESC;
