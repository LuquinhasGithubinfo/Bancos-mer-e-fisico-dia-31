CREATE DATABASE LONGA_VIDA;
USE LONGA_VIDA;


CREATE TABLE plano (
    Numero CHAR(2) NOT NULL,
    Descricao CHAR(30) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Numero)
);


INSERT INTO plano (Numero, Descricao, Valor) VALUES
('B1', 'PLANO BASICO 1', 150.00),
('B2', 'PLANO BASICO 2', 180.00),
('B3', 'PLANO BASICO 3', 200.00),
('E1', 'PLANO EXECUTIVO 1', 250.00),
('E2', 'PLANO EXECUTIVO 2', 300.00),
('E3', 'PLANO EXECUTIVO 3', 350.00),
('M1', 'PLANO MASTER 1', 400.00),
('M2', 'PLANO MASTER 2', 450.00),
('M3', 'PLANO MASTER 3', 500.00);


CREATE TABLE associado (
    Plano CHAR(2) NOT NULL,
    Nome CHAR(40) NOT NULL,
    Endereco CHAR(35),
    Cidade CHAR(20),
    Estado CHAR(2),
    CEP CHAR(9),
    PRIMARY KEY (Nome),
    FOREIGN KEY (Plano) REFERENCES plano (Numero)
        ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO associado (Plano, Nome, Endereco, Cidade, Estado, CEP) VALUES
('B1', 'JOSE DA SILVA', 'RUA 1', 'SÃO PAULO', 'SP', '01000-000'),
('B2', 'MARIA DE SOUSA', 'RUA 2', 'COTIA', 'SP', '06700-000'),
('B3', 'CARLOS ALVES', 'RUA 3', 'DIADEMA', 'SP', '09900-000'),
('E1', 'ANA PEREIRA', 'RUA 4', 'BARUERI', 'SP', '06400-000'),
('E2', 'PEDRO JOSE DE OLIVEIRA', 'RUA 5', 'SANTO ANDRÉ', 'SP', '09000-000'),
('E3', 'LUCAS MORAES', 'RUA 6', 'COTIA', 'SP', '06700-001'),
('M1', 'FABIOLA LIMA', 'RUA 7', 'DIADEMA', 'SP', '09900-001'),
('M2', 'HELENA FONSECA', 'RUA 8', 'SÃO PAULO', 'SP', '01000-001'),
('M3', 'CARLA GONÇALVES', 'RUA 9', 'BARUERI', 'SP', '06400-001'),
('B1', 'ROBERTO SANTOS', 'RUA 10', 'COTIA', 'SP', '06700-002'),
('B2', 'CLAUDIA MARTINS', 'RUA 11', 'SANTO ANDRÉ', 'SP', '09000-001'),
('B3', 'WILLIAM CAVALCANTI', 'RUA 12', 'DIADEMA', 'SP', '09900-002'),
('E1', 'DANIELA RIBEIRO', 'RUA 13', 'BARUERI', 'SP', '06400-002'),
('E2', 'MARCOS VINICIUS', 'RUA 14', 'SÃO PAULO', 'SP', '01000-002'),
('E3', 'GUSTAVO FERRAZ', 'RUA 15', 'COTIA', 'SP', '06700-003'),
('M1', 'SILVIA FERNANDES', 'RUA 16', 'DIADEMA', 'SP', '09900-003'),
('M2', 'TATIANE DUARTE', 'RUA 17', 'SÃO PAULO', 'SP', '01000-003'),
('M3', 'RENATO ALMEIDA', 'RUA 18', 'SANTO ANDRÉ', 'SP', '09000-002'),
('B1', 'LUIZ HENRIQUE', 'RUA 19', 'SÃO PAULO', 'SP', '01000-004'),
('B2', 'NATÁLIA MARTINS', 'RUA 20', 'DIADEMA', 'SP', '09900-004'),
('B3', 'VIVIANE NASCIMENTO', 'RUA 21', 'BARUERI', 'SP', '06400-003');


UPDATE plano
SET Valor = CASE
    WHEN Numero LIKE 'B%' THEN Valor * 1.10
    WHEN Numero LIKE 'E%' THEN Valor * 1.05
    WHEN Numero LIKE 'M%' THEN Valor * 1.03
    END;


UPDATE associado
SET Plano = 'E3'
WHERE Nome = 'PEDRO JOSE DE OLIVEIRA';


SELECT a.Nome, a.Plano, p.Descricao
FROM associado a
JOIN plano p ON a.Plano = p.Numero;


SELECT COUNT(*) AS Total_Associados
FROM associado
WHERE Plano = 'B1';


SELECT a.Nome, a.Plano, p.Valor
FROM associado a
JOIN plano p ON a.Plano = p.Numero;


SELECT *
FROM associado
WHERE Cidade IN ('COTIA', 'DIADEMA');


SELECT a.Nome, a.Plano, p.Valor
FROM associado a
JOIN plano p ON a.Plano = p.Numero
WHERE a.Cidade = 'BARUERI' AND a.Plano = 'M1';


SELECT a.Nome, a.Plano, p.Valor
FROM associado a
JOIN plano p ON a.Plano = p.Numero
WHERE a.Cidade = 'SÃO PAULO';


SELECT a.*, p.*
FROM associado a
JOIN plano p ON a.Plano = p.Numero
WHERE a.Nome LIKE '%SILVA%';


SELECT COUNT(*) AS Total_Associados
FROM associado
WHERE Plano = 'E3';


SELECT a.Nome, p.Valor
FROM associado a
JOIN plano p ON a.Plano = p.Numero
WHERE a.Plano IN ('B1', 'E1', 'M1');


SELECT a.*
FROM associado a
WHERE a.Plano LIKE 'E%';


SELECT a.*
FROM associado a
WHERE a.Plano LIKE 'B%' OR a.Plano LIKE 'M%';


DELETE FROM associado
WHERE Cidade = 'SANTO ANDRÉ';


SELECT a.Nome, a.Plano, p.Valor
FROM associado a
JOIN plano p ON a.Plano = p.Numero
WHERE a.Cidade = 'SÃO PAULO' AND a.Plano IN ('M2', 'M3');