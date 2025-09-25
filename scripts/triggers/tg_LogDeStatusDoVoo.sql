USE flyBase;

DROP TRIGGER IF EXISTS tg_LogDeStatusDoVoo;

DELIMITER //

CREATE TRIGGER tg_LogDeStatusDoVoo
AFTER UPDATE ON Voo
FOR EACH ROW
BEGIN
    -- A condição principal continua a mesma.
    IF OLD.id_status_voo <> NEW.id_status_voo THEN
    
        -- CORREÇÃO: A lógica ficou muito mais simples e eficiente!
        -- Não precisamos mais de DECLARE ou SELECT. Inserimos os IDs diretamente.
        INSERT INTO Log_Status_Voo (id_voo, id_status_antigo, id_status_novo)
        VALUES (NEW.id_voo, OLD.id_status_voo, NEW.id_status_voo);
        
    END IF;
END //

DELIMITER ;
