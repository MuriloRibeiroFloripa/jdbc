 Departamento CREATE TABLE  (
  Id int ( 11 ) NOT NULL AUTO_INCREMENT,
  Nome varchar ( 60 ) DEFAULT NULL ,
  CHAVE PRIMÁRIA (Id)
);

CREATE  TABLE  seller (
  Id int ( 11 ) NOT NULL AUTO_INCREMENT,
  Nome varchar ( 60 ) NÃO NULO ,
  Email varchar ( 100 ) NÃO NULO ,
  Data de nascimento data e hora NOT NULL ,
  BaseSalary double NOT NULL ,
  DepartmentId int ( 11 ) NÃO NULO ,
  CHAVE PRIMÁRIA (Id),
  CHAVE ESTRANGEIRA (DepartmentId) REFERÊNCIAS departamento (id)
);

INSERIR NO departamento (Nome) VALORES 
  ( ' Computadores ' ),
  ( ' Eletrônicos ' ),
  ( ' Moda ' ),
  ( ' Livros ' );

INSERT INTO vendedor (nome, e-mail, data de nascimento, baseSalary, DepartmentId) VALORES 
  ( ' Bob Brown ' , ' bob@gmail.com ' , ' 1998-04-21 00:00:00 ' , 1000 , 1 ),
  ( ' Maria Green ' , ' maria@gmail.com ' , ' 1979-12-31 00:00:00 ' , 3500 , 2 ),
  ( ' Alex Gray ' , ' alex@gmail.com ' , ' 1988-01-15 00:00:00 ' , 2200 , 1 ),
  ( ' Martha Red ' , ' martha@gmail.com ' , ' 1993-11-30 00:00:00 ' , 3000 , 4 ),
  ( ' Donald Blue ' , ' donald@gmail.com ' , ' 2000-01-09 00:00:00 ' , 4000 , 3 ),
  ( ' Alex Pink ' , ' bob@gmail.com ' , ' 1997-03-04 00:00:00 ' , 3000 , 2 );