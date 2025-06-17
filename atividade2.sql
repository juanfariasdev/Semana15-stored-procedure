-- 2. Criar uma Stored Procedure que, passando um nome novo, insira uma nova marca na tabela marca.

DELIMITER //
CREATE PROCEDURE sp_inserir_marca(
    IN p_nome VARCHAR(100)
)
BEGIN
    -- Insere uma nova marca com o nome fornecido
    INSERT INTO marca (nome)
    VALUES (p_nome);

    -- Retorna confirmação com o ID gerado
    SELECT CONCAT('Marca inserida com sucesso. ID: ', LAST_INSERT_ID()) AS resultado;
END//

DELIMITER ;


-- Exemplo 1: Insere a marca "JFdev"
CALL sp_inserir_marca('JFdev');
