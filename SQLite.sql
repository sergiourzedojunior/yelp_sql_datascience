-- Active: 1707677310290@@127.0.0.1@1433#checkin
-- SELECT
--   COUNT(*) AS total_linhas,
--   COUNT(DISTINCT business_id) AS total_negocios,
--   COUNT(DISTINCT city) AS total_cidades,
--   COUNT(DISTINCT state) AS total_estados,
--   AVG(stars) AS media_estrelas,
--   AVG(review_count) AS media_avaliacoes,
--   SUM(is_open) AS total_abertos
-- FROM business
-- WHERE business_id IS NOT NULL;


-- Unificar as tabelas business e review
SELECT
  b.name AS nome_negocio,
  b.city AS cidade,
  b.state AS estado,
  b.stars AS estrelas_negocio,
  r.user_id AS id_usuario,
  r.stars AS estrelas_avaliacao,
  r.text AS texto_avaliacao,
  r.date AS data_avaliacao
FROM business b
INNER JOIN review r
ON b.business_id = r.business_id;

-- 1. Profile the data by finding the total number of records for each of the tables below:

SELECT COUNT(*) AS total_records
FROM business;

SELECT COUNT(*) AS total_records
FROM user;

SELECT COUNT(*) AS total_records
FROM review;

SELECT COUNT(*) AS total_records
FROM checkin;

SELECT COUNT(*) AS total_records
FROM tip;



-- 2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

SELECT COUNT(DISTINCT business_id) AS total_distinct_records
FROM business;


SELECT COUNT(DISTINCT business_id) AS total_distinct_records
FROM checkin;

SELECT COUNT(DISTINCT user_id) AS total_distinct_records
FROM tip;

SELECT COUNT(DISTINCT business_id) AS total_distinct_records
FROM tip;

SELECT COUNT(DISTINCT business_id) AS total_distinct_records
FROM review;

SELECT COUNT(DISTINCT user_id) AS total_distinct_records
FROM review;

SELECT COUNT(DISTINCT user_id) AS total_distinct_records
FROM tip;

SELECT COUNT(DISTINCT business_id) AS total_distinct_records
FROM tip;



-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
SELECT 
    CASE
        WHEN COUNT(*) > 0 THEN 'Yes'
        ELSE 'No'
    END AS null_values_exist
FROM user
WHERE 
    user_id IS NULL
    OR name IS NULL
    OR review_count IS NULL
    OR yelping_since IS NULL
    OR useful IS NULL
    OR funny IS NULL
    OR cool IS NULL
    OR elite IS NULL
    OR friends IS NULL
    OR fans IS NULL
    OR average_stars IS NULL
    OR compliment_hot IS NULL
    OR compliment_more IS NULL
    OR compliment_profile IS NULL
    OR compliment_cute IS NULL
    OR compliment_list IS NULL
    OR compliment_note IS NULL
    OR compliment_plain IS NULL
    OR compliment_cool IS NULL
    OR compliment_funny IS NULL
    OR compliment_writer IS NULL
    OR compliment_photos IS NULL;


-- ou desta forma

SELECT
    'user_id' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE user_id IS NULL
UNION ALL
SELECT
    'name' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE name IS NULL
UNION ALL
SELECT
    'review_count' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE review_count IS NULL
UNION ALL
SELECT
    'yelping_since' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE yelping_since IS NULL
UNION ALL
SELECT
    'useful' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE useful IS NULL
UNION ALL
SELECT
    'funny' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE funny IS NULL
UNION ALL
SELECT
    'cool' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE cool IS NULL
UNION ALL
SELECT
    'elite' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE elite IS NULL
UNION ALL
SELECT
    'friends' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE friends IS NULL
UNION ALL
SELECT
    'fans' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE fans IS NULL
UNION ALL
SELECT
    'average_stars' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE average_stars IS NULL
UNION ALL
SELECT
    'compliment_hot' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_hot IS NULL
UNION ALL
SELECT
    'compliment_more' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_more IS NULL
UNION ALL
SELECT
    'compliment_profile' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_profile IS NULL
UNION ALL
SELECT
    'compliment_cute' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_cute IS NULL
UNION ALL
SELECT
    'compliment_list' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_list IS NULL
UNION ALL
SELECT
    'compliment_note' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_note IS NULL
UNION ALL
SELECT
    'compliment_plain' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_plain IS NULL
UNION ALL
SELECT
    'compliment_cool' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_cool IS NULL
UNION ALL
SELECT
    'compliment_funny' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_funny IS NULL
UNION ALL
SELECT
    'compliment_writer' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_writer IS NULL
UNION ALL
SELECT
    'compliment_photos' AS column_name,
    COUNT(*) AS null_count
FROM user
WHERE compliment_photos IS NULL;




-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:
SELECT
    MIN(stars) AS min_stars,
    MAX(stars) AS max_stars,
    AVG(stars) AS avg_stars
FROM review;


SELECT
    MIN(stars) AS min_stars,
    MAX(stars) AS max_stars,
    AVG(stars) AS avg_stars
FROM business;


SELECT
    MIN(compliment_count) AS min_likes,
    MAX(compliment_count) AS max_likes,
    AVG(compliment_count) AS avg_likes
FROM tip;


SELECT
    MIN(business_id) AS min_count,
    MAX(business_id) AS max_count,
    AVG(business_id) AS avg_count
FROM nova_checkin;

SELECT
    COUNT(DISTINCT business_id) AS count_business_id
FROM nova_checkin;

SELECT
    date,
    COUNT(*) AS date_count
FROM nova_checkin
GROUP BY date;

SELECT
    MIN(date) AS min_date,
    MAX(date) AS max_date
FROM nova_checkin;


SELECT
    MIN(review_count) AS min_review_count,
    MAX(review_count) AS max_review_count,
    AVG(review_count) AS avg_review_count
FROM user;


-- 5. List the cities with the most reviews in descending order:

SELECT
    city,
    COUNT(*) AS review_count
FROM business
JOIN review ON business.business_id = review.business_id
GROUP BY city
ORDER BY review_count DESC
LIMIT 10;


-- 6. Find the distribution of star ratings to the business in the city of Avon:

SELECT
    stars AS star_rating,
    COUNT(*) AS count
FROM business
WHERE city = 'Avon'
GROUP BY stars;


SELECT
    stars AS star_rating,
    COUNT(*) AS count
FROM business
WHERE city = 'Beachwood'
GROUP BY stars;

-- 7. Find the top 3 users based on their total number of reviews:

SELECT
    user_id,
    COUNT(*) AS total_reviews
FROM review
GROUP BY user_id
ORDER BY total_reviews DESC
LIMIT 3;


-- 8. Does posing more reviews correlate with more fans?

SELECT
    user.review_count,
    AVG(user.fans) AS avg_fans
FROM user
GROUP BY user.review_count
ORDER BY user.review_count;



-- 9. Are there more reviews with the word "love" or with the word "hate" in them?
SELECT
    SUM(CASE WHEN text LIKE '%love%' THEN 1 ELSE 0 END) AS love_count,
    SUM(CASE WHEN text LIKE '%hate%' THEN 1 ELSE 0 END) AS hate_count
FROM review;

-- 10. Find the top 10 users with the most fans:
SELECT user_id, name, fans
FROM user
ORDER BY fans DESC
LIMIT 10;

SELECT is_open, AVG(stars) as average_rating
FROM business
WHERE city = 'Santa Barbara' AND categories LIKE '%Shopping%'
GROUP BY is_open;

SELECT business.is_open, COUNT(review.user_id) as review_count
FROM business
JOIN review ON business.business_id = review.business_id
WHERE city = 'Santa Barbara' AND categories LIKE '%Shopping%'
GROUP BY business.is_open;

SELECT business.is_open, review.stars, COUNT(review.user_id) as review_count
FROM business
JOIN review ON business.business_id = review.business_id
WHERE city = 'Santa Barbara' AND categories LIKE '%Shopping%'
GROUP BY business.is_open, review.stars;