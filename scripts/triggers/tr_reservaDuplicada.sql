DELIMITER //

CREATE TRIGGER IF NOT EXISTS verificaDuplicada
    BEFORE INSERT ON Reserva
    FOR EACH ROW
BEGIN
    -- Declara uma variável para contar as reservas existentes
    DECLARE reservaExistente INT;

    -- Conta quantas vezes este cliente já foi registrado neste voo
    SELECT COUNT(*)
    INTO reservaExistente
    FROM Reserva
    WHERE idVoo = NEW.idVoo AND id_cliente = NEW.id_cliente;

    -- Se a contagem for maior que 0, significa que o cliente já tem uma reserva.
    -- Então, nós geramos um erro para cancelar a inserção.
    IF reservaExistente > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Erro: O passageiro já possui uma reserva para este voo.';
    END IF;
END//

DELIMITER ;
