/*Ex 1*/

Create or replace view vw_aluno_disciplina as
SELECT aluno.nome nome_aluno, disciplina.nome nome_disciplina, curso.nome nome_curso
From aluno 
Inner JOIN matricula on aluno.id_aluno = matricula.id_aluno
Inner JOIN disciplina on disciplina.id_disciplina = matricula.id_disciplina
Inner JOIN curso on curso.id_curso = disciplina.id_curso;

/*Ex 2*/
create view alunos_por_disciplina as 
select disciplinas.nome as disciplina_nome,
count(matriculas.aluno_id) as total_alunos
from disciplinas
left join matriculas on disciplinas.id = matriculas.disciplina_id
group by disciplinas.nome;

/*Ex 3*/
create view alunos_status_matricula as 
select alunos.nome as aluno_nome, disciplinas.nome as disciplina_nome, matriculas.status
from alunos
join matriculas on alunos.id = matriculas.aluno_id
join disciplinas on matriculas.disciplina_id = disciplinas.id;

/*Ex 4*/
create view alunos_maiores_20 as 
select nome, data_nascimento
from alunos
where date_part('year',
age(data_nascimento)) > 20;

/*Ex 5 */

CREATE VIEW alunos_maiores_20 AS
SELECT nome, data_nascimento
FROM alunos
WHERE DATE_PART('year', AGE(data_nascimento)) > 20;

/*Ex 6 */

CREATE VIEW cursos_carga_horaria AS
SELECT cursos.nome AS curso_nome, COUNT(disciplinas.id) AS total_disciplinas, SUM(disciplinas.carga_horaria) AS carga_horaria_total
FROM cursos
JOIN disciplinas ON cursos.id = disciplinas.curso_id
GROUP BY cursos.nome;

/*Ex 7 */

CREATE VIEW professores_especialidades AS
SELECT nome, especialidade
FROM professores;

/*Ex 8 */

CREATE VIEW alunos_multidisciplinas AS
SELECT alunos.nome, COUNT(matriculas.disciplina_id) AS total_disciplinas
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome
HAVING COUNT(matriculas.disciplina_id) > 1;

/*Ex 9 */

CREATE VIEW alunos_disciplinas_concluidas AS
SELECT alunos.nome, COUNT(matriculas.disciplina_id) AS total_concluidas
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.status = 'Concluído'
GROUP BY alunos.nome;

/*Ex 10 */

CREATE VIEW turmas_semestre AS
SELECT *
FROM turmas
WHERE semestre = '2024.1';

/*Ex 11 */

CREATE VIEW alunos_matriculas_trancadas AS
SELECT alunos.nome
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.status = 'Trancado';

/*Ex 12 */

CREATE VIEW disciplinas_sem_alunos AS
SELECT disciplinas.nome
FROM disciplinas
LEFT JOIN matriculas ON disciplinas.id = matriculas.disciplina_id
WHERE matriculas.aluno_id IS NULL;

/*Ex 13 */

CREATE VIEW alunos_por_status AS
SELECT matriculas.status, COUNT(matriculas.aluno_id) AS total_alunos
FROM matriculas
GROUP BY matriculas.status;

/*Ex 14 */

CREATE VIEW total_professores_especialidade AS
SELECT especialidade, COUNT(id) AS total_professores
FROM professores
GROUP BY especialidade;

/*Ex 15 */

CREATE VIEW alunos_idades AS
SELECT nome, DATE_PART('year', AGE(data_nascimento)) AS idade
FROM alunos;

/*Ex 16 */

CREATE VIEW alunos_ultimas_matriculas AS
SELECT alunos.nome, MAX(matriculas.data_matricula) AS ultima_matricula
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome;

/*Ex 17 */

CREATE VIEW disciplinas_curso AS
SELECT disciplinas.nome
FROM disciplinas
JOIN cursos ON disciplinas.curso_id = cursos.id
WHERE cursos.nome = 'Engenharia de Software';

/*Ex 18*/

CREATE VIEW professores_sem_turmas AS
SELECT professores.nome
FROM professores
LEFT JOIN turmas ON professores.id = turmas.professor_id
WHERE turmas.professor_id IS NULL;

/*Ex 19*/

CREATE VIEW alunos_cpf_email AS
SELECT nome, cpf, email
FROM alunos;

/*Ex 20*/

CREATE VIEW total_disciplinas_professor AS
SELECT professores.nome, COUNT(turmas.disciplina_id) AS total_disciplinas
FROM professores
JOIN turmas ON professores.id = turmas.professor_id
GROUP BY professores.nome;



