use world;
select * from actor;
select *  from movie;
select * from cast;
select *  from director;
select * from genres;
select * from movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;

 #Q.1 Write a query where it should contain all the data of the movies which were released after 1995 having their movie duration greater than 120 and should be including A in their movie title.

select *  from movie where mov_year <= 1995 and mov_time > 120 and mov_title like "%a%" ;

#Q.2 Write an SQL query to find the actors who played a role in the movie 'Chinatown'. Fetch all the fields of actor table. (Hint: Use the IN operator)

SELECT * FROM actor WHERE act_id IN(SELECT act_id FROM cast WHERE mov_id IN (SELECT mov_id FROM movie WHERE mov_title='Chinatown'));

#Q.3  Write an SQL query for extracting the data from the ratings table for the movie who got the maximum number of ratings

SELECT movie.mov_id as id_movie,movie.mov_title,ratings.num_o_ratings,ratings.mov_id as id_movie from movie 
NATURAL join ratings where num_o_ratings = (select max(num_o_ratings)from ratings);


#Q.4 . Write an SQL query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.

select mov_title,mov_year from movie where mov_rel_country = 'UK' order by mov_year limit 7;

# Q.5  Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and their movie year was 2001.
set SQL_SAFE_UPDATES = 0;
update movie SET mov_lang = 'Chinese'  WHERE mov_lang = 'Japanese' and mov_year = 2001;
select * from world.movie where mov_lang = 'Chinese' and mov_year = 2001;


# Q6 Print genre title, maximum movie duration and the count the number of movies in each genre.

SELECT gen_title, max(mov_time), COUNT(gen_title) FROM movie NATURAL JOIN  movie_genres NATURAL JOIN  genres GROUP BY gen_title;

#Q.7 Create a view which should contain the first name, last name, title of the movie & role played by particular actor.

create view view_1 as
select mov_title, act_fname, act_lname, cast.role as role_played from movie 
join cast on cast.mov_id = movie.mov_id join actor  ON 
cast.act_id = actor.act_id;

select * from view_1;


# Q.8 Display the movies that were released before 31st March 1995.
SELECT mov_title, mov_dt_rel FROM movie WHERE ( mov_dt_rel > '3/31/1995');

# Q. 9 Write a query which fetch the first name, last name & role  played by the actor where output should all exclude Male actors.
select actor.act_id, actor.act_fname, actor.act_lname, cast.role from actor, cast where actor.act_id = cast.act_id and actor.act_gender = "F";




 # Q 10. Insert five rows into the cast table where the ids for movie should be 936,939,942,930,941 and  their respective roles should be Darth Vader, Sarah Connor, Ethan Hunt, Travis Bickle, Antoine Doinel & their actor ids should be set up as  126,140,135,131,144.
 
 Insert into cast (act_id,mov_id,role)values (126,936,"Darth Vader"),
						(140,939, "Sarah Connor"),
						(135,942, "Ethan Hunt"),
						(131,930, "Travis Bickle"),
						(144,941, "Antoine Doinel");
                        
select *from cast;