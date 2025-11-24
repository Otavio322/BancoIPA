USE bancodadosipa;

---

-- 1. Agricultores e suas Cooperativas (Idade Acima da Média)
SELECT
    A.Nome AS Nome_Agricultor,
    EA.Cidade AS Municipio,
    C.Nome AS Nome_Cooperativa
FROM agricultores AS A
JOIN cooperativa AS C ON A.Cooperativa_CNPJ = C.CNPJ
JOIN enderecoagricultores AS EA ON A.CPF_CNPJ = EA.Agricultores_CPF_CNPJ
-- Subquery: Filtra Agricultores com Idade acima da média
WHERE A.Idade IN (
    SELECT Idade FROM agricultores WHERE Idade > (SELECT AVG(Idade) FROM agricultores)
);

---

-- 2. Transportes Entregues (Apenas Transportadoras com ID > 10)
SELECT
    TS.idTransporte,
    T.Nome AS Transportadora
FROM transportesementes AS TS
JOIN transportadora AS T ON TS.Transportadora_idTransportadora = T.idTransportadora
-- Subquery 1: Filtra Transportes com Status 'Entregue'
WHERE TS.idTransporte IN (
    SELECT idTransporte FROM transportesementes WHERE Status = 'Entregue'
)
-- Subquery 2: Filtra Transportadoras com ID > 10
AND T.idTransportadora IN (
    SELECT idTransportadora FROM transportadora WHERE idTransportadora > 10
);

---

-- 3. Sementes Produzidas (Preço Acima da Média)
SELECT
    A.Nome AS Agricultor,
    PS.TipoSemente,
    PS.Preco
FROM agricultores AS A
JOIN agricultores_has_producaosementes AS AHP ON A.CPF_CNPJ = AHP.Agricultores_CPF_CNPJ
JOIN producaosementes AS PS ON AHP.ProducaoSementes_idProducaoSementes = PS.idProducaoSementes
-- Subquery: Filtra Sementes com Preço acima da média
WHERE PS.Preco IN (
    SELECT Preco FROM producaosementes WHERE Preco > (SELECT AVG(Preco) FROM producaosementes)
);

---

-- 4. Cooperativas por Endereço (Filtradas por IPA e UF)
SELECT
    C.Nome AS Nome_Cooperativa,
    EC.Cidade
FROM cooperativa AS C
JOIN enderecocooperativas AS EC ON C.CNPJ = EC.Cooperativa_CNPJ
-- Subquery 1: Filtra Cooperativas por um IPA específico
WHERE C.ipa_CNPJIPA = (
    SELECT CNPJIPA FROM ipa WHERE Nome = 'IPA Pernambuco'
)
-- Subquery 2: Filtra endereços por UF (CORRIGIDO: LIMIT 1 REMOVIDO)
AND EC.UF = (
    SELECT UF FROM enderecocooperativas WHERE Cidade = 'Caruaru'
);

---

-- 5. Endereços de Agricultores (Apenas Status 'Ativo')
SELECT
    E.CEP,
    E.Rua,
    A.Nome AS Nome_Agricultor
FROM enderecoagricultores AS E
JOIN agricultores AS A ON E.Agricultores_CPF_CNPJ = A.CPF_CNPJ
-- Subquery: Filtra Agricultores com Status 'Ativo'
WHERE A.Status IN (
    SELECT DISTINCT Status FROM agricultores WHERE Status = 'Ativo'
);

---

-- 6. IPA e Entradas de Sementes (Quantidade > 1000)
SELECT
    I.Nome AS Nome_IPA,
    ES.TipoSemente,
    ES.QuantidadeSementes
FROM ipa AS I
JOIN entradasementes AS ES ON I.CNPJIPA = ES.ipa_CNPJIPA
-- Subquery: Filtra Entradas de Sementes com Quantidade > 1000
WHERE ES.idEntradaSementes IN (
    SELECT idEntradaSementes FROM entradasementes WHERE QuantidadeSementes > 1000
);

---

-- 7. Relacionamento Agricultor-Produção (Validade > '2026-07-01')
SELECT
    A.Nome AS Nome_Agricultor,
    PS.TipoSemente,
    C.Nome AS Cooperativa_Origem
FROM agricultores AS A
JOIN agricultores_has_producaosementes AS AHP ON A.CPF_CNPJ = AHP.Agricultores_CPF_CNPJ
JOIN producaosementes AS PS ON AHP.ProducaoSementes_idProducaoSementes = PS.idProducaoSementes
JOIN cooperativa AS C ON A.Cooperativa_CNPJ = C.CNPJ
-- Subquery: Filtra Produções de Sementes com Validade após '2026-07-01'
WHERE PS.idProducaoSementes IN (
    SELECT idProducaoSementes FROM producaosementes WHERE Validade > '2026-07-01'
);

---

-- 8. Relacionamento Cooperativa-Transporte (Entrega > '2025-12-01')
SELECT
    C.Nome AS Nome_Cooperativa,
    TS.DataEntrega
FROM cooperativa AS C
JOIN cooperativa_has_transportes AS CHT ON C.CNPJ = CHT.Cooperativa_CNPJ
JOIN transportesementes AS TS ON CHT.Transporte_idTransporte = TS.idTransporte
-- Subquery: Filtra Transportes com DataEntrega após '2025-12-01'
WHERE TS.idTransporte IN (
    SELECT idTransporte FROM transportesementes WHERE DataEntrega > '2025-12-01'
);

---

-- 9. Entradas de Sementes e IPA (Data Chegada >= '2025-10-01')
SELECT
    ES.TipoSemente,
    ES.DataChegada,
    I.Nome AS IPA_Relacionado
FROM entradasementes AS ES
JOIN ipa AS I ON ES.ipa_CNPJIPA = I.CNPJIPA
-- Subquery: Filtra Entradas de Sementes com DataChegada em ou após '2025-10-01'
WHERE ES.idEntradaSementes IN (
    SELECT idEntradaSementes FROM entradasementes WHERE DataChegada >= '2025-10-01'
);

---

-- 10. IPA e seu Endereço (Apenas Cidade 'Recife')
SELECT
    I.CNPJIPA,
    I.Nome AS Nome_IPA,
    E.Rua,
    E.Cidade
FROM ipa AS I
JOIN endereco AS E ON I.CNPJIPA = E.ipa_CNPJIPA
-- Subquery: Filtra Endereços com Cidade 'Recife' (CORRIGIDO: LIMIT 1 REMOVIDO)
WHERE E.Cidade IN (
    SELECT Cidade FROM endereco WHERE Cidade = 'Recife'
);

---

-- 11. Agricultores e Produção (Apenas Município 'Caruaru')
SELECT
    A.Nome AS Agricultor,
    PS.TipoSemente,
    EA.Cidade AS Municipio
FROM agricultores AS A
JOIN agricultores_has_producaosementes AS AHP ON A.CPF_CNPJ = AHP.Agricultores_CPF_CNPJ
JOIN producaosementes AS PS ON AHP.ProducaoSementes_idProducaoSementes = PS.idProducaoSementes
JOIN enderecoagricultores AS EA ON A.CPF_CNPJ = EA.Agricultores_CPF_CNPJ
-- Subquery: Filtra Endereços de Agricultores com Cidade 'Caruaru'
WHERE EA.Cidade IN (
    SELECT DISTINCT Cidade FROM enderecoagricultores WHERE Cidade = 'Caruaru'
);

---

-- 12. Cooperativas e Endereço (QntdGraos Acima da Média)
SELECT
    C.Nome,
    C.QntdGraos,
    EC.CEP
FROM cooperativa AS C
JOIN enderecocooperativas AS EC ON C.CNPJ = EC.Cooperativa_CNPJ
-- Subquery: Filtra Cooperativas com Quantidade de Grãos acima da média
WHERE C.QntdGraos IN (
    SELECT QntdGraos FROM cooperativa WHERE QntdGraos > (SELECT AVG(QntdGraos) FROM cooperativa)
);

---

-- 13. Endereços de Cooperativas (Número > 100)
SELECT
    EC.Rua,
    EC.Cidade,
    C.Nome AS Cooperativa
FROM enderecocooperativas AS EC
JOIN cooperativa AS C ON EC.Cooperativa_CNPJ = C.CNPJ
-- Subquery: Filtra Endereços com Número > 100
WHERE EC.Numero IN (
    SELECT Numero FROM enderecocooperativas WHERE Numero > 100
);

---

-- 14. Agricultores e Transportes (Telefone com Prefixo Específico)
SELECT
    A.Nome AS Nome_Agricultor,
    TS.DataEnvio
FROM agricultores AS A
JOIN agricultores_has_transportes AS AHT ON A.CPF_CNPJ = AHT.Agricultores_CPF_CNPJ
JOIN transportesementes AS TS ON AHT.Transporte_idTransporte = TS.idTransporte
-- Subquery: Filtra Agricultores cujo telefone comece com o mesmo prefixo (6 dígitos) do primeiro registro encontrado (CORRIGIDO: LIMIT 1 MANTIDO pois está em uma subquery escalar)
WHERE A.Telefone LIKE (
    SELECT CONCAT(SUBSTRING(Telefone, 1, 6), '%') FROM agricultores LIMIT 1
);

---

-- 15. Produção de Sementes e Agricultores (Idade < 40)
SELECT
    PS.TipoSemente,
    PS.Preco,
    A.Nome AS Agricultor
FROM producaosementes AS PS
JOIN agricultores_has_producaosementes AS AHP ON PS.idProducaoSementes = AHP.ProducaoSementes_idProducaoSementes
JOIN agricultores AS A ON AHP.Agricultores_CPF_CNPJ = A.CPF_CNPJ
-- Subquery: Filtra Agricultores com Idade < 40
WHERE A.CPF_CNPJ IN (
    SELECT CPF_CNPJ FROM agricultores WHERE Idade < 40
);

---

-- 16. Agricultores com Endereço (Apenas Bairro 'Assentamento Esperança')
SELECT
    A.Nome,
    A.Telefone,
    EA.Bairro
FROM agricultores AS A
JOIN enderecoagricultores AS EA ON A.CPF_CNPJ = EA.Agricultores_CPF_CNPJ
-- Subquery: Filtra Endereços com Bairro 'Assentamento Esperança'
WHERE EA.Bairro IN (
    SELECT DISTINCT Bairro FROM enderecoagricultores WHERE Bairro = 'Assentamento Esperança'
);

---

-- 17. Transportes com Destino ao Agricultor (Apenas Status 'Em transporte')
SELECT
    TS.idTransporte,
    T.Nome AS Transportadora
FROM transportesementes AS TS
JOIN transportadora AS T ON TS.Transportadora_idTransportadora = T.idTransportadora
-- Subquery: Filtra Transportes com Status 'Em transporte'
WHERE TS.Status IN (
    SELECT DISTINCT Status FROM transportesementes WHERE Status = 'Em transporte'
);

---

-- 18. Cooperativas com Saída Anterior (Saída < '2025-10-01')
SELECT
    C.Nome,
    C.Entrada,
    EC.CEP
FROM cooperativa AS C
JOIN enderecocooperativas AS EC ON C.CNPJ = EC.Cooperativa_CNPJ
-- Subquery: Filtra Cooperativas com Saida anterior a '2025-10-01'
WHERE C.CNPJ IN (
    SELECT CNPJ FROM cooperativa WHERE Saida < '2025-10-01'
);

---

-- 19. Transportadoras (Que Transportaram para Cooperativas)
SELECT
    T.Nome,
    T.Email
FROM transportadora AS T
JOIN transportesementes AS TS ON T.idTransportadora = TS.Transportadora_idTransportadora
-- Subquery: Filtra Transportes que estão na tabela de relacionamento com Cooperativas
WHERE TS.idTransporte IN (
    SELECT Transporte_idTransporte FROM cooperativa_has_transportes
)
GROUP BY T.Nome, T.Email;

---

-- 20. Transportadoras por Contagem de Transportes (Contagem >= 1)
SELECT
    T.Nome,
    T.CNPJ
FROM transportadora AS T
JOIN transportesementes AS TS ON T.idTransportadora = TS.Transportadora_idTransportadora
-- Subquery: Filtra Transportadoras que possuem pelo menos 1 transporte (GROUP BY/HAVING dentro da subquery)
WHERE T.idTransportadora IN (
    SELECT
        Transportadora_idTransportadora
    FROM transportesementes
    GROUP BY Transportadora_idTransportadora
    HAVING COUNT(idTransporte) >= 1
)
GROUP BY T.Nome, T.CNPJ;