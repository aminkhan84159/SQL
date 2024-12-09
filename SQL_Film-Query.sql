USE Film_Studio;

-- 1st Query
SELECT 
	mov_title AS Title,
	mov_year AS Year
FROM
	movie
WHERE
	mov_year < 1998
ORDER BY
	mov_year;


--2nd Query
SELECT 
	ISNULL(re.rev_name,'Name Not Available') Reviewer_Name
FROM
	Reviewer re
INNER JOIN Rating ra
	ON ra.rev_id = re.rev_id
WHERE
	ra.rev_stars >= 7
ORDER BY
	ra.rev_stars;


--3rd Query
SELECT
	mov_id AS 'Movie ID',
	mov_title AS 'Title',
	mov_year AS 'Release Year'
FROM
	movie
WHERE
	mov_title LIKE '%Boogie Nights%'
ORDER BY
	mov_year;


--4th Query
SELECT
	mov_title AS 'Title',
	mov_year AS 'Year',
	mov_time AS 'Time',
	mov_rl_dt AS 'Release Date',
	mov_rel_country AS 'Country'
FROM 
	movie
WHERE
	mov_rel_country NOT LIKE '%UK%'
ORDER BY
	Year


--5th Query
SELECT 
	m.mov_year
FROM
	movie m
INNER JOIN Rating r
	ON m.mov_id = r.mov_id
WHERE
	r.rev_stars >= 3
GROUP BY
	m.mov_year
ORDER BY 
	m.mov_year;


--6th Query
SELECT
	m.mov_title Title
FROM
	movie m
INNER JOIN Rating r
	ON r.mov_id = m.mov_id
WHERE
	r.num_o_ratings IS NULL
ORDER BY
	m.mov_title;


--7th Query
SELECT
	re.rev_name AS 'Reviewer Name',
	mo.mov_title AS 'Movie Title',
	ra.rev_stars AS 'Ratings'
FROM	
	Reviewer re
INNER JOIN Rating ra
	ON ra.rev_id = re.rev_id
INNER JOIN movie mo
	ON mo.mov_id = ra.mov_id
WHERE 
	ra.rev_stars IS NOT NULL AND re.rev_name IS NOT NULL
ORDER BY
	re.rev_name,
	mo.mov_title,
	ra.rev_stars;


 --8th Query
SELECT
	di.dir_fname +' '+ di.dir_lname AS 'Full Name',
	m.mov_title AS Title
 FROM
	director di
INNER JOIN Movie_Direction	md
	ON md.dir_id = di.dir_id
INNER JOIN movie m
	ON m.mov_id = md.mov_id
WHERE
	m.mov_title = 'Eyes Wide Shut';


--9th Query
SELECT
	ac.act_fname 'First Name',
	ac.act_lname 'Last Name',
	mo.mov_title 'Movie Name',
	YEAR(mo.mov_rl_dt) 'Release Date',
	mo.mov_year 'Year'
FROM	
	actor ac
INNER JOIN Movie_cast mc
	ON mc.act_id = ac.act_id
INNER JOIN movie mo
	ON mo.mov_id = mc.mov_id
WHERE
	mo.mov_year NOT BETWEEN 1990 AND 2000 AND mo.mov_rl_dt IS NOT NULL;


--10th Query
SELECT
	ge.gen_title Title,
	AVG(mo.mov_time) AverageTime,
	mg.gen_id GenId,
	COUNT(mo.mov_id) MovieCount
FROM	
	genres ge
INNER JOIN Movie_Genres mg
	ON mg.gen_id = ge.gen_id
INNER JOIN movie mo
	ON mo.mov_id = mg.mov_id
GROUP BY
	mg.gen_id , ge.gen_title

--Hihgest rated movie of each actor
SELECT 
	ac.act_fname  Actor,
	MAX(ra.rev_stars) Rating
FROM
	actor ac
JOIN Movie_cast mc
	ON mc.act_id = ac.act_id
JOIN movie mo
	ON mo.mov_id = mc.mov_id
LEFT JOIN Rating ra
	ON ra.mov_id = mo.mov_id
GROUP BY
	ac.act_fname
ORDER BY
	Rating DESC;


--2nd highest rated movie of each actor
WITH T1 AS
(SELECT
	ac1.act_fname,
	ra1.rev_stars
FROM
	Rating ra1
JOIN Movie_cast mc1
	ON mc1.mov_id = ra1.mov_id
LEFT JOIN actor ac1
	ON ac1.act_id = mc1.act_id
GROUP BY
	ac1.act_fname,
	ra1.rev_stars)
SELECT
	A.act_fname Actor,
	MAX(A.rev_stars) Ratings
FROM
	T1 A
JOIN T1 B
	ON A.act_fname = B.act_fname
WHERE
	A.rev_stars < B.rev_stars
GROUP BY
	A.act_fname
ORDER BY
	'Ratings' DESC