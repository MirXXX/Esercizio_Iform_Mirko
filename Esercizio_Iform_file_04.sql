-- Inner Join 
SELECT 
    utenti.username, citta.nome
FROM
    utenti
        INNER JOIN
    citta ON utenti.id_citta = citta.id_citta;

-- --------------------------------------------------------------------------------------------------------------------------------
    
-- Left Join    
SELECT 
    utenti.username
FROM
    utenti
        LEFT JOIN
    citta ON utenti.id_citta = citta.id_citta
ORDER BY utenti.username;

-- --------------------------------------------------------------------------------------------------------------------------------

-- Right Join
SELECT 
    citta.nome
FROM
    regioni
        RIGHT JOIN
    citta ON regioni.id_regione = citta.id_citta;

/*
SELECT DISTINCT
    citta.nome
FROM
    regioni
        RIGHT JOIN
    citta ON regioni.id_regione = citta.id_citta;
-- ORDER BY citta.id_citta;
*/

-- --------------------------------------------------------------------------------------------------------------------------------

-- Full Outer Join -> Tutti gli elementi
SELECT 
    utenti.username, citta.nome
FROM
    utenti
        LEFT JOIN
    citta ON utenti.id_citta = citta.id_citta 
UNION SELECT 
    utenti.username, citta.nome
FROM
    utenti
        RIGHT JOIN
    citta ON utenti.id_citta = citta.id_citta;
 
-- --------------------------------------------------------------------------------------------------------------------------------

-- Inner Join delle tabelle "utenti", "regioni", "citta" -> Tutti gli elementi non nulli
    
SELECT 
    utenti.username, citta.nome, regioni.nome
FROM
    utenti
        INNER JOIN
    citta ON utenti.id_citta = citta.id_citta
        INNER JOIN
    regioni ON citta.id_regione = regioni.id_regione;
    
/*
SELECT 
    utenti.username, citta.nome, regioni.nome
FROM
    utenti
        INNER JOIN
    citta ON utenti.id_citta = citta.id_citta
        INNER JOIN
    regioni ON citta.id_regione = regioni.id_regione
WHERE
    regioni.id_regione = 1;
*/    
    
-- --------------------------------------------------------------------------------------------------------------------------------

-- WHERE vs DISTINCT
-- Con MIN(x) ottengo un numero di campi valutato/contato "x" volte. Se ho due campi uguali e x = 1 allora avrò come output un solo campo.
SELECT 
    username, MIN(1) 
FROM
    utenti
WHERE
    username IS NOT NULL
GROUP BY username;

SELECT 
    username, MIN(1)
FROM
    utenti
GROUP BY username;
    
SELECT DISTINCT
    username
FROM
    utenti;
    
-- --------------------------------------------------------------------------------------------------------------------------------
    
-- NOT NULL    
SELECT 
    *
FROM
    utenti
WHERE
    utenti.id_citta IS NOT NULL;
    
-- --------------------------------------------------------------------------------------------------------------------------------

-- Pattern matching

-- Tutti i nomi che iniziano con "a"
SELECT 
    *
FROM
    utenti
WHERE
    username LIKE 'a%';

-- Tutti i nomi nei quali è presente la coppia di caratteri "an"    
SELECT 
    *
FROM
    utenti
WHERE
    username LIKE '%an%';
    
-- Tutti i nomi che iniziano con "A" e la cui lunghezza è uguale a "A + 6 caratteri"    
SELECT 
    username
FROM
    utenti
WHERE
    username LIKE 'A______';

-- --------------------------------------------------------------------------------------------------------------------------------    
    
-- Espressioni regolari estese    

-- Tutti in cui è presente la lettera "b"
SELECT 
    username
FROM
    utenti
WHERE
    username RLIKE '[b]';
    
-- Tutti i nomi che iniziano con "a"    
SELECT 
    username
FROM
    utenti
WHERE
    username RLIKE '^a';

-- Tutti i nomi che terminano con "a"
SELECT 
    username
FROM
    utenti
WHERE
    username RLIKE 'a$';

-- Tutti i nomi di 5 lettere
SELECT 
    username
FROM
    utenti
WHERE
    username RLIKE '^.....$';

-- --------------------------------------------------------------------------------------------------------------------------------    

-- Limit

-- Le prime 5 città i cui nomi terminano con "a"
SELECT 
    nome
FROM
    citta
WHERE
    citta.nome LIKE '%a'
LIMIT 5;