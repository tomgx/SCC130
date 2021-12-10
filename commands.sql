-- SCC130 Database Coursework

-- Q1.	Which artists have a start year in or after 1995, and are still active (i.e., the end year is unknown)?

SELECT
   * 
FROM
   artists 
WHERE
   start_year >= 1995 
   AND end_year IS NULL;


-------------------------------------------------------------------------------------------------------------------
-- Q2.	Find all artists that are called "R…" (e.g. "Rahsaan Roland Kirk"), who are not from the United Kingdom. 
-- List your results along with the country of origin, start year and sorted by the year started, earliest first.

SELECT
   * 
FROM
   artists 
WHERE
   name like 'R%' 
   AND origin != 'United Kingdom' 
ORDER BY
   start_year DESC;


-------------------------------------------------------------------------------------------------------------------
-- Q3.	From the tracks that have a position less or equal to 3, What is the minimum and 
-- maximum length of these tracks which have a length listed (i.e., not NULL)? 

SELECT
   MAX(length) AS 'maximum length',
   MIN(length) AS 'minimum length' 
FROM
   tracks 
WHERE
   position <= 3;


-------------------------------------------------------------------------------------------------------------------
-- Q4.	Which years had the most albums released, list the top-3 years. 
-- Include the number of albums released in that year in your result.

SELECT
   release_year AS 'Release Year',
   COUNT(release_year) AS 'Number of Albums' 
FROM
   albums 
GROUP BY
   release_year 
ORDER BY
   COUNT(release_year) DESC LIMIT 3;



-------------------------------------------------------------------------------------------------------------------
-- Q5.	Produce a track listing (ordered from the shortest one to the longest one based on the length) 
-- for the album named "Blue Lines". Include the position, name, and length.

SELECT
   position AS 'Position',
   name AS 'Tracks from Blue Lines Album',
   length AS 'Length' 
FROM
   tracks 
WHERE
   album_id IN
   (
      SELECT
         id 
      FROM
         albums 
      WHERE
         name = 'Blue Lines'
   )
ORDER BY
   length ASC;


-------------------------------------------------------------------------------------------------------------------
