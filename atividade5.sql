-- 5.Criar uma Stored Procedure que, passando um nome novo, insira uma nova categoria na tabela categoria.

DELIMITER //
CREATE PROCEDURE sp_inserir_categoria(
    IN p_nomeCategoria VARCHAR(100)
)
BEGIN
    -- Insere nova categoria com o nome informado
    INSERT INTO categoria (nome)
    VALUES (p_nomeCategoria);
    
    -- Retorna confirmação com o ID gerado
    SELECT CONCAT('Categoria inserida com sucesso. ID: ', LAST_INSERT_ID()) AS resultado;
END//
DELIMITER ;

-- Inserir nova categoria "Lanches"
CALL sp_inserir_categoria('Lanches');

-- Inserir nova categoria "Bebidas Especiais"
CALL sp_inserir_categoria('Bebidas Especiais');

-- Inserir nova categoria "Sobremesas"
CALL sp_inserir_categoria('Sobremesas');