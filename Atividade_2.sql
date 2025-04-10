CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_pizza VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE tb_pizzas (
    id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2),
    tamanho VARCHAR(255) NOT NULL
);

ALTER TABLE tb_pizzas ADD categoria_id BIGINT;

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categoria
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id);

INSERT INTO tb_categorias (tipo_pizza, descricao) 
VALUES ("Salgada", "Pizzas com ingredientes salgados"),
("Doce", "Pizzas com cobertura doce"),
("Vegetariana", "Pizzas com ingredientes sem carne"),
("Especial", "Pizzas da casa com receita exclusiva"),
("Vegana", "Pizzas sem ingredientes de origem animal");

INSERT INTO tb_pizzas (nome_pizza, ingredientes, preco, tamanho) 
VALUES ("Margherita", "Molho de tomate, mussarela, manjericão", 42.00, "Média"),
("Pepperoni", "Molho de tomate, mussarela, pepperoni", 48.00, "Grande"),
("Chocolate com Morango", "Chocolate ao leite e morango", 55.00, "Média"),
("Brigadeiro", "Chocolate e granulado", 50.00, "Brotinho"),
("Vegetariana Especial", "Mix de vegetais e queijo", 46.50, "Grande"),
("Quatro Queijos", "Mussarela, provolone, parmesão, gorgonzola", 52.00, "Grande"),
("Pizza da Casa", "Ingredientes secretos do chef", 75.00, "Grande"),
("Vegana Primavera", "Massa integral, legumes, sem queijo", 49.00, "Média");

UPDATE tb_pizzas SET categoria_id = 1 WHERE id_pizza IN (1,2,6);
UPDATE tb_pizzas SET categoria_id = 2 WHERE id_pizza IN (3,4);
UPDATE tb_pizzas SET categoria_id = 3 WHERE id_pizza = 5;
UPDATE tb_pizzas SET categoria_id = 4 WHERE id_pizza = 7;
UPDATE tb_pizzas SET categoria_id = 5 WHERE id_pizza = 8;

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE "%M%";

SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id;

SELECT * FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id WHERE id = 1;

SELECT * FROM tb_categorias;
SELECT * FROM tb_pizzas;


