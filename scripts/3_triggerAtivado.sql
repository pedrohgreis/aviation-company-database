/* Mostrando antes */
SELECT * FROM apagar_tambem AS antes;

/* Executando a operação */
INSERT INTO apagar (texto) VALUES ("Vamos ver se o trigger funciona");

/* Mostrando o resultado */
SELECT * FROM apagar_tambem AS depois;
