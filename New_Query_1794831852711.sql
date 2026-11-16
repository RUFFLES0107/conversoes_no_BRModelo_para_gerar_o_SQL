CREATE DATABASE IF NOT EXISTS ecommerce;

-- 1. Tabela Cliente
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- 2. Tabela Endereco
CREATE TABLE Endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

-- 3. Tabela Produto
CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    catagoria VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

-- 4. Tabela Compra
CREATE TABLE Compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATETIME NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    id_cliente INT NOT NULL,
    id_endereco INT NOT NULL,
    CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    CONSTRAINT fk_compra_endereco FOREIGN KEY (id_endereco) REFERENCES Endereco(id)
);

-- 5. Tabela Associativa Item_Compra
CREATE TABLE Item_Compra (
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_compra, id_produto),
    CONSTRAINT fk_item_compra FOREIGN KEY (id_compra) REFERENCES Compra(id),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES Produto(id)
);