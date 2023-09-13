--Inserir dados na tabela de Usuários:
INSERT INTO Usuarios (IDUsuario, Nome, Senha)
VALUES
    (1, 'bruno', '123'),
    (2, 'lorenzo', '123');
--Inserir dados na tabela de Produtos:
INSERT INTO Produtos (IDProduto, Nome, Quantidade, PrecoVenda)
VALUES
    (1, 'Banana', 100, 10.50),
    (2, 'Abacate', 50, 20.75),
    (3, 'Melancia', 200, 5.25);

-- Inserir dados na tabela de Pessoas (Pessoa Física)
DECLARE @ProximoID INT;
SET @ProximoID = NEXT VALUE FOR IdentificadorPessoa;

INSERT INTO Pessoas (IDPessoa, Nome, Endereco, Telefone)
VALUES
    (@ProximoID, 'Fulano', 'Rua A, 123', '123-456-7890');

INSERT INTO PessoasFisicas (IDPessoa, CPF)
VALUES
    (@ProximoID, '123.456.789-00');

-- Inserir dados na tabela de Pessoas (Pessoa Jurídica)
SET @ProximoID = NEXT VALUE FOR IdentificadorPessoa;

INSERT INTO Pessoas (IDPessoa, Nome, Endereco, Telefone)
VALUES
    (@ProximoID, 'Empresa ABC Ltda', 'Av. B, 456', '987-654-3210');

INSERT INTO PessoasJuridicas (IDPessoa, CNPJ)
VALUES
    (@ProximoID, '12.345.678/0001-23');

--Inserir dados na tabela de MovimentoVenda (Saída):
INSERT INTO MovimentoVenda (IDMovimento, IDProduto, IDPessoaFisica, Quantidade)
VALUES
    (4, 1, 1, 10), -- Substitua 1 pelo ID da Pessoa Física
    (5, 2, 1, 5),  -- Substitua 1 pelo ID da Pessoa Física
    (6, 3, 1, 20); -- Substitua 1 pelo ID da Pessoa Física
