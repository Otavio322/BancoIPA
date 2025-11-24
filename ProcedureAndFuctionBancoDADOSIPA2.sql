USE bancodadosipa;
DELIMITER //

-- 1. Atualiza o status de um agricultor específico.
CREATE PROCEDURE sp_atualizar_status_agricultor (IN p_cpf_cnpj VARCHAR(18), IN p_novo_status VARCHAR(20))
BEGIN
    UPDATE agricultores
    SET Status = p_novo_status
    WHERE CPF_CNPJ = p_cpf_cnpj;
END //

-- 2. Insere um novo registro na tabela entradasementes.
CREATE PROCEDURE sp_registrar_nova_entrada_semente (IN p_tipo_semente VARCHAR(50), IN p_quantidade INT, IN p_data_chegada DATE)
BEGIN
    INSERT INTO entradasementes (TipoSemente, QuantidadeSementes, DataChegada)
    VALUES (p_tipo_semente, p_quantidade, p_data_chegada);
END //

-- 3. Atualiza o status de transportes que estão 'Em transporte' para 'Entregue'.
CREATE PROCEDURE sp_mover_transportes_entregues ()
BEGIN
    UPDATE transportesementes
    SET Status = 'Entregue'
    WHERE Status = 'Em transporte' AND DataEntrega <= CURDATE();
END //

-- 4. Retorna todos os registros de produção de sementes dado um tipo específico.
CREATE PROCEDURE sp_listar_producao_por_tipo (IN p_tipo_semente VARCHAR(50))
BEGIN
    SELECT *
    FROM producaosementes
    WHERE TipoSemente LIKE CONCAT('%', p_tipo_semente, '%');
END //

-- 5. Deleta um agricultor específico, verificando se o status é 'Inativo'.
CREATE PROCEDURE sp_deletar_agricultor_inativo (IN p_cpf_cnpj VARCHAR(18))
BEGIN
    DELETE FROM enderecoagricultores WHERE Agricultores_CPF_CNPJ = p_cpf_cnpj;
    DELETE FROM agricultores
    WHERE CPF_CNPJ = p_cpf_cnpj AND Status = 'Inativo';
END //

-- 6. Atualiza o campo Telefone para uma cooperativa específica
CREATE PROCEDURE sp_atualizar_telefone_cooperativa (IN p_cnpj_coop VARCHAR(18), IN p_novo_telefone VARCHAR(16))
BEGIN
    UPDATE cooperativa
    SET Telefone = p_novo_telefone
    WHERE CNPJ = p_cnpj_coop;
END //

-- 7. Gera um relatório detalhado da produção de sementes associada aos agricultores de uma cooperativa específica.
CREATE PROCEDURE sp_relatorio_producao_por_cooperativa (IN p_cnpj_coop VARCHAR(18))
BEGIN
    SELECT
        A.Nome AS Agricultor,
        PS.TipoSemente,
        PS.QuantidadeSementes
    FROM agricultores AS A
    JOIN agricultores_has_producaosementes AS AHP ON A.CPF_CNPJ = AHP.Agricultores_CPF_CNPJ
    JOIN producaosementes AS PS ON AHP.ProducaoSementes_idProducaoSementes = PS.idProducaoSementes
    WHERE A.Cooperativa_CNPJ = p_cnpj_coop;
END //

-- 8. Retorna a idade média de todos os agricultores cadastrados.
CREATE FUNCTION fn_calcular_media_idade_agricultores ()
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
    DECLARE media DECIMAL(5,2);
    SELECT IFNULL(AVG(Idade), 0) INTO media FROM agricultores;
    RETURN media;
END //

-- 9. Retorna a soma total da QuantidadeSementes em entradasementes.
CREATE FUNCTION fn_obter_total_sementes_entrada ()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT IFNULL(SUM(QuantidadeSementes), 0) INTO total FROM entradasementes;
    RETURN total;
END //

-- 10. Verifica se uma cooperativa específica tem o Tipo 'Mista'.
CREATE FUNCTION fn_verifica_cooperativa_mista (p_cnpj_coop VARCHAR(18))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SELECT COUNT(*) INTO resultado
    FROM cooperativa
    WHERE CNPJ = p_cnpj_coop AND Tipo = 'Mista';

    RETURN resultado;
END //

-- 11. Retorna o nome da transportadora dado o seu ID
CREATE FUNCTION fn_obter_nome_transportadora (p_id_transportadora INT)
RETURNS VARCHAR(60)
READS SQL DATA
BEGIN
    DECLARE nome_transp VARCHAR(60);
    SELECT Nome INTO nome_transp
    FROM transportadora
    WHERE idTransportadora = p_id_transportadora;
    RETURN nome_transp;
END //

-- 12. Calcula o número de dias restantes para a validade de uma semente.
CREATE FUNCTION fn_calcular_dias_validade_restantes (p_id_producao INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE dias_restantes INT;
    SELECT DATEDIFF(Validade, CURDATE()) INTO dias_restantes
    FROM producaosementes
    WHERE idProducaoSementes = p_id_producao;

    RETURN IFNULL(dias_restantes, -999);
END //

-- 13. Retorna o CEP de um agricultor específico.
CREATE FUNCTION fn_obter_cep_agricultor (p_cpf_cnpj VARCHAR(18))
RETURNS VARCHAR(9)
READS SQL DATA
BEGIN
    DECLARE cep_agric VARCHAR(9);
    SELECT CEP INTO cep_agric
    FROM enderecoagricultores
    WHERE Agricultores_CPF_CNPJ = p_cpf_cnpj;
    RETURN cep_agric;
END //

-- 14. Retorna o número total de agricultores filiados a uma cooperativa específica.
CREATE FUNCTION fn_contar_agricultores_por_cooperativa (p_cnpj_coop VARCHAR(18))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM agricultores
    WHERE Cooperativa_CNPJ = p_cnpj_coop;
    RETURN total;
END //

DELIMITER ;
