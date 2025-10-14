-- CREATE ALUNO - TRIGGER - FUNCTION

CREATE SEQUENCE seq_ra START 1;

CREATE TABLE Aluno (
    id_aluno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ra VARCHAR (7) UNIQUE NOT NULL,
    nome VARCHAR (80) NOT NULL,
    sobrenome VARCHAR (80) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR (200),
    email VARCHAR (80),
    celular VARCHAR (20) NOT NULL
);

-- cria o RA
CREATE OR REPLACE FUNCTION gerar_ra() RETURNS TRIGGER AS $$
BEGIN
    NEW.ra := 'AAA' || TO_CHAR(nextval('seq_ra'), 'FM0000');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_gerar_ra
BEFORE INSERT ON Aluno
FOR EACH ROW EXECUTE FUNCTION gerar_ra();

-- CREATE LIVRO
CREATE TABLE Livro (
    id_livro INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR (200) NOT NULL,
    autor VARCHAR (150) NOT NULL,
    editora VARCHAR (100) NOT NULL,
    ano_publicacao VARCHAR (5),
    isbn VARCHAR (20),
    quant_total INTEGER NOT NULL,
    quant_disponivel INTEGER NOT NULL,
    valor_aquisicao DECIMAL (10,2),
    status_livro_emprestado VARCHAR (20)
);

-- CREATE EMPRESTIMO
CREATE TABLE Emprestimo (
    id_emprestimo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_aluno INT REFERENCES Aluno(id_aluno),
    id_livro INT REFERENCES Livro(id_livro),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR (20)
);

-- ALUNO
INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) 
VALUES 
('Conor', 'McGregor', '2005-01-15', 'Rua UFC, 123', 'mcgregor@ufc.com', '16998959876'),
('Amanda', 'Nunes', '2004-03-22', 'Rua UFC, 456', 'amanda.nunes@ufc.com', '16995992305'),
('Angelina', 'Jolie', '2003-07-10', 'Rua Hollywood, 789', 'jolie@cinema.com', '16991915502'),
('Natalie', 'Portman', '2002-11-05', 'Rua Hollywood, 101', 'natalie.portman@cinema.com', '16993930703'),
('Shaquille', 'ONeal', '2004-09-18', 'Rua NBA, 202', 'shaquille@gmail.com', '16993937030'),
('Harry', 'Kane', '2000-05-18', 'Rua Futebol, 2024', 'kane@futi.com', '16998951983'),
('Jaqueline', 'Carvalho', '2001-12-10', 'Rua Volei, 456', 'jack@volei.com', '16991993575'),
('Sheilla', 'Castro', '2003-04-25', 'Rua Volei, 2028', 'sheilla.castro@volei.com', '16981974547'),
('Gabriela', 'Guimarães', '2007-08-19', 'Rua Volei, 2028', 'gaby@volei.com', '16983932215'),
('Magic', 'Johnson', '2003-07-08', 'Rua NBA, 1999', 'magic@gmail.com', '16993932020');


INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) VALUES 
('Charles', 'Oliveira', '1989-10-17', 'Rua Do Bronx, 100', 'charles.oliveira@ufc.com', '16993001133'),
('Alex', 'Pereira', '1987-07-29', 'Av. Poatan, 202', 'alex.pereira@ufc.com', '16993001144'),
('Islam', 'Makhachev', '1991-10-27', 'Rua Daguestão, 303', 'islam.makhachev@ufc.com', '16993001155'),
('Glover', 'Teixeira', '1979-10-28', 'Rua Mineira, 404', 'glover.t@ufc.com', '16993001166'),
('Chorão', 'Rodrigues', '1970-04-09', 'Rua do Skate, 505', 'chorao.cbjr@musica.com', '16993001177'),
('Champignon', 'Lobo', '1978-03-16', 'Av. Zóio de Lula, 606', 'champ.cbjr@musica.com', '16993001188'),
('Caju', 'Trindade', '1995-12-05', 'Rua Punk, 707', 'caju.cbjr@musica.com', '16993001199'),
('José', 'Aldo', '1986-09-09', 'Rua Nova União, 808', 'jose.aldo@ufc.com', '16993001200'),
('Jon', 'Jones', '1987-07-19', 'Av. Bones, 909', 'jon.jones@ufc.com', '16993001211'),
('Rafael', 'Dos Anjos', '1984-10-26', 'Rua dos Leves, 110', 'rafael.anjos@ufc.com', '16993001222');

-- LIVRO
INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', '1954', '978-0007525546', 10, 10, 150.00, 'Disponível'),
('1984', 'George Orwell', 'Companhia das Letras', '1949', '978-8535906770', 8, 8, 90.00, 'Disponível'),
('Dom Quixote', 'Miguel de Cervantes', 'Penguin Classics', '1605', '978-0142437230', 6, 6, 120.00, 'Disponível'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Agir', '1943', '978-8522008731', 12, 12, 50.00, 'Disponível'),
('A Revolução dos Bichos', 'George Orwell', 'Penguin', '1945', '978-0141036137', 7, 7, 80.00, 'Disponível'),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', '1937', '978-0007458424', 9, 9, 140.00, 'Disponível'),
('O Conde de Monte Cristo', 'Alexandre Dumas', 'Penguin Classics', '1844', '978-0140449266', 5, 5, 110.00, 'Disponível'),
('Orgulho e Preconceito', 'Jane Austen', 'Penguin Classics', '1813', '978-0141439518', 7, 7, 90.00, 'Disponível'),
('Moby Dick', 'Herman Melville', 'Penguin Classics', '1851', '978-0142437247', 4, 4, 100.00, 'Disponível'),
('Guerra e Paz', 'Liev Tolstói', 'Companhia das Letras', '1869', '978-8535922343', 3, 3, 130.00, 'Disponível');

-- LIVRO -- INSIRA MAIS 10 LIVROS (Dados Reais - Tecnologia, Ciência e Contemporâneos)
INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('Código Limpo: Habilidades Práticas do Agile Software', 'Robert C. Martin', 'Alta Books', '2008', '978-8576082675', 5, 5, 120.00, 'Disponível'),
('Padrões de Projeto: Soluções Reutilizáveis de Software Orientado a Objetos', 'Erich Gamma et al.', 'Bookman', '1994', '978-8577800742', 4, 4, 150.00, 'Disponível'),
('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'Companhia das Letras', '2011', '978-8535928130', 10, 10, 65.00, 'Disponível'),
('O Lado Difícil das Coisas Difíceis', 'Ben Horowitz', 'Intrínseca', '2014', '978-8580575389', 6, 6, 75.00, 'Disponível'),
('Mindset: A Nova Psicologia do Sucesso', 'Carol S. Dweck', 'Objetiva', '2006', '978-8539006090', 8, 8, 55.00, 'Disponível'),
('O Milagre da Manhã', 'Hal Elrod', 'BestSeller', '2012', '978-8576864810', 12, 12, 45.00, 'Disponível'),
('A Breve História de Quase Tudo', 'Bill Bryson', 'Companhia das Letras', '2003', '978-8535914612', 7, 7, 85.00, 'Disponível'),
('Uma Breve História do Tempo', 'Stephen Hawking', 'Rocco', '1988', '978-8532502319', 9, 9, 70.00, 'Disponível'),
('A Biblioteca da Meia-Noite', 'Matt Haig', 'Bertrand Brasil', '2020', '978-8528625622', 11, 11, 49.90, 'Disponível'),
('Pai Rico, Pai Pobre', 'Robert T. Kiyosaki', 'Elsevier', '1997', '978-8535214221', 15, 15, 60.00, 'Disponível');

SELECT * FROM livro;

INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(1, 2, '2024-09-01', '2024-09-15', 'Em andamento'),
(2, 1, '2024-09-02', '2024-09-16', 'Em andamento'),
(3, 5, '2024-09-03', '2024-09-17', 'Em andamento'),
(5, 3, '2024-09-04', '2024-09-18', 'Em andamento'),
(4, 6, '2024-09-05', '2024-09-19', 'Em andamento'),
(6, 4, '2024-09-06', '2024-09-20', 'Em andamento'),
(7, 8, '2024-09-07', '2024-09-21', 'Em andamento'),
(8, 7, '2024-09-08', '2024-09-22', 'Em andamento'),
(10, 9, '2024-09-09', '2024-09-23', 'Em andamento'),
(9, 10, '2024-09-10', '2024-09-24', 'Em andamento'),
(1, 10, '2024-09-11', '2024-09-25', 'Em andamento'),
(2, 3, '2024-09-11', '2024-09-25', 'Em andamento'),
(4, 5, '2024-09-11', '2024-09-25', 'Em andamento'),
(6, 2, '2024-09-11', '2024-09-25', 'Em andamento');

-- Inserindo Emprestimos -- 10 EMPRESTIMOS, não repetir em

INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(11, 1, '2025-10-09', NULL, 'Em andamento'),   -- Ricardo Alves empresta L1
(12, 2, '2025-10-09', NULL, 'Em andamento'),   -- Patrícia Silva empresta L2
(13, 11, '2025-10-09', NULL, 'Em andamento'),  -- Guilherme Costa empresta L11 (Código Limpo)
(14, 12, '2025-10-09', NULL, 'Em andamento'),  -- Bianca Santos empresta L12 (Padrões de Projeto)
(15, 13, '2025-10-09', NULL, 'Em andamento'),  -- Felipe Oliveira empresta L13 (Sapiens)
(16, 14, '2025-10-09', NULL, 'Em andamento'),  -- Larissa Martins empresta L14 (Lado Difícil)
(17, 15, '2025-10-09', NULL, 'Em andamento'),  -- Pedro Gomes empresta L15 (Mindset)
(18, 16, '2025-10-09', NULL, 'Em andamento'),  -- Vitória Rocha empresta L16 (Milagre da Manhã)
(19, 17, '2025-10-09', NULL, 'Em andamento'),  -- Lucas Pereira empresta L17 (Quase Tudo)
(20, 18, '2025-10-09', NULL, 'Em andamento'); -- Sofia Nascimento empresta L18 (Tempo)

SELECT 
    a.ra, 
    a.nome, 
    a.sobrenome, 
    a.celular, 
    l.titulo, 
    l.autor, 
    l.editora, 
    e.data_emprestimo, 
    e.data_devolucao, 
    e.status_emprestimo
FROM 
    Emprestimo e
JOIN 
    Aluno a ON e.id_aluno = a.id_aluno
JOIN 
    Livro l ON e.id_livro = l.id_livro;



