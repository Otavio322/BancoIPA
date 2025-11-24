USE bancodadosipa;

DELIMITER //

-- 1. Padroniza STATUS e Valida IDADE MÍNIMA (Agricultores)
CREATE TRIGGER tg_before_insert_agricultor
BEFORE INSERT ON agricultores
FOR EACH ROW
BEGIN
    -- Padroniza Status
    IF NEW.Status IS NULL OR NEW.Status = '' THEN
        SET NEW.Status = 'Ativo';
    END IF;

    -- Valida Idade
    IF NEW.Idade < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO: Agricultor deve ter no mínimo 18 anos.';
    END IF;
END //

-- 2. Impede Grande Queda de Preço (ProducaoSementes)
CREATE TRIGGER tg_before_update_producao
BEFORE UPDATE ON producaosementes
FOR EACH ROW
BEGIN
    IF NEW.Preco < OLD.Preco * 0.9 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO: Preço não pode ser reduzido em mais de 10% por atualização.';
    END IF;
END //

DELIMITER //


-- 3. Não deixa adicionar CNPJ sem os caracteres
CREATE TRIGGER tg_before_insert_transportadora
BEFORE INSERT ON transportadora
FOR EACH ROW
BEGIN
      
   
    IF NEW.CNPJ NOT REGEXP '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}$' THEN
        
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERRO: O CNPJ deve ser inserido EXATAMENTE no formato XX.XXX.XXX/XXXX-XX.';
    END IF;
END //

DELIMITER ;




DELIMITER //

-- 4. Impedir Status Retroativo (TransporteSementes)
CREATE TRIGGER tg_before_update_transporte_status
BEFORE UPDATE ON transportesementes
FOR EACH ROW
BEGIN
    -- Verifica se o status foi alterado de 'Entregue' para 'Em espera'
    IF OLD.Status = 'Entregue' AND NEW.Status = 'Em espera' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO: Não é permitido reverter o status de um transporte que já foi Entregue.';
    END IF;
END //

DELIMITER ;

DELIMITER //

-- 5. Validação de Inserção de Cooperativa (Impede nome vazio)
CREATE TRIGGER tg_before_insert_cooperativa_valida
BEFORE INSERT ON cooperativa
FOR EACH ROW
BEGIN
    -- Impede a inserção se o nome for vazio
    IF NEW.Nome IS NULL OR TRIM(NEW.Nome) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T5): O nome da cooperativa não pode ser vazio.';
    END IF;
END //

-- 6. Impedir Exclusão de Agricultor Ativo (Validação de Status)
CREATE TRIGGER tg_before_delete_agricultor_valida
BEFORE DELETE ON agricultores
FOR EACH ROW
BEGIN
    -- Impede a exclusão se o agricultor não estiver 'Inativo'
    IF OLD.Status <> 'Inativo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T6): A exclusão de um agricultor só é permitida se o status for "Inativo".';
    END IF;
END //

-- 7. Impedir Quantidade de Grãos Negativa (Validação de Valor)
CREATE TRIGGER tg_before_update_cooperativa_valida
BEFORE UPDATE ON cooperativa
FOR EACH ROW
BEGIN
    -- Impede que a Quantidade de Grãos se torne negativa
    IF NEW.QntdGraos < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T7): A Quantidade de Grãos da cooperativa não pode ser negativa.';
    END IF;
END //

-- 8. Impedir Alteração de Endereço IPA para Vazio (Validação de Endereço)
CREATE TRIGGER tg_before_update_endereco_valida
BEFORE UPDATE ON endereco
FOR EACH ROW
BEGIN
    -- Impede que campos de endereço obrigatórios fiquem vazios
    IF NEW.Rua IS NULL OR TRIM(NEW.Rua) = '' OR NEW.Numero IS NULL OR TRIM(NEW.Numero) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T8): Rua e Número do endereço do IPA não podem ser vazios na alteração.';
    END IF;
END //

-- 9. Impedir Validade de Sementes no Passado (Erro de Data)
CREATE TRIGGER tg_before_insert_prod_sementes_valida
BEFORE INSERT ON producaosementes
FOR EACH ROW
BEGIN
    -- Impede a inserção se a data de validade for anterior à data atual
    IF NEW.Validade < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T9): A data de validade da semente não pode ser anterior à data atual.';
    END IF;
END //

-- 10. Impedir DataEntrega Anterior à DataEnvio (Erro de Data)
CREATE TRIGGER tg_before_update_transporte_data_valida
BEFORE UPDATE ON transportesementes
FOR EACH ROW
BEGIN
    -- Verifica se a DataEntrega é anterior à DataEnvio
    IF NEW.DataEntrega < NEW.DataEnvio THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T10): A Data de Entrega não pode ser anterior à Data de Envio.';
    END IF;
END //

-- 11. Impedir Exclusão de Transporte Concluído (Validação de Status)
CREATE TRIGGER tg_before_delete_transp_valida
BEFORE DELETE ON transportesementes
FOR EACH ROW
BEGIN
    -- Impede a exclusão de um transporte se ele já foi 'Entregue'
    IF OLD.Status = 'Entregue' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T11): Não é permitido deletar um registro de transporte que já foi Entregue.';
    END IF;
END //

-- 12. Impedir Inserção de Endereço para Agricultor Inativo (Validação Cruzada)
CREATE TRIGGER tg_before_insert_endereco_agric_valida
BEFORE INSERT ON enderecoagricultores
FOR EACH ROW
BEGIN
    DECLARE agricultor_status VARCHAR(15);
    
    -- Busca o status do agricultor
    SELECT Status INTO agricultor_status
    FROM agricultores
    WHERE CPF_CNPJ = NEW.Agricultores_CPF_CNPJ;

    -- Impede a inserção de endereço se o agricultor estiver inativo
    IF agricultor_status = 'Inativo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO (T12): Não é permitido adicionar endereço para agricultor com status "Inativo".';
    END IF;
END //

DELIMITER ;