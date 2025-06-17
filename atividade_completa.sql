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


-- Listar procedures do banco burger
SHOW PROCEDURE STATUS WHERE Db='burger';