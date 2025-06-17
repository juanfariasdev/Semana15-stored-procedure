-- 7.Criar uma Stored Procedure que, passando o código e uma nova margem de lucro, atualize a margem de lucro de um produto na tabela produto. Caso o código não corresponda a um produto, retornar a mensagem de “Produto não encontrado”.

DELIMITER //

CREATE PROCEDURE sp_atualizar_margem_lucro(
    IN p_codProduto INT,
    IN p_novaMargem DECIMAL(5,2)
)
BEGIN
    IF EXISTS (SELECT 1 FROM produto WHERE codProduto = p_codProduto) THEN
        UPDATE produto
        SET margemLucro = p_novaMargem
        WHERE codProduto = p_codProduto;

        SELECT CONCAT(
            'Margem de lucro do produto ', p_codProduto,
            ' atualizada para ', p_novaMargem, '%'
        ) AS resultado;
    ELSE
        SELECT 'Produto não encontrado' AS erro;
    END IF;
END//

DELIMITER ;


-- Atualizar margem de lucro do produto código 1 para 25.50%
CALL sp_atualizar_margem_lucro(1, 25.50);

-- Tentar atualizar produto inexistente (código 999)
CALL sp_atualizar_margem_lucro(999, 15.00);
