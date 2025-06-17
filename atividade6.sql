-- 6.Criar uma Stored Procedure que, passando o nome do cliente e a data de nascimento, insira um novo cliente na tabela cliente.

DELIMITER //

CREATE PROCEDURE sp_inserir_cliente(
    IN p_nomeCliente VARCHAR(200),
    IN p_dataNascimento DATE
)
BEGIN
    -- Insere novo cliente com nome e data de nascimento informados
    INSERT INTO cliente (nome, dataNascimento)
    VALUES (p_nomeCliente, p_dataNascimento);
    
    -- Retorna confirmação com o ID gerado
    SELECT CONCAT('Cliente inserido com sucesso. ID: ', LAST_INSERT_ID()) AS resultado;
END//

DELIMITER ;


-- Exemplo 1: Inserir cliente "Mariana Silva" nascida em 1990-05-12
CALL sp_inserir_cliente('Mariana Silva', '1990-05-12');

-- Exemplo 2: Inserir cliente "Pedro Alves" nascido em 1982-11-23
CALL sp_inserir_cliente('Pedro Alves', '1982-11-23');
