USE Film_Studio;

ALTER TABLE actor
ADD CONSTRAINT checkUniqueActorName
UNIQUE (act_fname , act_lname , act_gender)

ALTER TABLE director
ADD CONSTRAINT checkUniqueDirectorname
UNIQUE (dir_fname , dir_lname)

ALTER TABLE movie
ADD CONSTRAINT checkUniqueMovieName
UNIQUE (mov_title , mov_year , mov_time , mov_lang , mov_rl_dt , mov_rel_country )

ALTER TABLE rating
ADD CONSTRAINT checkUniqueRating
UNIQUE (mov_id , rev_id)

ALTER TABLE movieCast
ADD CONSTRAINT checkUniqueMovieCast
UNIQUE (mov_id , act_id)

ALTER TABLE movieDirection
ADD CONSTRAINT checkUniqueDirection
UNIQUE (mov_id , dir_id)
