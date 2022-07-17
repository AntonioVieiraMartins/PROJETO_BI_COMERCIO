CREATE DATABASE COMERCIO_DW
GO

USE COMERCIO_DW
GO

CREATE TABLE DIM_VENDEDOR(
	IDSK INT PRIMARY KEY IDENTITY,
	IDVENDEDOR INT,
	INICIO DATETIME,
	FIM DATETIME,
	NOME VARCHAR(100),
	SEXO VARCHAR(20),
	IDGERENTE INT
)
GO

CREATE TABLE DIM_NOTA(
	IDSK INT PRIMARY KEY IDENTITY,
	IDNOTA INT
)
GO

CREATE TABLE DIM_FORMA(
	IDSK INT PRIMARY KEY IDENTITY,
	IDFORMA INT,
	FORMA VARCHAR(30)
)
GO

CREATE TABLE DIM_CLIENTE(
	IDSK INT PRIMARY KEY IDENTITY,
	IDCLIENTE INT,
	INICIO DATETIME,
	FIM DATETIME,
	NOME VARCHAR(100),
	SEXO VARCHAR(20),
	EMAIL VARCHAR(50),
	NASCIMENTO DATE,
	CIDADE VARCHAR(100),
	ESTADO VARCHAR(30),
	REGIAO VARCHAR(30)
)
GO

CREATE TABLE CATEGORIA(
	IDCATEGORIA INT PRIMARY KEY,
	NOME VARCHAR(50)
)
GO

CREATE TABLE DIM_PRODUTO(
	IDSK INT PRIMARY KEY IDENTITY,
	IDPRODUTO INT,
	INICIO DATETIME,
	FIM DATETIME,
	NOME VARCHAR(100),
	VALOR_UNITARIO NUMERIC(10,2),
	CUSTO_MEDIO NUMERIC(10,2),
	ID_CATEGORIA INT,
	FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA)
)
GO

CREATE TABLE DIM_FORNECEDOR(
	IDSK INT PRIMARY KEY IDENTITY,
	IDFORNECEDOR INT,
	INICIO DATETIME,
	FIM DATETIME,
	NOME VARCHAR(50)
)
GO

CREATE TABLE DIM_TEMPO(
	IDSK INT PRIMARY KEY IDENTITY,
	DATA DATE,
	DIA CHAR(2),
	DIASEMANA VARCHAR(10),
	MES CHAR(2),
	NOMEMES VARCHAR(20),
	QUARTO TINYINT,
	NOMEQUARTO VARCHAR(20),
	ANO CHAR(4),
	ESTACAOANO VARCHAR(20),
	FIMSEMANA CHAR(3),
	DATACOMPLETA VARCHAR(10)
)
GO

CREATE TABLE FATO(
	IDNOTA INT REFERENCES DIM_NOTA(IDSK),
	IDCLIENTE INT REFERENCES DIM_CLIENTE(IDSK),
	IDVENDEDOR INT REFERENCES DIM_VENDEDOR(IDSK),
	IDFORMA INT REFERENCES DIM_FORMA(IDSK),
	IDPRODUTO INT REFERENCES DIM_PRODUTO(IDSK),
	IDFORNECEDOR INT REFERENCES DIM_FORNECEDOR(IDSK),
	IDTEMPO INT REFERENCES DIM_TEMPO(IDSK),
	QUANTIDADE INT,
	TOTAL_ITEM NUMERIC(10,2),
	CUSTO_TOTAL NUMERIC(10,2),
	LUCRO_TOTAL NUMERIC(10,2)
)
GO