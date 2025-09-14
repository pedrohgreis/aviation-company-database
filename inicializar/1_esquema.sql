CREATE DATABASE flyBase;
USE flyBase;

CREATE TABLE pessoa(
    id INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100),
    DataNasc DATE
);

CREATE TABLE cliente(
    idPessoa INT PRIMARY KEY, 
    email VARCHAR(100) NOT NULL UNIQUE,
    plano ENUM('BASICO', 'PREMIUM', 'VIP') NOT NULL DEFAULT 'BASICO',

    FOREIGN KEY (idPessoa) REFERENCES pessoa(id)
);

CREATE TABLE telefone_pessoa(
    id INT AUTO_INCREMENT PRIMARY KEY,
    idPessoa INT,
    numero_telefone VARCHAR(15) NOT NULL,

    FOREIGN KEY (idPessoa) REFERENCES pessoa(id)
);

CREATE TABLE passaporte(
    idPassport INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    numPassaporte VARCHAR(50) NOT NULL,
    paisEmissor VARCHAR(50),
    dataEmissao DATE NOT NULL,
    dataExpiracao DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(idPessoa)
);

CREATE TABLE cargo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomeCargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2)
);

CREATE TABLE funcionario(
    idPessoa INT PRIMARY KEY,
    idCargo INT,
    dataIngres DATE NOT NULL,
    dataDesligamento DATE,
    atividade VARCHAR(15),

    FOREIGN KEY (idCargo) REFERENCES cargo(id),
    FOREIGN KEY (idPessoa) REFERENCES pessoa(id)
);










