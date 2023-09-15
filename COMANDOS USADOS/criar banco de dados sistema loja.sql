-- Criar o banco de dados SistemaLoja
CREATE DATABASE SistemaLoja;

-- Usar o banco de dados recém-criado
USE SistemaLoja;

-- Criar a tabela de Usuários
CREATE TABLE Usuarios (
    IDUsuario INT PRIMARY KEY,
    Nome VARCHAR(255),
    Senha VARCHAR(255)
);

-- Criar a tabela de Produtos
CREATE TABLE Produtos (
    IDProduto INT PRIMARY KEY,
    Nome VARCHAR(255),
    Quantidade INT,
    PrecoVenda DECIMAL(10, 2)
);

-- Criar a tabela de Pessoas
CREATE TABLE Pessoas (
    IDPessoa INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Cidade VARCHAR(255),
    Estado VARCHAR(255),
    Telefone VARCHAR(255),
    Email VARCHAR(255)
);

-- Criar a tabela de PessoasFisicas
CREATE TABLE PessoasFisicas (
    IDPessoa INT PRIMARY KEY,
    CPF VARCHAR(14) UNIQUE
);

-- Criar a tabela de PessoasJuridicas
CREATE TABLE PessoasJuridicas (
    IDPessoa INT PRIMARY KEY,
    CNPJ VARCHAR(18) UNIQUE
);

-- Criar a tabela de MovimentoCompra (Entrada)
CREATE TABLE MovimentoCompra (
    IDMovimento INT PRIMARY KEY,
    IDProduto INT,
    IDPessoaJuridica INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto),
    FOREIGN KEY (IDPessoaJuridica) REFERENCES PessoasJuridicas(IDPessoa)
);

-- Criar a tabela de MovimentoVenda (Saída)
CREATE TABLE MovimentoVenda (
    IDMovimento INT PRIMARY KEY,
    IDProduto INT,
    IDPessoaFisica INT,
    Quantidade INT,
    FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto),
    FOREIGN KEY (IDPessoaFisica) REFERENCES PessoasFisicas(IDPessoa)
);

-- Criar uma sequence para gerar IDs de Pessoa
CREATE SEQUENCE IdentificadorPessoa START WITH 1 INCREMENT BY 1;

-- Criar uma sequence para gerar IDs de Usuário
CREATE SEQUENCE IdentificadorUsuario START WITH 1 INCREMENT BY 1;

-- Criar uma sequence para gerar IDs de Produto
CREATE SEQUENCE IdentificadorProduto START WITH 1 INCREMENT BY 1;

-- Criar uma sequence para gerar IDs de MovimentoCompra
CREATE SEQUENCE IdentificadorMovimentoCompra START WITH 1 INCREMENT BY 1;

-- Criar uma sequence para gerar IDs de MovimentoVenda
CREATE SEQUENCE IdentificadorMovimentoVenda START WITH 1 INCREMENT BY 1;
