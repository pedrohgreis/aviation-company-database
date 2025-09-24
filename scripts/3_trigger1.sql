USE flyBase;

DELIMITER //

CREATE TRIGGER tr_check_flight_capacity
BEFORE INSERT ON Reserva
FOR EACH ROW
BEGIN
    -- 1. Declarar variáveis para armazenar os dados do SELECT
    DECLARE v_capacidade INT;
    DECLARE v_reservas_atuais INT;
    DECLARE v_id_aviao INT;

    -- 2. Obter o id do avião para o voo da nova reserva (SELECT na tabela Voo)
    SELECT id_Aviao INTO v_id_aviao FROM Voo WHERE id_voo = NEW.idVoo;

    -- 3. Obter a capacidade do avião (SELECT na tabela Aviao)
    SELECT capacidade INTO v_capacidade FROM Aviao WHERE id_aviao = v_id_aviao;

    -- 4. Contar o número de reservas atuais para o voo (SELECT COUNT)
    SELECT COUNT(*) INTO v_reservas_atuais FROM Reserva WHERE idVoo = NEW.idVoo;

    -- 5. Comparar e lançar um erro se o voo estiver cheio
    IF v_reservas_atuais >= v_capacidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível criar a reserva. O voo já atingiu a capacidade máxima.';
    END IF;
END//

DELIMITER ;