-- 1. Criar uma Stored Procedure que, passando o código do cliente e o e-mail, atualize o e-mail de um cliente na tabela cliente.

DELIMITER //
CREATE PROCEDURE sp_atualizar_email_cliente(
    IN p_codCliente INT,
    IN p_email VARCHAR(200)
)
BEGIN
    -- Verificar se o cliente existe antes de fazer a atualização
    IF EXISTS (SELECT 1 FROM cliente WHERE codCliente = p_codCliente) THEN
        -- Atualizar o e-mail do cliente
        UPDATE cliente 
        SET email = p_email 
        WHERE codCliente = p_codCliente;
        
        -- Confirmar a operação
        SELECT CONCAT('E-mail do cliente código ', p_codCliente, ' atualizado com sucesso!') AS Resultado;
    ELSE
        -- Retornar mensagem de erro se o cliente não existir
        SELECT CONCAT('Cliente com código ', p_codCliente, ' não encontrado!') AS Erro;
    END IF;
END//
DELIMITER ;



-- Exemplo: Atualizar e-mail do cliente código 1
CALL sp_atualizar_email_cliente(1, 'contato@juanpablofarias.com');

-- Exemplo: Tentar atualizar e-mail de um cliente inexistente
CALL sp_atualizar_email_cliente(999, 'naoexiste@juanpablofarias.com')


