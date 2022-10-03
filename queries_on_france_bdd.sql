-- 1. Obtenir la liste des 10 villes les plus peuplées en 2012

SELECT * FROM villes_france_free
ORDER BY ville_population_2012 DESC
LIMIT 10;


-- 2. Obtenir la liste des 50 villes ayant la plus faible superficie

SELECT * FROM villes_france_free
ORDER BY ville_surface
LIMIT 50;


-- 3. Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commence par “97”

SELECT * FROM departement WHERE departement_code LIKE "97%";


-- 4. Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé

SELECT ville_nom, departement_nom 
FROM villes_france_free v 
INNER JOIN departement d 
ON v.ville_departement = d.departement_code
ORDER BY ville_population_2012 DESC
LIMIT 10;

-- 5. Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au
-- sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes

SELECT departement_nom, departement_code, COUNT(*) AS num_communes
FROM departement 
INNER JOIN villes_france_free 
ON departement_code = ville_departement
GROUP BY departement_code
ORDER BY COUNT(*) DESC;


-- 6. Obtenir la liste des 10 plus grands départements, en terme de superficie

SELECT departement_nom, SUM(ville_surface) AS superficie FROM departement
INNER JOIN villes_france_free
ON ville_departement = departement_code
GROUP BY departement_nom
ORDER BY superficie DESC
LIMIT 10;


-- 7. Compter le nombre de villes dont le nom commence par “Saint”

SELECT COUNT(*)
FROM villes_france_free
WHERE ville_nom LIKE "Saint%";


-- 8. Obtenir la liste des villes qui ont un nom existant plusieurs fois, et trier afin d’obtenir en premier celles
-- dont le nom est le plus souvent utilisé par plusieurs communes

SELECT ville_nom, COUNT(*) FROM villes_france_free 
GROUP BY ville_nom
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;


-- 9. Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieure à la superficie moyenne

SELECT ville_nom, ville_surface
FROM villes_france_free 
WHERE ville_surface > (SELECT AVG(ville_surface) FROM villes_france_free);


-- 10.Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants

SELECT * FROM departement
INNER JOIN villes_france_free
ON departement_code = ville_departement
GROUP BY departement_nom
HAVING SUM(ville_population_2012) > 2000000;


-- 11. Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)

SELECT REPLACE(ville_nom, "-", " ")
FROM villes_france_free
WHERE ville_nom LIKE "SAINT-%";
