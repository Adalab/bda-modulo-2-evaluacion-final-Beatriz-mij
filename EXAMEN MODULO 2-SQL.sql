USE sakila;

/* 1.- Selecciona todos los nombres de las películas sin que aparezcan duplicados.*/
SELECT DISTINCT title -- Distinct: Elimina los duplicados en el resultado
		FROM film;

/* 2.- Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".*/
SELECT title, rating
	FROM film
    WHERE rating = "PG-13";
    
 /* 3.- Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su
descripción.*/
SELECT title, description 
	FROM film
    WHERE description LIKE "%amazing%";
    
/* 4.- Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.*/
SELECT title, length
	FROM film
    WHERE length > 120;
    
/* 5.- Recupera los nombres de todos los actores.*/

SELECT first_name
	FROM actor;
    
/* 6.- Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.*/
SELECT first_name, last_name
	FROM actor
    WHERE last_name LIKE "%Gibson%"; -- busca cualquier fila con el apellido Gibson
    
/* 7.- Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.*/
SELECT first_name, actor_id
	FROM actor
    WHERE actor_id BETWEEN 10 AND 20;

/* 8.- Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
clasificación.*/
SELECT title, rating
	FROM film
    WHERE rating NOT IN ("R", "PG-13");

/* 9.- Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la
clasificación junto con el recuento.*/
SELECT *
	FROM film;
    
SELECT rating, COUNT(*) -- cuenta todas las filas de películas dentro de cada grupo
	FROM film
    GROUP BY rating; -- agrupa las peliculas por su rating para saber cuántas hay
   
/* 10.- Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
nombre y apellido junto con la cantidad de películas alquiladas.*/
SELECT c.customer_id, CONCAT(c.first_name, " ", c.last_name), COUNT(r.inventory_id) -- esta es la cantidad de películas alquiladas
	FROM customer AS c
    INNER JOIN rental AS r
    ON c.customer_id = r.customer_id -- las dos tablas anteriores se unen por customer_id
    GROUP BY c.customer_id;
    
/* 11.- Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
junto con el recuento de alquileres.*/

SELECT c.name, COUNT(r.rental_id)
	FROM film_category AS fc
    INNER JOIN film AS f
    ON fc.film_id = f.film_id
    INNER JOIN inventory AS i
    ON f.film_id = i.film_id
    INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
    INNER JOIN category AS c 
    ON fc.category_id = c.category_id
    GROUP BY c.name;

/* 12.- Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y
muestra la clasificación junto con el promedio de duración.*/
SELECT f.rating AS clasificacion, AVG(f.length) AS media_duracion_pelis -- AVG calcula la media de los valores
	FROM film AS f
    GROUP BY f.rating; --  agrupo todas las películas que tienen la misma clasificación
    
/* 13.- Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".*/
SELECT CONCAT(a.first_name, " ", a.last_name), title
	FROM actor AS a
    INNER JOIN film_actor AS f_a
    ON a.actor_id = f_a.actor_id
    INNER JOIN film AS f
    ON f_a.film_id = f.film_id
    WHERE f.title = "Indian Love";
    
  /* 14.- Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.*/
SELECT f.title, f.description
	FROM film AS f
    WHERE f.description LIKE "%dog%" OR f.description LIKE "%cat";
    
/* 15.- Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor: NO, las tablas salen vacías*/
SELECT a.first_name, a.last_name
	FROM actor AS a
    LEFT JOIN film_actor AS f_a
    ON a.actor_id = f_a.actor_id
    WHERE f_a.actor_id IS NULL;
    
/* 16.- Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.*/
SELECT f.title, f.release_year
	FROM film AS f
    WHERE f.release_year BETWEEN 2005 AND 2010;
    
/*17.- Encuentra el título de todas las películas que son de la misma categoría que "Family".*/
SELECT f.title, c.name
	FROM film AS f
    INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id
    INNER JOIN category AS c
    ON fc.category_id = c.category_id
    WHERE c.name = "Family";
    
/* 18.- Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.*/
SELECT a.first_name, a.last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id -- agrupo por actor_id(tabla film_actor) porque queremos contar cuántas películas tiene cada actor
    HAVING COUNT(fa.film_id) > 10; -- aquí filtro solo aquellos actores donde su nº de pelis es mayor que 10 y el COUNT nos dice cuántas pelis están asociadas a cada actor
    
/* 19.- Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la
tabla film.*/
SELECT title, rating, length
	FROM film
    WHERE rating = "R" AND length > 120;
    
/* 20.- Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
muestra el nombre de la categoría junto con el promedio de duración.*/
SELECT c.name AS categorías_películas, AVG(length) AS media_duración_pelis
	FROM category AS c
    INNER JOIN film_category AS fc
    ON c.category_id = fc.category_id
    INNER JOIN film AS f
    ON fc.film_id = f.film_id
    GROUP BY c.category_id
    HAVING AVG(f.length) > 120;
    
/* 21.- Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto
con la cantidad de películas en las que han actuado.*/
SELECT CONCAT(a.first_name, " ", a.last_name) AS actores, COUNT(fa.film_id) AS filmografia
	FROM actor AS a
    INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) >= 5; -- filtro los actores que han actuado en al menos 5 pelis
    
/* 22.- Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una
subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las
películas correspondientes.*/
/*SELECT f.title
	FROM film AS f
    INNER JOIN inventory AS i
    ON f.film_id = i.film_id
    INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
    WHERE r.rental_id IN (SELECT r2.rental_id
							FROM rental AS r2
                            WHERE datediff(r2.return_date, r2.rental_date) > 5);*/
                            
	
 /*   SELECT f.title, r3.duracion_alquiler
	FROM film AS f
    INNER JOIN inventory AS i
    ON f.film_id = i.film_id
    INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
    INNER JOIN (SELECT r2.rental_id, datediff(r2.return_date, r2.rental_date) AS duracion_alquiler
					FROM rental AS r2) AS r3
	ON r.rental_id = r3.rental_id
    WHERE r3.duracion_alquiler > 5;*/
					
    
    




    
/* 23.- Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría
"Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la
categoría "Horror" y luego exclúyelos de la lista de actores.*/


/* 24.- Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en
la tabla film.*/
SELECT f.title, c.name, f.length
	FROM film AS f
    INNER JOIN film_category AS fc 
    ON f.film_id = fc.film_id
    INNER JOIN category AS c
    ON fc.category_id = c.category_id
    WHERE c.name = "Comedy" AND f.length > 180;
