-- criação do banco de dados para o cenário de E-commerce 
-- drop database ecommerce;

CREATE DATABASE ecommerce;
USE ecommerce;

-- Criação da tabela cliente

CREATE TABLE clients(
		idClient INT auto_increment PRIMARY KEY,
        Fname VARCHAR(10),
        Minit CHAR(3),
        Lname VARCHAR(20),
        CPF CHAR(11) not null,
        Address VARCHAR(255),
        CONSTRAINT unique_cpf_client unique (CPF)
);

ALTER TABLE clients auto_increment=1;

-- Criação tabela produto
-- Size = dimensão do produto


CREATE TABLE product(
		idProduct INT auto_increment PRIMARY KEY,
        Pname VARCHAR(255) NOT NULL,
        classification_kids bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        avaliação float default 0,
        size VARCHAR(10)
);

ALTER TABLE product auto_increment=1;

-- Criação tabela pagamentos
CREATE TABLE payments(
	idclient INT,
    idPayment INT,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvailable float,
    PRIMARY KEY(idClient, idPayment)
);


-- Criação tabela pedido
-- drop table orders;

CREATE TABLE orders(
	idOrder INT auto_increment PRIMARY KEY,
    idOrderClient INT,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue float default 10,
    paymentCash BOOLEAN default false, 
    CONSTRAINT fk_ordes_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
			ON UPDATE cascade
);

ALTER TABLE orders auto_increment=1;

DESC orders;

-- Criação tabela estoque 

CREATE TABLE productStorage(
	idProdStorage INT auto_increment PRIMARY KEY,
    storageLocationVARCHAR(255),
    quantity INT default 0
);
ALTER TABLE productStorage auto_increment=1;


-- Criação tabela fornecedor 

CREATE TABLE supplier(
	idSupplier INT auto_increment PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier unique (CNPJ)
);
ALTER TABLE supplier auto_increment=1;

DESC supplier;


-- Criação tabela vendedor 

CREATE TABLE seller(
	idSeller INT auto_increment PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller unique (CNPJ),
    CONSTRAINT unique_cpf_seller unique (CPF)
);

ALTER TABLE seller auto_increment=1;

-- Criação das tabelas de relacionamentos M:N
-- Relacionada a produto e vendedor 

CREATE TABLE productSeller(
	idPseller INT,
    idPproduct INT,
    prodQuantity INT default 1,
    PRIMARY KEY (idPseller, idPproduct),
    constraint fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    constraint fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
);

DESC productSeller;
-- Relacionada a produto e pedido

CREATE TABLE productOrder(
	idPOproduct INT,
    idPOorder INT,
    poQuantity INT default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    constraint fk_productorder_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    constraint fk_productorder_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)

);
-- Relacionado a produto e estoque 
create table storageLocation(
	idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    constraint fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

CREATE TABLE productSupplier(
	idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    constraint fk_product_supplier_prodcut FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);

DESC productSupplier;

SHOW TABLES;
