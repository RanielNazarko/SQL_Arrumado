CREATE TABLE Produto (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Preco FLOAT NOT NULL,
    Categoria VARCHAR(100) NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Quantidade INT,
    Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Cliente (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(150) NOT NULL,
    CPF BIGINT NOT NULL,
    UNIQUE (CPF)
);

CREATE TABLE Endereco (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    Rua VARCHAR(150) NOT NULL,
    CEP CHAR(9) NOT NULL,
    Numero INT NOT NULL,
    Bairro VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado CHAR(2) NOT NULL,
    Complemento VARCHAR(150),

    FOREIGN KEY (idCliente) REFERENCES Cliente(ID)
);

CREATE TABLE Compra (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idEndereco INT,
    data DATE NOT NULL,
    forma_pag VARCHAR(50) NOT NULL,
    Total FLOAT NOT NULL,

    FOREIGN KEY (idCliente) REFERENCES Cliente(ID),
    FOREIGN KEY (idEndereco) REFERENCES Endereco(ID)
);

CREATE TABLE Tem (
    ID_Produto INT NOT NULL,
    ID_Compra INT NOT NULL,
    valor_unitario FLOAT NOT NULL,
    quantidade INT NOT NULL,
    desconto VARCHAR(50),

    PRIMARY KEY (ID_Produto, ID_Compra),

    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID),
    FOREIGN KEY (ID_Compra) REFERENCES Compra(ID)
);
