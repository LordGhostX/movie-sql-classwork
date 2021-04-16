USE movieDB;

CREATE TABLE actor (
	act_id INTEGER NOT NULL,
	act_fname VARCHAR(20) NOT NULL,
	act_lname VARCHAR(20) NOT NULL,
	act_gender VARCHAR(1) NOT NULL,
    CONSTRAINT actor_PK PRIMARY KEY(act_id)
);

CREATE TABLE movie (
	mov_id INTEGER NOT NULL,
    mov_title VARCHAR(50) NOT NULL,
    mov_year INTEGER NOT NULL,
    mov_time INTEGER NOT NULL,
    mov_lang VARCHAR(50) NOT NULL,
    mov_dt_rel DATE NULL,
    mov_rel_country VARCHAR(5) NOT NULL,
    CONSTRAINT movie_PK PRIMARY KEY(mov_id)
);

CREATE TABLE movie_cast (
	act_id INTEGER NOT NULL,
	mov_id INTEGER NOT NULL,
	mov_role VARCHAR(30) NOT NULL,
    CONSTRAINT movie_cast_act_id FOREIGN KEY(act_id)
		REFERENCES actor(act_id),
	CONSTRAINT movie_cast_mov_id FOREIGN KEY(mov_id)
		REFERENCES movie(mov_id)
);

CREATE TABLE director (
	dir_id INTEGER NOT NULL,
    dir_fname VARCHAR(20) NOT NULL,
    dir_lname VARCHAR(20) NOT NULL,
    CONSTRAINT director_PK PRIMARY KEY(dir_id)
);

CREATE TABLE movie_direction (
	dir_id INTEGER NOT NULL,
	mov_id INTEGER NOT NULL,
    CONSTRAINT movie_direction_dir_id FOREIGN KEY(dir_id)
		REFERENCES director(dir_id),
	CONSTRAINT movie_direction_mov_id FOREIGN KEY(mov_id)
		REFERENCES movie(mov_id)
);

CREATE TABLE reviewer (
	rev_id INTEGER NOT NULL,
    rev_name VARCHAR(30) NULL,
    CONSTRAINT reviewer_PK PRIMARY KEY(rev_id)
);

CREATE TABLE rating (
	mov_id INTEGER NOT NULL,
    rev_id INTEGER NOT NULL,
    rev_stars DOUBLE NULL,
    num_o_ratings INTEGER NULL,
    CONSTRAINT rating_mov_id FOREIGN KEY(mov_id)
		REFERENCES movie(mov_id),
	CONSTRAINT rating_rev_id FOREIGN KEY(rev_id)
		REFERENCES reviewer(rev_id)
);

CREATE TABLE genres (
	gen_id INTEGER NOT NULL,
    gen_title VARCHAR(20) NOT NULL,
    CONSTRAINT genres_PK PRIMARY KEY(gen_id)
);

CREATE TABLE movie_genres (
	mov_id INTEGER NOT NULL,
	gen_id INTEGER NOT NULL,
    CONSTRAINT movie_genres_mov_id FOREIGN KEY(mov_id)
		REFERENCES movie(mov_id),
	CONSTRAINT movie_genres_gen_id FOREIGN KEY(gen_id)
		REFERENCES genres(gen_id)
);