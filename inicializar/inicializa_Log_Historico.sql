-- Tabela para armazenar dados de funcionários demitidos
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

-- Tabela para registrar funcionários não escalados após demissão
CREATE TABLE funcionariosNaoEscalados(
    id INT AUTO_INCREMENT PRIMARY KEY,
    idDemitidos INT,
    dataDesligamento DATE,
    FOREIGN KEY (idDemitidos) REFERENCES funcionariosDemitidos(id)
);

-- Tabela para registrar mudanças de status de um voo
CREATE TABLE Log_Status_Voo (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_voo INT NOT NULL,

    id_status_antigo INT,
    id_status_novo INT,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    

    FOREIGN KEY (id_voo) REFERENCES Voo(id_voo),
    FOREIGN KEY (id_status_antigo) REFERENCES Status_voo(id_status),
    FOREIGN KEY (id_status_novo) REFERENCES Status_voo(id_status)
);
