CREATE DATABASE carros;
use carros;


CREATE TABLE marcas(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome_marca 		VARCHAR (255) NOT NULL,
    origem_marca 	VARCHAR (255)
);

CREATE TABLE inventario(
	id INT AUTO_INCREMENT,
    modelo 		VARCHAR (255) NOT NULL,
    transmissao VARCHAR( 255) NOT NULL,
    motor 		VARCHAR (255) NOT NULL,
    combustivel VARCHAR (255) NOT NULL,
    marcas_id 	INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (marcas_id) REFERENCES marcas(id)
);

CREATE TABLE clientes(
	id INT AUTO_INCREMENT,
    nome 		VARCHAR (255) NOT NULL,
    sobrenome 	VARCHAR (255) NOT NULL,
    endereco 	VARCHAR (255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE vendas(
	id INT AUTO_INCREMENT,
    cliente_id INT,
    produto_nome VARCHAR (255) NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL (10,2) NOT NULL,
    data_compra DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

