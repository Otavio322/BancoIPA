-- 1. Agricultores e suas Cooperativas
CREATE VIEW view_agricultores_cooperativas AS
SELECT
    A.Nome AS Agricultor,
    A.Telefone,
    C.Nome AS Cooperativa,
    C.Tipo AS Tipo_Cooperativa
FROM agricultores AS A
JOIN cooperativa AS C ON A.Cooperativa_CNPJ = C.CNPJ;

-- 2. Produção de Sementes e Agricultores
CREATE VIEW view_producao_agricultores AS
SELECT
    A.Nome AS Agricultor,
    PS.TipoSemente,
    PS.QuantidadeSementes,
    PS.Validade
FROM agricultores AS A
JOIN agricultores_has_producaosementes AS AHP ON A.CPF_CNPJ = AHP.Agricultores_CPF_CNPJ
JOIN producaosementes AS PS ON AHP.ProducaoSementes_idProducaoSementes = PS.idProducaoSementes;

-- 3. Cooperativas ligadas ao IPA
CREATE VIEW view_cooperativas_ipa AS
SELECT
    C.Nome AS Cooperativa,
    C.CNPJ,
    C.TipoGraos,
    I.Nome AS IPA_Oficial
FROM cooperativa AS C
JOIN ipa AS I ON C.ipa_CNPJIPA = I.CNPJIPA;

-- 4. Transportadoras e seus Contatos
CREATE VIEW view_transportadoras_contato AS
SELECT
    Nome,
    CNPJ,
    Telefone,
    Email
FROM transportadora;

-- 5. Endereço Completo do IPA
CREATE VIEW view_enderecos_ipa_completo AS
SELECT
    I.Nome AS IPA,
    E.Rua,
    E.Numero,
    E.Cidade,
    E.UF,
    E.CEP
FROM ipa AS I
JOIN endereco AS E ON I.CNPJIPA = E.ipa_CNPJIPA;

-- 6. Detalhes do Transporte e Agricultor de Destino
CREATE VIEW view_transportes_agricultores AS
SELECT
    TS.idTransporte,
    TS.Origem,
    TS.Status,
    A.Nome AS Nome_Agricultor
FROM transportesementes AS TS
JOIN agricultores AS A ON TS.Destino_Agricultor_CPF_CNPJ = A.CPF_CNPJ;

-- 7. Detalhes do Transporte e Cooperativa de Destino
CREATE VIEW view_transportes_cooperativas AS
SELECT
    TS.idTransporte,
    TS.Origem,
    TS.DataEntrega
FROM transportesementes AS TS
WHERE TS.Destino_Cooperativa_CNPJ IS NOT NULL;

-- 8. Detalhe completo de transporte com a transportadora
CREATE VIEW view_transporte_e_transportadora AS
SELECT
    TS.idTransporte,
    TS.DataEnvio,
    TS.DataEntrega,
    T.Nome AS Transportadora,
    T.CNPJ AS CNPJ_Transportadora
FROM transportesementes AS TS
JOIN transportadora AS T ON TS.Transportadora_idTransportadora = T.idTransportadora;

-- 9. Endereço Detalhado por Agricultor
CREATE VIEW view_agricultores_endereco AS
SELECT
    A.Nome AS Agricultor,
    EA.Rua,
    EA.Numero,
    EA.CEP
FROM agricultores AS A
JOIN enderecoagricultores AS EA ON A.CPF_CNPJ = EA.Agricultores_CPF_CNPJ;

-- 10. Endereço Detalhado por Cooperativa
CREATE VIEW view_cooperativas_endereco AS
SELECT
    C.Nome AS Cooperativa,
    C.Tipo AS Tipo_Cooperativa,
    EC.Rua,
    EC.Cidade,
    EC.UF
FROM cooperativa AS C
JOIN enderecocooperativas AS EC ON C.CNPJ = EC.Cooperativa_CNPJ;

-- 11. Sementes produzidas com preço acima da média
CREATE VIEW view_producao_cara AS
SELECT
    PS.TipoSemente,
    PS.Preco
FROM producaosementes AS PS
WHERE PS.Preco > (SELECT AVG(Preco) FROM producaosementes);

-- 12. Lista apenas Agricultores com Status 'Ativo'
CREATE VIEW view_agricultores_ativos AS
SELECT
    Nome,
    CPF_CNPJ
FROM agricultores
WHERE Status = 'Ativo';

-- 13. Transportes já entregues
CREATE VIEW view_transporte_entregue AS
SELECT
    idTransporte,
    Origem,
    DataEntrega
FROM transportesementes
WHERE Status = 'Entregue';

-- 14. Cooperativas com quantidade de grãos acima de 550
CREATE VIEW view_cooperativas_alta_qntd AS
SELECT
    Nome,
    QntdGraos,
    TipoGraos
FROM cooperativa
WHERE QntdGraos > 550;

-- 15. Entradas de sementes com data de chegada em 2025
CREATE VIEW view_entradas_recentes AS
SELECT
    TipoSemente,
    QuantidadeSementes,
    DataChegada
FROM entradasementes
WHERE DataChegada >= '2025-01-01';

-- 16. Detalhes completos da entrega final de sementes
CREATE VIEW view_relatorio_entrega_final AS
SELECT
    TS.idTransporte,
    TS.DataEntrega,
    T.Nome AS Transportadora
FROM transportesementes AS TS
JOIN transportadora AS T ON TS.Transportadora_idTransportadora = T.idTransportadora;

-- 17. Produção detalhada por município do agricultor
CREATE VIEW view_producao_municipio AS
SELECT
    PS.TipoSemente,
    PS.QuantidadeSementes,
    A.Nome AS Agricultor_Responsavel
FROM agricultores AS A
JOIN agricultores_has_producaosementes AS AHP ON A.CPF_CNPJ = AHP.Agricultores_CPF_CNPJ
JOIN producaosementes AS PS ON AHP.ProducaoSementes_idProducaoSementes = PS.idProducaoSementes;

-- 18. Lista Cooperativas e os transportes que elas usaram
CREATE VIEW view_relacao_cooperativa_transp AS
SELECT
    C.Nome AS Cooperativa,
    C.CNPJ,
    TS.idTransporte,
    TS.Origem,
    TS.DataEnvio
FROM cooperativa AS C
JOIN cooperativa_has_transportes AS CHT ON C.CNPJ = CHT.Cooperativa_CNPJ
JOIN transportesementes AS TS ON CHT.Transporte_idTransporte = TS.idTransporte;

-- 19. Contato das Cooperativas
CREATE VIEW view_contato_cooperativas AS
SELECT
    C.Nome,
    C.Tipo,
    EC.CEP,
    C.CNPJ
FROM cooperativa AS C
JOIN enderecocooperativas AS EC ON C.CNPJ = EC.Cooperativa_CNPJ;

-- 20. Total de transportes por transportadora
CREATE VIEW view_transportes_por_transportadora AS
SELECT
    T.Nome AS Transportadora,
    COUNT(TS.idTransporte) AS Total_Transportes
FROM transportadora AS T
LEFT JOIN transportesementes AS TS ON T.idTransportadora = TS.Transportadora_idTransportadora
GROUP BY T.Nome;

-- 21. Relatório de Entradas de Sementes
CREATE VIEW view_entradasementes AS
SELECT TipoSemente, QuantidadeSementes, DataChegada
FROM bancodadosipa.entradasementes;

-- 22. Relatório de IPA
CREATE VIEW view_ipa AS
SELECT Nome, Telefone, Email, EntradaSementes_idEntradaSementes
FROM bancodadosipa.ipa;

-- 23. Relatório de Cooperativas
CREATE VIEW view_cooperativa AS
SELECT CNPJ, Nome, Tipo, Saida, Entrada, TipoGraos, QntdGraos, ipa_CNPJIPA
FROM bancodadosipa.cooperativa;

-- 24. Relatório de Agricultores
CREATE VIEW view_agricultores AS
SELECT CPF_CNPJ, Nome, Idade, TipoEntidade, Telefone, Email, DataCadastro, Status, Cooperativa_CNPJ
FROM bancodadosipa.agricultores;

-- 25. Relatório de Produção de Sementes
CREATE VIEW view_producaosementes AS
SELECT TipoSemente, QuantidadeSementes, Preco, Validade
FROM bancodadosipa.producaosementes;

-- 26. Relatório de Transportadora
CREATE VIEW view_transportadora AS
SELECT idTransportadora, Nome, CNPJ, Telefone, Email
FROM bancodadosipa.transportadora;

-- 27. Relatório de Transporte de Sementes
CREATE VIEW view_transportesementes AS
SELECT
    Transportadora_idTransportadora,
    Origem,
    DataEnvio,
    DataEntrega,
    Status
FROM bancodadosipa.transportesementes;

-- 28. Relatório de Agricultores com Produção de Sementes
CREATE VIEW view_agricultores_com_producao AS
SELECT a.CPF_CNPJ, a.Nome, p.TipoSemente, p.QuantidadeSementes
FROM bancodadosipa.agricultores a
JOIN bancodadosipa.agricultores_has_producaosementes ap ON a.CPF_CNPJ = ap.Agricultores_CPF_CNPJ
JOIN bancodadosipa.producaosementes p ON ap.ProducaoSementes_idProducaoSementes = p.idProducaoSementes;

-- 29. Relatório de Cooperativas com Transportes
CREATE VIEW view_cooperativas_com_transportes AS
SELECT c.Nome, t.DataEnvio, t.Status
FROM bancodadosipa.cooperativa c
JOIN bancodadosipa.cooperativa_has_transportes ct ON c.CNPJ = ct.Cooperativa_CNPJ
JOIN bancodadosipa.transportesementes t ON ct.Transporte_idTransporte = t.idTransporte;

-- 30. Relatório de Agricultores com Transportes
CREATE VIEW view_agricultores_com_transportes AS
SELECT a.Nome, t.DataEnvio, t.Status
FROM bancodadosipa.agricultores a
JOIN bancodadosipa.agricultores_has_transportes at ON a.CPF_CNPJ = at.Agricultores_CPF_CNPJ
JOIN bancodadosipa.transportesementes t ON at.Transporte_idTransporte = t.idTransporte;

-- 31. Relatório de Endereços de Agricultores
CREATE VIEW view_enderecoagricultores AS
SELECT e.CEP, e.UF, e.Bairro, e.Rua, e.Numero, e.Cidade, e.Complemento, a.Nome
FROM bancodadosipa.enderecoagricultores e
JOIN bancodadosipa.agricultores a ON e.Agricultores_CPF_CNPJ = a.CPF_CNPJ;

-- 32. Relatório de Endereços de Cooperativas
CREATE VIEW view_enderecocooperativas AS
SELECT e.CEP, e.UF, e.Bairro, e.Rua, e.Numero, e.Cidade, e.Complemento, c.Nome
FROM bancodadosipa.enderecocooperativas e
JOIN bancodadosipa.cooperativa c ON e.Cooperativa_CNPJ = c.CNPJ;

-- 33. Relatório Relatório de Transportes por Status
CREATE VIEW view_transportes_por_status AS
SELECT t.Status, COUNT(t.idTransporte) AS TotalTransportes
FROM bancodadosipa.transportesementes t
GROUP BY t.Status;

-- 34. Relatório de Quantidade de Sementes por Tipo
CREATE VIEW view_quantidade_sementes_por_tipo AS
SELECT TipoSemente, SUM(QuantidadeSementes) AS Total
FROM bancodadosipa.entradasementes
GROUP BY TipoSemente;

-- 35. Relatório de Quantidade de Sementes por Cooperativa
CREATE VIEW view_quantidade_sementes_por_cooperativa AS
SELECT
    C.Nome AS Cooperativa,
    SUM(PS.QuantidadeSementes) AS TotalSementes
FROM cooperativa AS C
JOIN agricultores AS A
    ON C.CNPJ = A.Cooperativa_CNPJ
JOIN agricultores_has_producaosementes AS AHP
    ON A.CPF_CNPJ = AHP.Agricultores_CPF_CNPJ
JOIN producaosementes AS PS
    ON AHP.ProducaoSementes_idProducaoSementes = PS.idProducaoSementes
GROUP BY C.Nome;

-- 36. Relatório de Produção de Sementes por Tipo
CREATE VIEW view_producao_por_tipo AS
SELECT TipoSemente, SUM(QuantidadeSementes) AS Total
FROM bancodadosipa.producaosementes
GROUP BY TipoSemente;

-- 37. Relatório de Entradas e Saídas de Sementes
CREATE VIEW view_entradas_saidas_sementes AS
SELECT e.TipoSemente, e.QuantidadeSementes AS Entrada, p.QuantidadeSementes AS Saida
FROM bancodadosipa.entradasementes e
JOIN bancodadosipa.producaosementes p ON e.TipoSemente = p.TipoSemente;

-- 38. Relatório de Transportes de Sementes por Tipo
CREATE VIEW view_transportes_por_tipo AS
SELECT t.Status, COUNT(t.idTransporte) AS TotalTransportes
FROM bancodadosipa.transportesementes t
GROUP BY t.Status;

-- 39. Relatório de Produtos e Preços
CREATE VIEW view_produtos_precos AS
SELECT p.TipoSemente, p.Preco
FROM bancodadosipa.producaosementes p;

-- 40. Relatório de Agricultores por Cidade
CREATE VIEW view_agricultores_por_cidade AS
SELECT
    EA.Cidade,
    COUNT(A.CPF_CNPJ) AS TotalAgricultores
FROM bancodadosipa.enderecoagricultores AS EA
JOIN bancodadosipa.agricultores AS A ON EA.Agricultores_CPF_CNPJ = A.CPF_CNPJ
GROUP BY EA.Cidade;

