USE flyBase;

DELIMITER //

CREATE TRIGGER tr_naoEscalados
AFTER INSERT ON funcionariosDemitidos
FOR EACH ROW
BEGIN
    INSERT INTO funcionariosNaoEscalados(idDemitidos, dataDesligamento)
    VALUES (NEW.id, NEW.dataDesligamento)
END;
//

DELIMITER ; 