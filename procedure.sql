---DESENVOLVIMENTO III
---Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos. Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos comprados por dia. Para ajudar a empresa, crie um procedure para agilizar esse processo.

-- Criação da tabela de produtos
CREATE TABLE produto (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  quantidade INT NOT NULL,
  data_compra VARCHAR(10) NOT NULL
);

-- Inserção dos dados
INSERT INTO produto 
(nome, quantidade, data_compra) 
VALUES
 ('Produto A', 10, '19-06-2023'),
 ('Produto B', 5, '19-06-2023'),
 ('Produto C', 8, '18-06-2023'),
 ('Produto D', 15, '18-06-2023'),
 ('Produto E', 20, '17-06-2023');

-- Criação da função para o relatório diário dos produtos
CREATE OR REPLACE FUNCTION relatorio_produto()
RETURNS TABLE (data_compra_resultado VARCHAR, quantidade_de_produtos BIGINT)
AS $$
BEGIN
  RETURN QUERY
  SELECT p.data_compra, COUNT(*) AS quantidade_de_produtos
  FROM produto p
  GROUP BY p.data_compra
  ORDER BY p.data_compra DESC;
END;
$$
LANGUAGE plpgsql;

-- Execução da função
SELECT * FROM relatorio_produto();
---CALL relatorio_produto();  (Esse deu erro)
