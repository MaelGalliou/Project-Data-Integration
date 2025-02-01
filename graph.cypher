////////////////// Import Nodes //////////////////

// 1️⃣ Import Shows
CREATE INDEX show_id_index FOR (s:Show) ON (s.show_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/film.csv' AS row
MERGE (s:Show {show_id: row.show_id})
SET s.title = row.title,
    s.date_added = row.date_added,
    s.release_year = toInteger(row.release_year),
    s.rating = row.rating,
    s.description = row.description;


// 2️⃣ Import Categories
CREATE INDEX categorie_id_index FOR (c:Categorie) ON (c.categorie_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/categorie.csv' AS row
MERGE (c:Categorie {categorie_id: row.categorie_id})
SET c.categorie_name = row.categorie;


// 3️⃣ Import Countries
CREATE INDEX country_id_index FOR (c:Country) ON (c.country_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/country.csv' AS row
MERGE (c:Country {country_id: row.country_id})
SET c.country_name = row.country;


// 4️⃣ Import Casts
CREATE INDEX cast_id_index FOR (c:Cast) ON (c.cast_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/cast.csv' AS row
MERGE (c:Cast {cast_id: row.cast_id})
SET c.cast_name = row.cast;


// 5️⃣ Import Directors
CREATE INDEX director_id_index FOR (d:Director) ON (d.director_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/director.csv' AS row
MERGE (d:Director {director_id: row.director_id})
SET d.director_name = row.director;


// 6️⃣ Import Types
CREATE INDEX type_id_index FOR (t:Type) ON (t.type_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/type.csv' AS row
MERGE (t:Type {type_id: row.type_id})
SET t.type_name = row.type;



////////////////// Import Relation //////////////////

// 1️⃣ Relation between Show and Cast
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/film-cast.csv' AS row
MATCH (s:Show {show_id: row.show_id}), (c:Cast {cast_id: row.cast_id})
MERGE (s)-[:HAS_CAST]->(c);

// 2️⃣ Relation between Show and Categorie
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/film-categorie.csv' AS row
MATCH (s:Show {show_id: row.show_id}), (c:Categorie {categorie_id: row.categorie_id})
MERGE (s)-[:HAS_CATEGORIE]->(c);

// 3️⃣ Relation between Show and Country
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/film-country.csv' AS row
MATCH (s:Show {show_id: row.show_id}), (c:Country {country_id: row.country_id})
MERGE (s)-[:HAS_COUNTRY]->(c);

// 4️⃣ Relation between Show and Director
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/film-director.csv' AS row
MATCH (s:Show {show_id: row.show_id}), (d:Director {director_id: row.director_id})
MERGE (s)-[:HAS_DIRECTOR]->(d);

// 5️⃣ Relation between Show and Type
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/film-type.csv' AS row
MATCH (s:Show {show_id: row.show_id}), (t:Type {type_id: toInteger(row.type_id)})
MERGE (s)-[:HAS_TYPE {duration: row.duration}]->(t);

