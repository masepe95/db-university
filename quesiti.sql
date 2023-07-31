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

SELECT C.`name` AS `course_name`, T.`name` AS `teacher_name`, T.`surname` AS `teacher_surname`
FROM `courses` AS C
JOIN `course_teacher` AS CT
ON C.`degree_id` = CT.`course_id`
JOIN `teachers` AS T
ON CT.`teacher_id` = T.`id`
WHERE T.`id` = 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT S.`id` AS `student_id`,
S.`name` AS `student_name`,
S.`surname` AS `student_surname`,
S.`registration_number` AS `student_registration_number`,
DEG.`name` AS `degree_name`,
DEG.`level` AS `degree_level`,
DEP.`name` AS `department_name`
FROM `students` AS S
JOIN `degrees` AS DEG
ON S.`degree_id` = DEG.`id`
JOIN `departments` AS DEP
ON DEG.`department_id` = DEP.`id`
ORDER BY S.`surname` ASC, S.`name` ASC;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT D.`id` AS `degree_id`,
D.`name` AS `degree_name`,
C.`name` AS `course_name`,
C.`period` AS `course_period`,
C.`year` AS `course_year`,
CT.`teacher_id`,
T.`name` AS `teacher_name`,
T.`surname` AS `teacher_surname`
FROM `degrees` AS D
JOIN `course_teacher` AS CT
ON D.`id` = CT.`course_id`
JOIN `courses` AS C
ON CT.`course_id` = C.`id`
JOIN `teachers` AS T
ON CT.`teacher_id` = T.`id`;

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT(T.`id`) AS `teacher_id`, T.`surname` AS `teacher_surname`, T.`name` AS `teacher_name`, DEP.`name` AS `department_name`
FROM `teachers` AS T
JOIN `course_teacher` AS CT
ON T.`id` = CT.`teacher_id`
JOIN `courses` AS C
ON CT.`course_id` = C.`id`
JOIN `degrees` AS DEG
ON C.`degree_id` = DEG.`id`
JOIN `departments` AS DEP
ON DEG.`department_id` = DEP.`id`
WHERE DEP.`id` = 5

-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

