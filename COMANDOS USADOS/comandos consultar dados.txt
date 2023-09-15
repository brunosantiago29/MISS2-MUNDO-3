Dados completos de pessoas físicas:

SELECT pf.IDPessoa, p.Nome, p.logradouro, p.Telefone, pf.CPF
FROM PessoaFisica pf
INNER JOIN Pessoa p ON pf.IDPessoa = p.IDPessoa;

Dados completos de pessoas jurídicas:

SELECT pj.IDPessoa, p.Nome, p.logradouro, p.Telefone, pj.CNPJ
FROM PessoaJuridica pj
INNER JOIN Pessoa p ON pj.IDPessoa = p.IDPessoa;


Movimentações de entrada (compra) com detalhes:

SELECT mc.IDMovimento, mc.IDProduto, p.Nome AS NomeProduto, pj.IDPessoa AS NomeFornecedor,
       mc.Quantidade, mc.PrecoUnitario, mc.Quantidade * mc.PrecoUnitario AS ValorTotal
FROM MovimentoCompra mc
INNER JOIN Produtos p ON mc.IDProduto = p.IDProduto
INNER JOIN PessoaJuridica pj ON mc.IDPessoaJuridica = pj.IDPessoa;


--Movimentações de saída (venda) com detalhes:

SELECT mv.IDMovimento, mv.IDProduto, p.Nome AS NomeProduto, pf.IDPessoa AS NomeComprador,
       mv.Quantidade, p.PrecoVenda, mv.Quantidade * p.PrecoVenda AS ValorTotal
FROM MovimentoVenda mv
INNER JOIN Produtos p ON mv.IDProduto = p.IDProduto
INNER JOIN PessoaFisica pf ON mv.IDPessoaFisica = pf.IDPessoa;



--Valor total das entradas agrupadas por produto:

SELECT mc.IDProduto, p.Nome AS NomeProduto, SUM(mc.Quantidade * mc.PrecoUnitario) AS ValorTotalEntrada
FROM MovimentoCompra mc
INNER JOIN Produtos p ON mc.IDProduto = p.IDProduto
GROUP BY mc.IDProduto, p.Nome;


--Valor total das saídas agrupadas por produto:

SELECT mv.IDProduto, p.Nome AS NomeProduto, SUM(mv.Quantidade * p.PrecoVenda) AS ValorTotalSaida
FROM MovimentoVenda mv
INNER JOIN Produtos p ON mv.IDProduto = p.IDProduto
GROUP BY mv.IDProduto, p.Nome;


--Operadores que não efetuaram movimentações de entrada (compra):

SELECT u.IDUsuario, u.Nome AS NomeUsuario
FROM Usuarios u
LEFT JOIN MovimentoCompra mc ON u.IDUsuario = mc.Quantidade
WHERE mc.IDMovimento IS NULL;


SELECT mc.IDPessoaJuridica, pj.IDPessoa AS NomeFornecedor, SUM(mc.Quantidade * mc.PrecoUnitario) AS ValorTotalEntrada
FROM MovimentoCompra mc
INNER JOIN PessoaJuridica pj ON mc.IDPessoaJuridica = pj.IDPessoa
GROUP BY mc.IDPessoaJuridica, pj.IDPessoa;


SELECT mv.IDPessoaFisica, u.Nome AS NomeUsuario, SUM(mv.Quantidade * p.PrecoVenda) AS ValorTotalSaida
FROM MovimentoVenda mv
INNER JOIN Usuarios u ON mv.IDPessoaFisica = u.IDUsuario
INNER JOIN Produtos p ON mv.IDProduto = p.IDProduto
GROUP BY mv.IDPessoaFisica, u.Nome;
