# Sistema de Stored Procedures - Banco Burger

Este repositório contém um conjunto de **Stored Procedures** desenvolvidas para o banco de dados **burger**, dado em sala de aula, oferecendo funcionalidades essenciais para gerenciamento de clientes, produtos, marcas e categorias.

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Stored Procedures Disponíveis](#stored-procedures-disponíveis)
- [Como Executar](#como-executar)
- [Exemplos de Uso](#exemplos-de-uso)
- [Estrutura do Projeto](#estrutura-do-projeto)

## 🎯 Visão Geral

O sistema implementa **9 stored procedures** que cobrem as principais operações de CRUD (Create, Read, Update, Delete) para as entidades do banco:

- **Clientes**: Inserção, atualização de e-mail e busca por nome
- **Marcas**: Inserção, atualização e exclusão
- **Categorias**: Inserção de novas categorias
- **Produtos**: Inserção e atualização de margem de lucro

## 🔧 Stored Procedures Disponíveis

### 1. **sp_atualizar_email_cliente**
Atualiza o e-mail de um cliente específico.
```sql
CALL sp_atualizar_email_cliente(1, 'contato@juanpablofarias.com');
```

### 2. **sp_inserir_marca**
Insere uma nova marca no sistema.
```sql
CALL sp_inserir_marca('JFdev');
```

### 3. **sp_atualizar_nome_marca**
Atualiza o nome de uma marca existente.
```sql
CALL sp_atualizar_nome_marca(2, 'Garoto Premium');
```

### 4. **sp_apagar_marca**
Remove uma marca do sistema.
```sql
CALL sp_apagar_marca(2);
```

### 5. **sp_inserir_categoria**
Adiciona uma nova categoria de produtos.
```sql
CALL sp_inserir_categoria('Lanches');
```

### 6. **sp_inserir_cliente**
Cadastra um novo cliente no sistema.
```sql
CALL sp_inserir_cliente('Mariana Silva', '1990-05-12');
```

### 7. **sp_atualizar_margem_lucro**
Atualiza a margem de lucro de um produto específico.
```sql
CALL sp_atualizar_margem_lucro(1, 25.50);
```

### 8. **sp_inserir_produto**
Cadastra um novo produto no sistema.
```sql
CALL sp_inserir_produto('Empada de Palmito', 1.80, 3.60, 1, 6);
```

### 9. **sp_buscar_cliente_por_nome**
Busca clientes por parte do nome.
```sql
CALL sp_buscar_cliente_por_nome('Paula');
```

## 🚀 Como Executar

1. **Conecte-se ao banco de dados MySQL**
2. **Execute o script completo** para:
   - Remover procedures existentes (se houver)
   - Criar as novas procedures
3. **Teste as procedures** usando os exemplos fornecidos

### Pré-requisitos
- MySQL Server
- Banco de dados `burger` configurado
- Privilégios para criação de stored procedures

## 💡 Exemplos de Uso

### Gerenciamento de Clientes
```sql
-- Inserir novo cliente
CALL sp_inserir_cliente('João Santos', '1985-03-15');

-- Atualizar e-mail do cliente
CALL sp_atualizar_email_cliente(1, 'joao@email.com');

-- Buscar cliente por nome
CALL sp_buscar_cliente_por_nome('João');
```

### Gerenciamento de Produtos
```sql
-- Inserir novo produto
CALL sp_inserir_produto('Pizza Margherita', 8.50, 25.00, 1, 2);

-- Atualizar margem de lucro
CALL sp_atualizar_margem_lucro(1, 30.00);
```

### Gerenciamento de Marcas e Categorias
```sql
-- Inserir nova marca
CALL sp_inserir_marca('Coca-Cola');

-- Inserir nova categoria
CALL sp_inserir_categoria('Bebidas');

-- Atualizar nome da marca
CALL sp_atualizar_nome_marca(1, 'Coca-Cola Brasil');
```

## 📁 Estrutura do Projeto

```
burger-procedures/
│
├── README.md                 # Este arquivo
├── burguer.sql               # Banco de dados
├── drops.sql                 # Apaga as procedures
├── atividade*.sql            # Cada uma das procedures
└── atividade_completa.sql    # Script completo com todas as procedures
```

## 🔒 Validações Implementadas

Todas as procedures incluem **validações de integridade**:

- ✅ Verificação de existência antes de atualizações/exclusões
- ✅ Mensagens de erro personalizadas
- ✅ Confirmações de sucesso com IDs gerados
- ✅ Tratamento de casos de entidades não encontradas

## 📝 Observações

- As procedures foram desenvolvidas com **delimitadores personalizados** (`//`) para evitar conflitos
- Cada procedure retorna mensagens informativas sobre o resultado da operação
- O script inclui exemplos práticos para teste de cada funcionalidade
- Sistema preparado para expansões futuras

---

**Desenvolvido para o banco de dados Burger** 🍔 (Fornecido pelo professor em sala de aula)
