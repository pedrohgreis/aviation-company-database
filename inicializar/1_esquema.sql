DROP DATABASE IF EXISTS flyBase;
CREATE DATABASE flyBase;
USE flyBase;


CREATE TABLE pessoa(
    id INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100),
    DataNasc DATE,
    genero CHAR(1)
);

CREATE TABLE cargo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomeCargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2)
);

CREATE TABLE Aviao (
    id_aviao INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(100),
    fabricante VARCHAR(100),
    data_aquisicao DATE,
    capacidade INT
);

CREATE TABLE Cidade (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    pais VARCHAR(100)
);

CREATE TABLE Status_voo (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL
);


-- TABELAS QUE DEPENDEM DE OUTRAS TABELAS (FOREIGN KEY)
CREATE TABLE cliente(
    idPessoa INT PRIMARY KEY, 
    email VARCHAR(100) NOT NULL UNIQUE,
    plano ENUM('BASICO', 'PREMIUM', 'VIP') NOT NULL DEFAULT 'BASICO',

    FOREIGN KEY (idPessoa) REFERENCES pessoa(id)
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



CREATE TABLE EscalaTrabalho(
    id INT AUTO_INCREMENT PRIMARY KEY,
    idFuncionario INT,
    dataTrabalho INT,
    horasTrabalho DECIMAL(10,2),
    escalado BOOLEAN DEFAULT 1,

    FOREIGN KEY (idFuncionario) REFERENCES funcionario(idPessoa)
);


-- !toDo: Implementar trigger no status (histórico de aviões que já decolaram)

CREATE TABLE Voo(
    id_voo INT PRIMARY KEY AUTO_INCREMENT, 
    distancia INT,      -- Em km, por exemplo
    duracao TIME,       -- A duração do voo em horas, minutos e segundos ('HH:MM:SS').(ex: '03:15:00')
    id_Aviao INT,
    id_cidade_origem INT,
    id_cidade_destino INT,
    id_status_voo INT,

    FOREIGN KEY (id_Aviao) REFERENCES Aviao(id_aviao),
    FOREIGN KEY (id_cidade_origem) REFERENCES Cidade(id_cidade),
    FOREIGN KEY (id_cidade_destino) REFERENCES Cidade(id_cidade),
    FOREIGN KEY (id_status_voo) REFERENCES Status_voo(id_status)
);

-- !toDo: Controle poltronas

CREATE TABLE Reserva(
    idVoo INT,
    id_cliente INT,
    PRIMARY KEY (idVoo, id_cliente),
    poltrona VARCHAR(8),
    numReserva VARCHAR(20),
    dataReserva DATE,

    FOREIGN KEY (idVoo) REFERENCES Voo(id_voo),
    FOREIGN KEY (id_cliente) REFERENCES cliente(idPessoa)
);


CREATE TABLE Funcionarios_voo(
    idVoo INT,
    id_funcionario INT,
    PRIMARY KEY (idVoo, id_funcionario),

    FOREIGN KEY (idVoo) REFERENCES Voo(id_voo),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(idPessoa)
);


-- TABELAS TRIGGERS

CREATE TABLE funcionariosDemitidos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT,
    id_cargo INT,
    dataIngres DATE NOT NULL,
    dataDesligamento DATE,
    atividade VARCHAR(15),

    FOREIGN KEY (id_cargo) REFERENCES cargo(id),
    FOREIGN KEY (id_pessoa) REFERENCES funcionario(idPessoa)
);


CREATE TABLE funcionariosNaoEscalados(
    id INT AUTO_INCREMENT PRIMARY KEY,
    idDemitidos INT,
    dataDesligamento DATE,

    FOREIGN KEY (idDemitidos) REFERENCES funcionariosDemitidos(id)
);


