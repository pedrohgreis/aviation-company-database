DELIMITER //

CREATE TRIGGER trigger_exemplo
BEFORE INSERT ON apagar
FOR EACH ROW
BEGIN
    INSERT INTO apagar_tambem(mensagem) VALUES ('Trigger super simples só para exemplificar.');
END//

DELIMITER ;
