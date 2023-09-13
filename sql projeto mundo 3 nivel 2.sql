CREATE TABLE Produto (
  idProduto INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  quantidade INTEGER    ,
  precoVenda NUMERIC      ,
PRIMARY KEY(idProduto));




CREATE TABLE Usuarios (
  idUsuarios INTEGER   NOT NULL   ,
PRIMARY KEY(idUsuarios));




CREATE TABLE PessoaFisica (
  idPessoaFisica INTEGER   NOT NULL ,
  cpf NUMERIC(11)      ,
PRIMARY KEY(idPessoaFisica));




CREATE TABLE Pessoa (
  idPessoa INTEGER   NOT NULL ,
  PessoaFisica_idPessoaFisica INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  logradouro VARCHAR(255)    ,
  cidade VARCHAR(255)    ,
  estado CHAR(2)    ,
  telefone VARCHAR(11)    ,
  email VARCHAR(255))      ,
PRIMARY KEY(idPessoa)  ,
  FOREIGN KEY(PessoaFisica_idPessoaFisica)
    REFERENCES PessoaFisica(idPessoaFisica));


CREATE INDEX Pessoa_FKIndex1 ON Pessoa (PessoaFisica_idPessoaFisica);


CREATE INDEX IFK_Rel_03 ON Pessoa (PessoaFisica_idPessoaFisica);


CREATE TABLE PessoaJuridica (
  idPessoaJuridica INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  cnpj NUMERIC(14)      ,
PRIMARY KEY(idPessoaJuridica)  ,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));


CREATE INDEX PessoaJuridica_FKIndex1 ON PessoaJuridica (Pessoa_idPessoa);


CREATE INDEX IFK_Rel_04 ON PessoaJuridica (Pessoa_idPessoa);


CREATE TABLE Movimento (
  idMovimento INTEGER   NOT NULL ,
  Usuarios_idUsuarios INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  Produto_idProduto INTEGER   NOT NULL ,
  quantidade2 INTEGER    ,
  tipo VARCHAR    ,
  valorUnitario INTEGER      ,
PRIMARY KEY(idMovimento)      ,
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa),
  FOREIGN KEY(Usuarios_idUsuarios)
    REFERENCES Usuarios(idUsuarios));


CREATE INDEX Movimento_FKIndex1 ON Movimento (Produto_idProduto);
CREATE INDEX Movimento_FKIndex2 ON Movimento (Pessoa_idPessoa);
CREATE INDEX Movimento_FKIndex3 ON Movimento (Usuarios_idUsuarios);


CREATE INDEX IFK_ItemMovimento ON Movimento (Produto_idProduto);
CREATE INDEX IFK_Responsavel ON Movimento (Pessoa_idPessoa);
CREATE INDEX IFK_Rel_05 ON Movimento (Usuarios_idUsuarios);



