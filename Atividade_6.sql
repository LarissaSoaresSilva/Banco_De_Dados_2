CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    area_conhecimento VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE tb_cursos (
    id_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(255) NOT NULL,
    sobre VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    carga_horaria BIGINT,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, area_conhecimento, descricao) 
VALUES("Programação", "Tecnologia da Informação", "Cursos voltados à lógica e linguagens de programação"),
("Design", "Artes Visuais", "Cursos de design gráfico, UI/UX e edição de imagem"),
("Marketing Digital", "Comunicação", "Cursos sobre estratégias de marketing e redes sociais"),
("Negócios", "Administração", "Cursos sobre gestão, empreendedorismo e finanças"),
("Idiomas", "Linguagens", "Cursos de idiomas e comunicação internacional");

INSERT INTO tb_cursos (nome_curso, sobre, preco, carga_horaria, id_categoria)
 VALUES("Lógica de Programação", "Aprenda os fundamentos da lógica de programação", 350.00, 40, 1),
("Curso de Java", "Curso completo de Java com orientação a objetos", 850.00, 60, 1),
("Design Gráfico com Photoshop", "Técnicas de edição e composição visual", 590.00, 50, 2),
("Gestão Financeira", "Administração de finanças pessoais e empresariais", 750.00, 45, 4),
("Marketing no Instagram", "Aprenda a vender utilizando o Instagram", 299.00, 30, 3),
("Curso de Inglês Básico", "Aprenda inglês do zero até o nível intermediário", 999.00, 80, 5),
("UX/UI Design para Iniciantes", "Design de interfaces focado na experiência do usuário", 680.00, 40, 2),
("JavaScript Avançado", "Domine JavaScript moderno com projetos práticos", 890.00, 60, 1);

SELECT * FROM tb_cursos WHERE preco > 500.00;

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id;

SELECT * FROM tb_cursos INNER JOIN tb_categorias 
ON tb_cursos.id_categoria = tb_categorias.id WHERE tb_categorias.nome_categoria = "Idiomas";

SELECT * FROM tb_cursos;
SELECT * FROM tb_categorias;
