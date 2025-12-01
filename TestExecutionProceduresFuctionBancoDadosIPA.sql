USE bancodadosipa;

-- =========================================================
-- PARTE 1: EXECUÇÃO DAS STORED PROCEDURES (CALL)
-- =========================================================

-- 1. sp_atualizar_status_agricultor: Atualiza um agricultor para 'Inativo'
-- CPF: '123.456.789-01' (João da Silva)
SELECT '--- 1. Atualizando Status (João da Silva) ---' AS Mensagem;
CALL sp_atualizar_status_agricultor('123.456.789-01', 'Inativo');
SELECT CPF_CNPJ, Nome, Status FROM agricultores WHERE CPF_CNPJ = '123.456.789-01';


-- 2. sp_registrar_nova_entrada_semente: Insere um novo registro de semente
SELECT '--- 2. Registrando Nova Entrada ---' AS Mensagem;
CALL sp_registrar_nova_entrada_semente('Cana-de-Açúcar PE', 3000, CURDATE());
SELECT * FROM entradasementes ORDER BY idEntradaSementes DESC LIMIT 1;


-- 3. sp_mover_transportes_entregues: Move transportes com 'Em transporte' para 'Entregue'
-- (Afetará transportes cuja DataEntrega <= data atual)
SELECT '--- 3. Movendo Transportes Entregues ---' AS Mensagem;
CALL sp_mover_transportes_entregues();
SELECT Status, COUNT(*) AS Total FROM transportesementes GROUP BY Status;


-- 4. sp_listar_producao_por_tipo: Lista a produção de 'Milho'
SELECT '--- 4. Listando Produção por Tipo (Milho) ---' AS Mensagem;
CALL sp_listar_producao_por_tipo('Milho');


-- 5. sp_deletar_agricultor_inativo: Deleta agricultor INATIVO (José Pereira)
-- OBS: O agricultor '123.456.789-03' já está 'Inativo' (conforme seu INSERT)
SELECT '--- 5. Deletando Agricultor Inativo (José Pereira) ---' AS Mensagem;
CALL sp_deletar_agricultor_inativo('123.456.789-03');
-- Verifica se o agricultor foi deletado: deve retornar 0 linhas.
SELECT CPF_CNPJ, Nome, Status FROM agricultores WHERE CPF_CNPJ = '123.456.789-03';


-- 6. sp_atualizar_telefone_cooperativa: Atualiza o telefone da Coop. Sertão Grãos
-- CNPJ: '05.555.555/0003-01'
SELECT '--- 6. Atualizando Telefone (Coop. Sertão Grãos) ---' AS Mensagem;
CALL sp_atualizar_telefone_cooperativa('05.555.555/0003-01', '(81) 99999-0000');
SELECT CNPJ, Nome, Telefone FROM cooperativa WHERE CNPJ = '05.555.555/0003-01';


-- 7. sp_relatorio_producao_por_cooperativa: Relatório da Coop. Milho Nordeste
-- CNPJ: '05.555.555/0001-01'
SELECT '--- 7. Relatório de Produção (Coop. Milho Nordeste) ---' AS Mensagem;
CALL sp_relatorio_producao_por_cooperativa('05.555.555/0001-01');


-- =========================================================
-- PARTE 2: EXECUÇÃO DAS FUNCTIONS (SELECT)
-- =========================================================

SELECT '==================================================' AS Separador;
SELECT 'EXECUÇÃO DAS FUNCTIONS' AS Titulo;
SELECT '==================================================' AS Separador;


-- 8. fn_calcular_media_idade_agricultores: Retorna a média de idade
SELECT fn_calcular_media_idade_agricultores() AS Media_Idade_Agricultores;

-- 9. fn_obter_total_sementes_entrada: Retorna o total de sementes registradas em entradas
SELECT fn_obter_total_sementes_entrada() AS Total_Sementes_Entrada;

-- 10. fn_verifica_cooperativa_mista: Verifica se a Coop. Sertão Grãos é 'Mista'
-- CNPJ: '05.555.555/0003-01' (É Mista, deve retornar 1)
SELECT fn_verifica_cooperativa_mista('05.555.555/0003-01') AS Coop_Sertao_E_Mista;

-- 11. fn_obter_nome_transportadora: Retorna o nome da transportadora ID 1
SELECT fn_obter_nome_transportadora(1) AS Nome_Transportadora_ID_1;

-- 12. fn_calcular_dias_validade_restantes: Calcula os dias restantes para a Validade da Produção ID 1
SELECT fn_calcular_dias_validade_restantes(1) AS Dias_Restantes_Validade_ID_1;

-- 13. fn_obter_cep_agricultor: Retorna o CEP do agricultor '123.456.789-04'
SELECT fn_obter_cep_agricultor('123.456.789-04') AS CEP_Agricultor_Ana_Oliveira;

-- 14. fn_contar_agricultores_por_cooperativa: Retorna o total de agricultores da Coop. Milho Nordeste
-- CNPJ: '05.555.555/0001-01' (Tem 1 agricultor: João da Silva)
SELECT fn_contar_agricultores_por_cooperativa('05.555.555/0001-01') AS Total_Agricultores_Coop_Milho;