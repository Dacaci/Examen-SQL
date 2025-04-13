1. Lister toutes les séries
SELECT * FROM series;

2. Lister toutes les séries des années 90s
SELECT * FROM series 
WHERE release_year >= 1990 AND release_year < 2000;

3. Lister toutes les séries Comedy et Sci-Fi en utilisant IN

SELECT * FROM series 
WHERE genre IN ('Comedy', 'Sci-Fi');

4. Lister tous les acteurs de Friends

SELECT a.name
FROM actors a
JOIN actorseries sa ON a.id = sa.actor_id
JOIN series s ON s.id = sa.series_id
WHERE s.title = 'Friends';

5. Lister tous les acteurs de Friends né en juillet

SELECT a.name, a.birthdate
FROM actors a
JOIN actorseries sa ON a.id = sa.actor_id
JOIN series s ON s.id = sa.series_id
WHERE s.title = 'Friends'
AND MONTH(a.birthdate) = 7;
 
6. Lister tous les acteurs (leur nom uniquement) et leurs séries (leur nom uniquement)

SELECT DISTINCT a.name AS actor_name, s.title AS series_title
FROM actors a
JOIN actorseries sa ON a.id = sa.actor_id
JOIN series s ON s.id = sa.series_id;

7. Lister les acteurs et le nombre de séries dans lesquelles ils ont joué

SELECT a.name AS actor_name, COUNT(sa.series_id) AS series_count
FROM actors a
JOIN actorseries sa ON a.id = sa.actor_id
GROUP BY a.id, a.name
ORDER BY series_count DESC;

8. 

SELECT a.name
FROM actors a
JOIN actorseries sa ON a.id = sa.actor_id
GROUP BY a.id, a.name
HAVING COUNT(sa.series_id) > 1;

9. 

SELECT COUNT(*) AS actors_with_one_series
FROM (
  SELECT a.id
  FROM actors a
  JOIN actorseries sa ON a.id = sa.actor_id
  GROUP BY a.id
  HAVING COUNT(sa.series_id) = 1
) AS single_series_actors;

10. 

SELECT s.title AS series_title, COUNT(sa.actor_id) AS actor_count
FROM series s
JOIN actorseries sa ON s.id = sa.series_id
GROUP BY s.id, s.title
ORDER BY actor_count DESC;

11. 

SELECT AVG(actor_count) AS average_actors_per_series
FROM (
  SELECT s.id, COUNT(sa.actor_id) AS actor_count
  FROM series s
  JOIN actorseries sa ON s.id = sa.series_id
  GROUP BY s.id
) AS moyenne_par_serie

