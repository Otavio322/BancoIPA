
-- 1. Inserção de agricultor com status nulo e idade abaixo de 18, vai gerar erro por ser de menor.
INSERT INTO agricultores (CPF_CNPJ, Nome, Idade, TipoEntidade, Telefone, Email, DataCadastro, Status, Cooperativa_CNPJ)
VALUES ('123.456.789-21', 'João Silva', 17, 'Pessoa Física', '(81) 99999-8888', 'joao.silva@exemplo.com', '2025-10-10', NULL, '05.555.555/0001-01');



-- 2. Atualização de preço de produção de sementes para um valor abaixo de 10% do preço antigo, vai gerar erro, pois a queda do preço foi maior que 10%
UPDATE producaosementes
SET Preco = 2.50
WHERE idProducaoSementes = 5;


-- 3. Inserção de transportadora com CNPJ com pontos, barra e traços, vai gerar erro por conta da falta de caracteres.
INSERT INTO transportadora (Nome, CNPJ, Telefone, Email)
VALUES ('Transportadora Corre Ventos', '92811222/000133', '(81) 9 5542-4321', 'contato@Correventos.com');

-- 4. Não é permitido reverter o status.

-- Ou, se você tem um registro pronto, garanta que ele tenha o status 'Entregue'
UPDATE transportesementes
SET Status = 'Entregue'
WHERE idTransporte = 1;


UPDATE transportesementes
SET Status = 'Em espera'
WHERE idTransporte = 1 AND Status = 'Entregue';

-- 5. Deve FALHAR: Nome da cooperativa não pode ser vazio.

INSERT INTO cooperativa (Nome, CNPJ, Telefone, Email, Tipo, QntdGraos)
VALUES ('', '99.999.999/0001-99', '(81) 9 9899-9949', 'contato@teste.com', 'Mista', 100);

-- 6. Só exclui agricultores inativos. 

UPDATE agricultores 
SET Status = 'Ativo' 
WHERE CPF_CNPJ = '123.456.789-01';

DELETE FROM agricultores 
WHERE CPF_CNPJ = '123.456.789-01';

-- Testando ele inativo para passar.
UPDATE agricultores 
SET Status = 'Inativo' 
WHERE CPF_CNPJ = '123.456.789-01';

-- Agora o Delete.
DELETE FROM agricultores 
WHERE CPF_CNPJ = '123.456.789-01';

-- 7. Deve FALHAR: A Quantidade de Grãos não pode ser negativa.
UPDATE cooperativa
SET QntdGraos = -50 
WHERE CNPJ = '05.555.555/0001-01';

-- 8. Deve FALHAR: Rua e Número do endereço do IPA não podem ser vazios.

UPDATE endereco
SET Rua = ''
WHERE ipa_CNPJIPA = "01.000.000/0001-90";

-- 9. Deve FALHAR: Data de validade não pode ser no passado.
INSERT INTO producaosementes (TipoSemente, QuantidadeSementes, Validade, Preco)
VALUES ('Milho Transgênico', 500, '2020-01-01', 5.50);

-- 10. Deve FALHAR: Se a data de Entrega for anterior a data de Envio.

-- Data de envio futura
INSERT INTO transportesementes (Transportadora_idTransportadora, Origem, DataEnvio, DataEntrega, Status)
VALUES (1, 'Origem X', '2025-01-10', '2025-01-20', 'Em transporte');

-- Set a data de Entrega
UPDATE transportesementes
SET DataEntrega = '2025-01-01'
WHERE idTransporte = LAST_INSERT_ID();

-- 11. Não permite que deletar um entrega.
INSERT INTO transportesementes (Transportadora_idTransportadora, Origem, DataEnvio, DataEntrega, Status)
VALUES (1, 'Origem Y', '2025-01-01', '2025-01-05', 'Entregue');

DELETE FROM transportesementes WHERE idTransporte = LAST_INSERT_ID();

-- 12. Não permite adicionar endereço de agricultor inativo
UPDATE agricultores SET Status = 'Inativo' WHERE CPF_CNPJ = '123.456.789-10';

INSERT INTO enderecoagricultores (Agricultores_CPF_CNPJ, CEP, Rua, Numero)
VALUES ('123.456.789-10', '50000000', 'Rua Inativa', '10');