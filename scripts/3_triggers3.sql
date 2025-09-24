CREATE TABLE Log_Status_Voo (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_voo INT,
    status_antigo VARCHAR(30),
    status_novo VARCHAR(30),
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Chave estrangeira para garantir a integridade referencial
    FOREIGN KEY (id_voo) REFERENCES Voo(id_voo)
);