-- 3. Criar uma Stored Procedure que, passando o código e um nome novo, atualize o nome da marca na tabela marca.

DELIMITER //
CREATE PROCEDURE sp_atualizar_nome_marca(
    IN p_codMarca INT,
    IN p_novoNome VARCHAR(100)
)
BEGIN
    -- Verifica se a marca existe
    IF EXISTS (SELECT 1 FROM marca WHERE codMarca = p_codMarca) THEN
        -- Atualiza o nome da marca
        UPDATE marca
        SET nome = p_novoNome
        WHERE codMarca = p_codMarca;
        
        -- Mensagem de confirmação
        SELECT CONCAT('Marca de código ', p_codMarca, ' atualizada para: ', p_novoNome) AS resultado;
    ELSE
        -- Mensagem de erro caso não exista
        SELECT CONCAT('Marca com código ', p_codMarca, ' não encontrada.') AS erro;
    END IF;
END//
DELIMITER ;


-- Atualizar nome de marca existente (código 2)
CALL sp_atualizar_nome_marca(2, 'Garoto Premium');

-- Tentar atualizar marca inexistente (código 999)
CALL sp_atualizar_nome_marca(999, 'Marca Desconhecida');
