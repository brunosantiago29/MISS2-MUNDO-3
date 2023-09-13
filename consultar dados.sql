-- Movimentações de entrada (compra) com detalhes
SELECT mc.IDMovimento, p.Nome AS NomeProduto, pj.NomeFantasia AS NomeFornecedor,
       mc.Quantidade, mc.PrecoUnitario, mc.Quantidade * mc.PrecoUnitario AS ValorTotal
FROM MovimentoCompra mc
INNER JOIN Produtos p ON mc.IDProduto = p.IDProduto
INNER JOIN PessoasJuridicas pj ON mc.IDPessoaJuridica = pj.IDPessoa;

-- Movimentações de saída (venda) com detalhes
SELECT mv.IDMovimento, p.Nome AS NomeProduto, pf.NomeCompleto AS NomeComprador,
       mv.Quantidade, p.PrecoVenda, mv.Quantidade * p.PrecoVenda AS ValorTotal
FROM MovimentoVenda mv
INNER JOIN Produtos p ON mv.IDProduto = p.IDProduto
INNER JOIN PessoasFisicas pf ON mv.IDPessoaFisica = pf.IDPessoa;

-- Operadores que não efetuaram movimentações de entrada (compra)
SELECT u.IDUsuario, u.Usuario AS NomeUsuario
FROM Usuarios u
LEFT JOIN MovimentoCompra mc ON u.IDUsuario = mc.IDUsuario
WHERE mc.IDMovimento IS NULL;

-- Valor total de entrada, agrupado por operador
SELECT mc.IDUsuario, u.Usuario AS NomeUsuario, SUM(mc.Quantidade * mc.PrecoUnitario) AS ValorTotalEntrada
FROM MovimentoCompra mc
INNER JOIN Usuarios u ON mc.IDUsuario = u.IDUsuario
GROUP BY mc.IDUsuario, u.Usuario;

-- Valor total de saída, agrupado por operador
SELECT mv.IDUsuario, u.Usuario AS NomeUsuario, SUM(mv.Quantidade * p.PrecoVenda) AS ValorTotalSaida
FROM MovimentoVenda mv
INNER JOIN Usuarios u ON mv.IDUsuario = u.IDUsuario
INNER JOIN Produtos p ON mv.IDProduto = p.IDProduto
GROUP BY mv.IDUsuario, u.Usuario;
