CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_produto VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    bula VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    fabricante VARCHAR(255) NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo_produto, descricao)
 VALUES ("Medicamentos", "Produtos farmacêuticos para tratamento de doenças"),
("Vitaminas e Suplementos", "Produtos para saúde preventiva e fortalecimento"),
("Cosméticos", "Produtos de higiene e cuidados pessoais"),
("Infantil", "Produtos voltados para o público infantil"),
("Beleza", "Produtos voltados para estética e cuidados com a pele");

INSERT INTO tb_produtos (nome_produto, bula, preco, fabricante, id_categoria)
 VALUES ("Paracetamol 750mg", "Analgésico e antitérmico", 8.50, "Medley", 1),
("Vitamina C 500mg", "Suplemento vitamínico", 22.00, "Neo Química", 2),
("Shampoo Anticaspa", "Combate à caspa e fortalece os fios", 34.90, "Head & Shoulders", 3),
("Pomada para Assaduras", "Cuidados com a pele do bebê", 17.00, "Bepantol Baby", 4),
("Protetor Solar FPS 50", "Proteção solar para o rosto", 59.90, "La Roche-Posay", 5),
("Creme Hidratante Corporal", "Hidratação intensa para a pele", 62.00, "Nivea", 3),
("Ibuprofeno 600mg", "Anti-inflamatório e analgésico", 12.75, "EMS", 1),
("Multivitamínico Completo", "Suplemento com vitaminas e minerais", 49.00, "Centrum", 2);

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.id_categoria = tb_categorias.id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.id_categoria = tb_categorias.id WHERE id = 3;

SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;