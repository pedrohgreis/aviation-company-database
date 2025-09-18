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


CREATE TABLE Aviao (
    id_aviao INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(100),
    fabricante VARCHAR(100),
    data_aquisicao DATE
);

CREATE TABLE Cidade (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    pais VARCHAR(100)
);

CREATE TABLE Voo(
    id_voo INT PRIMARY KEY AUTO_INCREMENT, 
    distancia INT,      -- Em km, por exemplo
    duracao TIME,       -- A duração do voo em horas, minutos e segundos ('HH:MM:SS').(ex: '03:15:00')
    id_Aviao INT,
    id_cidade_origem INT,
    id_cidade_destino INT,

    FOREIGN KEY (id_Aviao) REFERENCES Aviao(id_aviao),
    FOREIGN KEY (id_cidade_origem) REFERENCES Cidade(id_cidade),
    FOREIGN KEY (id_cidade_destino) REFERENCES Cidade(id_cidade)
);

