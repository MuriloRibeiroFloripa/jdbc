create database couserjdbc;
use couserjdbc;

CREATE TABLE department (
  Id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(60) DEFAULT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE seller (
  Id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(60) NOT NULL,
  Email varchar(100) NOT NULL,
  BirthDate datetime NOT NULL,
  BaseSalary double NOT NULL,
  DepartmentId int(11) NOT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (DepartmentId) REFERENCES department (id)
);

INSERT INTO department (Name) VALUES 
  ('Computers'),
  ('Electronics'),
  ('Fashion'),
  ('Books');

INSERT INTO seller (Name, Email, BirthDate, BaseSalary, DepartmentId) VALUES 
  ('Bob Brown','bob@gmail.com','1998-04-21 00:00:00',1000,1),
  ('Maria Green','maria@gmail.com','1979-12-31 00:00:00',3500,2),
  ('Alex Grey','alex@gmail.com','1988-01-15 00:00:00',2200,1),
  ('Martha Red','martha@gmail.com','1993-11-30 00:00:00',3000,4),
  ('Donald Blue','donald@gmail.com','2000-01-09 00:00:00',4000,3),
  ('Alex Pink','bob@gmail.com','1997-03-04 00:00:00',3000,2);
  
  SELECT * FROM	department;
  SELECT * FROM seller;
  
  -- QUATRO OPERAÇÕES BÁSICAS DA ALGEBRA RELACIONAL
  -- RESTRIÇÃO
  -- PROJEÇÃoptimize
  -- PRODUTO CARTESIANO
  -- JUNÇÃO (PRODUTO CARTESIANO + RESTRIÇÃO DE CHAVES CORRESPONDENTES)
    
  -- operação "produto Cartesiano":
  -- resultado da combinação cruzando todos os registros
  -- com todos os registros das duas tabelas, sem critérios.
  SELECT * 
  FROM department, seller;
  
  -- Operação "Junção":
  -- ela é a junção de um produto cartesiano mais uma restrição de chaves
  -- chave estrangeira com chave primaria
  SELECT *
  FROM	department, seller
  WHERE
	department.id = departmentid;
    
-- Operação "Junção" 
-- Outra forma de fazer MESMA COISA com "INNER JOIN"
SELECT *
FROM department apelido
INNER JOIN seller apelido1
ON apelido1.departmentid = apelido.id

-- operação de "restrição":
SELECT * 
FROM department
INNER JOIN seller 
ON seller.departmentid = department.id
WHERE department.name = 'Electronics';

-- Operação de "projeção":
SELECT department.name as Nome_Departamento, seller.name AS Nome_Vendedores
FROM department
INNER JOIN seller 
ON seller.departmentid = department.id
WHERE department.name = 'Electronics'; 