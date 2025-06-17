-- 4. Criar uma Stored Procedure que, passando o código de uma marca, apague uma marca na tabela marca.

DELIMITER //
CREATE PROCEDURE sp_apagar_marca(
    IN p_codMarca INT
)
BEGIN
    -- Verifica se a marca existe antes de excluir
    IF EXISTS (SELECT 1 FROM marca WHERE codMarca = p_codMarca) THEN
        DELETE FROM marca 
        WHERE codMarca = p_codMarca;  

        -- Confirmação de sucesso
        SELECT CONCAT('Marca de código ', p_codMarca, ' removida com sucesso!') AS resultado;  
    ELSE
        -- Mensagem de erro se não encontrar a marca
        SELECT CONCAT('Marca com código ', p_codMarca, ' não encontrada.') AS erro;  
    END IF;
END//

DELIMITER ;

-- Excluir marca existente (código 4)
CALL sp_apagar_marca(2);

-- Tentar excluir marca inexistente (código 999)
CALL sp_apagar_marca(999);


