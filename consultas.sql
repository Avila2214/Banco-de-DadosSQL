select * from clientes;

-- filtrando vendas entre datas --
select * 
from vendas
where data_compra between '2011-07-17' and '2020-05-21';


-- Filtrando por palavras na coluna produto_nome --
select * 
from vendas
where produto_nome like '%um'; 

-- Filtrando os 10 primeiros clientes --
select *
from clientes
where id between 1 and 10;

-- consulta o nome do produto, o total de vendas do mesmo(só os que tiveram mais de uma venda) e o valor total das vendas de cada  --
SELECT produto_nome, COUNT(*) AS total_vendas, SUM(preco) AS valor_total
FROM vendas
GROUP BY produto_nome
HAVING COUNT(*) > 1;

-- Consulta em tabelas diferentes utilizando o join --
SELECT c.nome, c.sobrenome, v.produto_nome, v.quantidade, v.preco, v.data_compra, m.nome_marca
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN inventario i ON v.produto_nome = i.modelo
JOIN marcas m ON i.marcas_id = m.id;

-- Consultar o total de vendas por cliente--
SELECT c.nome, c.sobrenome, SUM(v.quantidade) AS total_produtos, SUM(v.preco * v.quantidade) AS total_gasto
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.id;

-- Consultar produto mais vendidos por marcas --
SELECT m.nome_marca, v.produto_nome, SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN inventario i ON v.produto_nome = i.modelo
JOIN marcas m ON i.marcas_id = m.id
GROUP BY m.id, v.produto_nome
ORDER BY total_vendido DESC;
