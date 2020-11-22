CREATE DATABASE dados;

USE dados;

CREATE TABLE Usuarios (
	idUsuario INT NOT NULL auto_increment,
	nome VARCHAR (70) NOT NULL,
	nomeUsuario VARCHAR (50) NOT NULL,
	email VARCHAR(70) NOT NULL,
	senha VARCHAR(50) NOT NULL,
	PRIMARY KEY(idUsuario)
);

CREATE TABLE Temas (
	idTema INT NOT NULL auto_increment,
	tema VARCHAR(20) NOT NULL,
	PRIMARY KEY(idTema)
);

CREATE TABLE Conteudos (
	idConteudo INT NOT NULL auto_increment,
	tema INT NOT NULL,
	titulo VARCHAR (70) NOT NULL,
	recomendadoPor INT NOT NULL,
	imagem BLOB,
	link VARCHAR(150) NOT NULL,
	descricao varchar(255) NOT NULL,
	PRIMARY KEY(idConteudo),

	CONSTRAINT FK_TEMA FOREIGN KEY (tema) REFERENCES Temas (idTema),
	CONSTRAINT FK_RECOMENDADO_POR FOREIGN KEY (recomendadoPor) REFERENCES Usuarios (idUsuario)
);

CREATE TABLE Publicacao (
	idPublicacao INT NOT NULL auto_increment,
	tema INT NOT NULL,
	conteudo INT NOT NULL,
	usuario INT NOT NULL,
	dataPublicacao DATETIME,
	comentario VARCHAR(255) NOT NULL,
	PRIMARY KEY(idPublicacao),

	CONSTRAINT FK_TEMA_PUBLICACAO FOREIGN KEY (tema) REFERENCES Temas (idTema),
	CONSTRAINT FK_CONTEUDO FOREIGN KEY (conteudo) REFERENCES Conteudos (idConteudo),
	CONSTRAINT FK_USUARIO FOREIGN KEY (usuario) REFERENCES Usuarios (idUsuario)
);


