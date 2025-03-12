
# EVALUCION FINAL MODULO 2: SQL

Este archivo contiene una serie de consultas SQL para obtener información de la base de datos - Sakila -, que es una base de datos de ejemplo utilizada para prácticas con MySQL. Las consultas están organizadas en función de las tareas solicitadas como se puede observar. 


# Consultas SQL para la base de datos Sakila:

- Sakila - es una base de datos que simula la operación de una tienda de alquiler de películas, con tablas que incluyen detalles de las películas, actores, clientes, alquileres, inventario y categorías de películas. Las consultas están diseñadas para cubrir diversas necesidades de análisis e información sobre los datos de dicha base de datos.

# Descripción general:

Entre las tablas más relevantes en el contexto de las consultas SQL que se realizan, tenemos:

- film --> Contiene información sobre las películas, como el título, la duración, la clasificación y la descripción.
- actor --> Almacena los detalles de los actores, incluyendo su nombre y apellido.
- category --> Define las categorías de las películas (por ejemplo, "Acción", "Comedia", etc.).
- film_category --> Relaciona las películas con sus respectivas categorías.
- customer --> Almacena los datos de los clientes, como su nombre y dirección.
- rental --> Contiene detalles sobre los alquileres, como las fechas de alquiler y devolución.
- inventory --> Relaciona las películas con los inventarios, es decir, las copias de cada película disponibles para alquilar.

# Objetivos del proyecto:

Cabe destacar los siguientes:

- Obtener listas de títulos de películas y detalles relacionados con ellas (como la descripción y la clasificación).
- Analizar la duración de las películas y cómo se distribuyen según su clasificación o categoría.
- Identificar los actores que han trabajado en determinadas películas.
- Consultar los datos de alquileres, como la cantidad de películas alquiladas por cada cliente o la duración de los alquileres.

# Tipos de consultas realizadas:

1. Eliminación de valores duplicados
2. Filtrado de datos con el uso de la cláusula WHERE para restringir los resultados según ciertas condiciones.
3. Agrupamiento de resultados, ya que al utilizar GROUP BY, agrupamos las filas de la base de datos por un atributo común y luego aplicamos funciones de agregación como COUNT o AVG, para obtener información agregada.
4. Uniones de tablas a través de los INNNER JOIN ON para combinar datos de distintas tablas usando las claves foráneas que se encuentran en las columnas de las tablas.
5. Subconsultas que son consultas anidadas dentro de otras consultas.
6. Utilización de filtros con operadores como "BETWEEN, LIKE, NOT NULL", que permiten hacer búsquedas más específicas.

# Conclusión

Este conjunto de consultas SQL demuestra cómo realizar análisis avanzados sobre una base de datos compleja, utilizando varias técnicas de filtrado, agrupamiento, uniones y subconsultas. Estas consultas son útiles para obtener información específica de la base de datos Sakila y se pueden adaptar para realizar tareas más complejas o específicas, dependiendo de los requisitos del análisis de datos.

