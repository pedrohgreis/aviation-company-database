USE flyBase;

-- Histórico Funcionários demitidos
DELIMITER //

CREATE TRIGGER tr_demitidos
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
    IF NEW.dataDesligamento IS NOT NULL AND NEW.atividade = 'Desligado' THEN 
        INSERT INTO funcionariosDemitidos(id_pessoa, id_cargo, dataIngres, dataDesligamento, atividade)
        VALUES (NEW.idPessoa, NEW.idCargo, NEW.dataIngres, NEW.dataDesligamento, NEW.atividade);
    
    END IF;
END//

DELIMITER ;



-- Funcionário com data de desligamento não pode ser escalado 
DELIMITER //

CREATE TRIGGER tr_funcNaoEscalado
AFTER INSERT ON funcionariosDemitidos
FOR EACH ROW
BEGIN
INSERT INTO funcionariosNaoEscalados(idDemitidos, dataDesligamento)
VALUES(
        NEW.id, NEW.dataDesligamento
    );

END//

DELIMITER ;



