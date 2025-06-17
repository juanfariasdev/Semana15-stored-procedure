-- 9.Criar uma Stored Procedure que, passando parte do nome do cliente, seja possível consultar os clientes que possuem esta informação em qualquer parte do seu nome.


DELIMITER //

CREATE PROCEDURE sp_buscar_cliente_por_nome(
    IN p_parteNome VARCHAR(200)
)
BEGIN
    SELECT 
        codCliente,
        nome,
        dataNascimento,
        email
    FROM cliente
    WHERE nome LIKE CONCAT('%', p_parteNome, '%');
END//

DELIMITER ;


-- Exemplo 1: Buscar clientes com parte do nome "Paula"
CALL sp_buscar_cliente_por_nome('Paula');

-- Exemplo 2: Buscar clientes com parte do nome "Silva"
CALL sp_buscar_cliente_por_nome('Silva');