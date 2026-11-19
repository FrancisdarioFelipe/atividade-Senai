-- ============================================================================
-- PROJETO: JOGO DE RPG ONLINE — ESTRUTURA FÍSICA DO BANCO DE DADOS (DDL)
-- SGBD: Microsoft SQL Server (T-SQL)
-- ============================================================================

-- 1. Criação do Banco de Dados do Projeto
CREATE DATABASE JogoRPG_DB;
GO

-- 2. Seleção e ativação do Banco de Dados criado
USE JogoRPG_DB;
GO

-- 3. Criação da Tabela USUARIOS (Entidade Independente)
CREATE TABLE USUARIOS
(
    UsuarioId INT PRIMARY KEY IDENTITY(1,1),
    Email     VARCHAR(150) NOT NULL UNIQUE,
    Senha     VARCHAR(100) NOT NULL
);
GO

-- 4. Criação da Tabela CLASSES (Entidade Independente)
CREATE TABLE CLASSES
(
    ClasseId  INT PRIMARY KEY IDENTITY(1,1),
    Nome      VARCHAR(80) NOT NULL UNIQUE,
    Descricao TEXT
);
GO

-- 5. Criação da Tabela HABILIDADES (Entidade Independente)
CREATE TABLE HABILIDADES
(
    HabilidadeId INT PRIMARY KEY IDENTITY(1,1),
    Nome         VARCHAR(80) NOT NULL
);
GO

-- 6. Criação da Tabela PERSONAGENS (Entidade Dependente - FKs para USUARIOS e CLASSES)
CREATE TABLE PERSONAGENS
(
    PersonagemId   INT PRIMARY KEY IDENTITY(1,1),
    NomePersonagem VARCHAR(80) NOT NULL,
    UsuarioId      INT NOT NULL FOREIGN KEY REFERENCES USUARIOS(UsuarioId),
    ClasseId       INT NOT NULL FOREIGN KEY REFERENCES CLASSES(ClasseId)
);
GO

-- 7. Criação da Tabela Associativa CLASSES_HABILIDADES (Resolução N:N)
CREATE TABLE CLASSES_HABILIDADES
(
    ClasseId     INT NOT NULL FOREIGN KEY REFERENCES CLASSES(ClasseId),
    HabilidadeId INT NOT NULL FOREIGN KEY REFERENCES HABILIDADES(HabilidadeId),
    CONSTRAINT PK_Classes_Habilidades PRIMARY KEY (ClasseId, HabilidadeId)
);
GO