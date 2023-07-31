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

SELECT * 
FROM `students` 
WHERE TIMESTAMPDIFF(Year, `date_of_birth`, curdate()) > 30;

-- SELEZIONARE TUTTI I CORSI DEL PRIMO SEMESTRE DEL PRIMO ANNO DI UN QUALSIASI CORSO DI LAUREA

SELECT * 
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1;

-- SELEZIONARE TUTTI GLI APPELLI D'ESAME CHE AVVENGONO NEL POMERIGGIO 8DOPO LE 14 DEL 20/06/2020

SELECT * 
FROM `exams`
WHERE HOUR(`hour`) >= '14'
AND `date` = '2020-06-20';

-- SELEZIONARE TUTTI I CORSI DI LAUREA MAGISTRALE

SELECT * 
FROM `degrees`
WHERE `level` = 'magistrale';

-- DA QUANTI DIPARTIMENTI E' COMPOSTA L'UNIVERSITA'?

SELECT COUNT(*) AS 'n_departments'
FROM `departments`;

-- QUANTI SONO GLI INSEGNANTI CHE NON HANNO UN NUMERO DI TELEFONO?

SELECT COUNT(*) AS `teachers_without_phone`
FROM `teachers`
WHERE `phone` IS NULL;

-- CONTARE QUANTI ISCRITTI CI SONO STATI OGNI ANNO

SELECT COUNT(*) AS `n_enrolled_students`, YEAR(`enrolment_date`) AS `year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- CONTARE GLI INSEGNANTI CHE HANNO L'UFFICIO NELLO STESSI EDIFICIO

SELECT COUNT(*) AS `n_teachers`, `office_address`
FROM `teachers`
GROUP BY `office_address`;

-- CALCOLARE LA MEDIA DEI VOTI DI OGNI APPELLO D'ESAME

SELECT AVG(`vote`), `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

-- CONTARE QUANTI CORSI DI LAUREA CI SONO PER OGNI DIPARTIMENTO

SELECT COUNT(*) AS `n_degrees`, `department_id`
FROM `degrees`
GROUP BY `department_id`;

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT S.`name`, S.`surname`, S.`registration_number`, D.`name`
FROM `students` AS S
JOIN `degrees` AS D
ON S.`degree_id` = D.`id`
WHERE S.`degree_id` = 53;

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT DEG.`id`, DEG.`name`, DEP.`name`
FROM `degrees` AS DEG
JOIN `departments` AS DEP
ON DEG.`department_id` = DEP.`id`
WHERE DEP.`id` = 7;

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)



-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome



-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti



-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)



-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

