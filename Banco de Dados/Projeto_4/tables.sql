-- Criação Tabelas

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    CPF CHAR (9),
    Endereco VARCHAR(255),
    telefone VARCHAR(15),
    Email VARCHAR (45),
    tipo_cliente ENUM('PF', 'PJ')
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10),
    modelo VARCHAR(50),
    ano INT,
    cor VARCHAR (45),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especialidade VARCHAR(50),
    Admissao DATE
);

CREATE TABLE OrdemServico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
    data_emissao DATE,
    data_conclusao DATE,
    valor_total FLOAT,
    status VARCHAR(20),
    tipo VARCHAR(45),
    data_conclusao DATE,
    id_veiculo INT,
    id_cliente INT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);



CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255),
    preco DECIMAL
);

