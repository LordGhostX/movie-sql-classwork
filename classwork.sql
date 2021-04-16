USE movieDB;

SELECT mov_title, mov_year
FROM movie;
    
SELECT mov_year
FROM movie
WHERE mov_title = 'American Beauty';

SELECT mov_title
FROM movie
WHERE mov_year = 1999;

SELECT mov_title
FROM movie
WHERE mov_year < 1998;

SELECT mov_title
FROM movie
WHERE mov_year = 1999;

SELECT mov_title, rev_name
FROM rating JOIN reviewer JOIN movie
ON rating.rev_id = reviewer.rev_id
	AND rating.mov_id = movie.mov_id;
    
SELECT rev_name
FROM reviewer
WHERE rev_id IN (
	SELECT rev_id FROM rating WHERE rev_stars >= 7
);

SELECT mov_title
FROM movie
WHERE mov_id NOT IN (
	SELECT mov_id FROM rating
);

SELECT rev_name
FROM reviewer
WHERE rev_id IN (
	SELECT rev_id FROM rating WHERE rev_stars = NULL
);

SELECT *
FROM movie_cast
WHERE act_id IN (
	SELECT act_id FROM movie_cast WHERE mov_id IN (
		SELECT mov_id FROM movie WHERE mov_title = 'Eyes Wide Shut'
	)
)