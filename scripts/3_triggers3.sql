USE flyBase;
DELIMITER //

CREATE TRIGGER tg_StatusDoVoo
AFTER UPDATE ON Voo
FOR EACH ROW
BEGIN

    -- se o valor do status realmente mudou.
    IF OLD.id_status_voo <> NEW.id_status_voo THEN
    
        -- Variáveis para armazenar os nomes dos status (textos)
        DECLARE nome_status_antigo VARCHAR(30);
        DECLARE nome_status_novo VARCHAR(30);

        -- Busca o nome do status antigo usando o ID antigo (OLD)
        SELECT nome INTO nome_status_antigo FROM Status_voo WHERE id_status = OLD.id_status_voo;
        
        -- Busca o nome do status novo usando o ID novo (NEW)
        SELECT nome INTO nome_status_novo FROM Status_voo WHERE id_status = NEW.id_status_voo;

        -- Insere o registro completo na tabela de log.
        INSERT INTO Log_Status_Voo (id_voo, status_antigo, status_novo)
        VALUES (NEW.id_voo, nome_status_antigo, nome_status_novo);
        
    END IF;
END //

DELIMITER ;