create table Aluno(
	idAluno int not null,
    matricula varchar (10) not null,
    nome varchar (50) not null,
    primary key (idAluno)
);

create table AlunoCurso(
	idAluno int not null,
    idCurso int not null,
    anoEntrada int not null,
    foreign key (idCurso) references Aluno (idAluno),
    foreign key (idAluno) references Aluno (idAluno)
);

create table Curso(
	idCurso int not null,
    nome varchar (50) not null,
    primary key (idCurso)
);

create table Grade(
	idGrade int not null,
    idCurso int not null,
    ano int not null,
    cargaHorariaTotal int not null,
	primary key (idGrade),
	foreign key (idCurso) references Aluno (idAluno)
);

create table Historico(
	idAluno int not null,
    idDisciplina int not null,
    nota float not null,
    dataHistorico date,
    foreign key (idDisciplina) references Aluno (idAluno),
    foreign key (idAluno) references Aluno (idAluno)
);

create table Disciplina(
	idDisciplina int not null,
    nome varchar (50) not null,
    cargaHoraria int not null,
    primary key (idDisciplina)
);

create table GradeDisciplina(
	idGrade int not null,
    idDisciplina int not null,
    foreign key (idDisciplina) references Aluno (idAluno),
    foreign key (idGrade) references Aluno (idAluno)
);

SELECT C.nome, D.nome, AVG(Nota) AS MediaNota
FROM Curso C
INNER JOIN Disciplina D ON C.idCurso = idCurso
INNER JOIN Historico N ON D.idDisciplina = N.idDisciplina
GROUP BY C.nome, D.nome;

select count(idCurso) as 'Total de cursos' from Curso;

select * from Disciplina; 

SELECT Aluno.nome AS NomeAluno, Curso.nome AS NomeCurso FROM Aluno JOIN AlunoCurso
ON Aluno.idAluno = AlunoCurso.idAluno JOIN Curso ON AlunoCurso.idCurso = Curso.idCurso ORDER BY Curso.nome DESC; 

SELECT C.nome, D.nome, AVG(Nota) AS MediaNota FROM Curso C 
INNER JOIN Disciplina D ON C.idCurso = idCurso 
INNER JOIN Historico N ON D.idDisciplina = N.idDisciplina 
GROUP BY C.nome, D.nome; 

SELECT c.Nome AS Curso, COUNT(idAluno) AS QuantidadeDeAlunos FROM Curso c
LEFT JOIN AlunoCurso ac ON c.idCurso = c.idCurso
GROUP BY c.idCurso, c.Nome;