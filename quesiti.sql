-- SELEZIONARE TUTTI GLI STUDENTI NEL 1990

SELECT * 
FROM `students`
WHERE `date_of_birth` LIKE '1990%';

-- SELEZIONARE TUTTI I CORSI CHE VALGONO PIU' DI 10 CREDITI

SELECT * 
FROM `courses`
WHERE `cfu` > 10;

-- SELEZIONARE TUTTI GLI STUDENTI CHE HANNO PIU' DI 30 ANNI

SELECT * 
FROM `students`
WHERE `date_of_birth` < '1993-07-28';

-- SELEZIONARE TUTTI I CORSI DEL PRIMO SEMESTRE DEL PRIMO ANNO DI UN QUALSIASI CORSO DI LAUREA



-- SELEZIONARE TUTTI GLI APPELLI D'ESAME CHE AVVENGONO NEL POMERIGGIO 8DOPO LE 14) DEL 20/06/2020



-- SELEZIONARE TUTTI I CORSI DI LAUREA MAGISTRALE



-- DA QUANTI DIPARTIMENTI E' COMPOSTA L'UNIVERSITA'?



-- QUANTI SONO GLI INSEGNANTI CHE NON HANNO UN NUMERO DI TELEFONO?


-- CONTARE QUANTI ISCRITTI CI SONO STATI OGNI ANNO



-- CONTARE GLI INSEGNANTI CHE HANNO L'UFFICIO NELLO STESSI EDIFICIO



-- CALCOLARE LA MEDIA DEI VOTI DI OGNI APPELLO D'ESAME



-- CONTARE QUANTI CORSI DI LAUREA CI SONO PER OGNI DIPARTIMENTO

