-- 8.Criar uma Stored Procedure que, passando os campos obrigatórios, insira um novo produto na tabela produto.

DELIMITER //
CREATE PROCEDURE sp_inserir_produto(
    IN p_nome           VARCHAR(200),
    IN p_precoCusto     DECIMAL(10,2),
    IN p_precoVenda     DECIMAL(10,2),
    IN p_categoria      INT,
    IN p_marca          INT
)
BEGIN
    INSERT INTO produto 
        (nome, precoCusto, precoVenda, CATEGORIA_codCategoria, MARCA_codMarca)
    VALUES 
        (p_nome, p_precoCusto, p_precoVenda, p_categoria, p_marca);

    SELECT CONCAT(
        'Produto inserido com sucesso. ID: ',
        LAST_INSERT_ID()
    ) AS resultado;
END//
DELIMITER ;


CALL sp_inserir_produto(
    'Empada de Palmito',   -- p_nome
     1.80,                -- p_precoCusto
     3.60,                -- p_precoVenda
     1,                   -- p_categoria (Salgados de fabricação própria)
     6                    -- p_marca (Coetagri)
);
