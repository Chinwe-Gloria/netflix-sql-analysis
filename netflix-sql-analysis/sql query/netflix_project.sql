SELECT TOP (10)*
FROM dbo.netflix_titles

WITH RankedRows AS (
  SELECT *, ROW_NUMBER() OVER (
    PARTITION BY title, release_year, type
    ORDER BY show_id
  ) AS rn
  FROM dbo.netflix_titles
)
DELETE FROM RankedRows WHERE rn > 1;

UPDATE dbo.netflix_titles SET director = 'Unknown' WHERE director IS NULL;
UPDATE dbo.netflix_titles SET country = 'Unknown' WHERE country IS NULL;

--Summary Queries  Movies vs TV Shows
SELECT type, COUNT(*) AS total
FROM dbo.netflix_titles
GROUP BY type;

--Top 10 Countries by Content Count
SELECT TOP 10 country, COUNT(*) AS total
FROM dbo.netflix_titles
GROUP BY country
ORDER BY total DESC;

-- Distribution of content over time by date_added
SELECT date_added, COUNT(*) AS total
FROM dbo.netflix_titles
WHERE date_added IS NOT NULL
GROUP BY date_added
ORDER BY date_added;

-- Distribution of content over time by month added
SELECT 
  FORMAT(CAST(date_added AS DATE), 'yyyy-MM') AS month_added,
  COUNT(*) AS total_titles
FROM dbo.netflix_titles
WHERE date_added IS NOT NULL
GROUP BY FORMAT(CAST(date_added AS DATE), 'yyyy-MM')
ORDER BY month_added;


--Top Genres on Netflix
SELECT
	show_id,
	LTRIM(RTRIM(value)) AS genre
	INTO genre_split
	FROM dbo.netflix_titles
	CROSS APPLY string_split(listed_in,',');

SELECT TOP 10
	genre, COUNT(*) AS count
FROM genre_split
GROUP BY genre
ORDER BY count DESC

--Most Featured Directors
SELECT TOP 10
	director, COUNT(*) AS total_titles
FROM dbo.netflix_titles
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total_titles DESC

--Top Contributing Countries by Movies/TV Type
SELECT 
	country, type, COUNT(*) AS total
FROM dbo.netflix_titles
GROUP BY country, type
ORDER BY total DESC

--Content Growth by Movie Release Year
SELECT 
	release_year,
	COUNT(*) AS total_titles
FROM dbo.netflix_titles
GROUP BY release_year
ORDER BY release_year DESC
