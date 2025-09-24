USE flyBase;

DELIMITER //

CREATE TRIGGER tr_funcionariosDemitidos
AFTER INSERT ON funcionario
FOR EACH ROW
BEGIN
    IF NEW.atividade = "Desligado" THEN 
        INSERT INTO funcionariosDemitidos(id_pessoa, id_cargo, dataIngres, dataDesligamento, atividade)
        VALUES (NEW.idPessoa, NEW.idCargoNEW.dataIngres, NEW.dataDesligamento, NEW.atividade)
    END IF;
END;
//

DELIMITER ; 