USE bancodadosipa;



-- 1. IPA
INSERT INTO `bancodadosipa`.`ipa` (`CNPJIPA`, `Nome`, `Telefone`, `Email`) VALUES
('01.000.000/0001-90', 'IPA Pernambuco', '(81) 3182-3500', 'ipa.pe@exemplo.com');
-- 2. ENTRADASEMENTES 
INSERT INTO `bancodadosipa`.`entradasementes` 
(`TipoSemente`, `QuantidadeSementes`, `DataChegada`, `ipa_CNPJIPA`) 
VALUES
('Milho Híbrido C1', 1500, '2025-10-01', '01.000.000/0001-90'),
('Feijão Caupi B2', 1200, '2025-09-15', '01.000.000/0001-90'),
('Milho Híbrido C3', 1800, '2025-10-20', '01.000.000/0001-90'),
('Feijão Caupi B4', 1100, '2025-09-25', '01.000.000/0001-90'),
('Milho Híbrido C5', 1650, '2025-11-05', '01.000.000/0001-90'),
('Feijão Caupi B6', 950, '2025-08-10', '01.000.000/0001-90'),
('Milho Híbrido C7', 1700, '2025-11-15', '01.000.000/0001-90'),
('Feijão Caupi B8', 1050, '2025-08-20', '01.000.000/0001-90'),
('Milho Híbrido C9', 1900, '2025-12-01', '01.000.000/0001-90'),
('Feijão Caupi B10', 1300, '2025-09-01', '01.000.000/0001-90'),
('Milho Híbrido C11', 1450, '2025-10-10', '01.000.000/0001-90'),
('Feijão Caupi B12', 850, '2025-07-25', '01.000.000/0001-90'),
('Milho Híbrido C13', 1750, '2025-11-25', '01.000.000/0001-90'),
('Feijão Caupi B14', 1150, '2025-08-05', '01.000.000/0001-90'),
('Milho Híbrido C15', 1600, '2025-12-10', '01.000.000/0001-90'),
('Feijão Caupi B16', 1000, '2025-09-05', '01.000.000/0001-90'),
('Milho Híbrido C17', 1850, '2025-11-01', '01.000.000/0001-90'),
('Feijão Caupi B18', 1250, '2025-08-15', '01.000.000/0001-90'),
('Milho Híbrido C19', 1950, '2025-12-20', '01.000.000/0001-90'),
('Feijão Caupi B20', 900, '2025-07-30', '01.000.000/0001-90');

-- 3. PRODUCAOSEMENTES
INSERT INTO `bancodadosipa`.`producaosementes` (`TipoSemente`, `QuantidadeSementes`, `Preco`, `Validade`) VALUES
('Milho Espiga de Prata', 5000, 3.50, '2026-06-30'),
('Milho Safra de Ouro', 4500, 4.20, '2026-07-15'),
('Milho Vigoroso Pajeú', 5500, 3.60, '2026-06-01'),
('Milho Diamante do Nordeste', 4200, 4.30, '2026-08-01'),
('Milho Semente do Sol', 4800, 3.70, '2026-05-15'),
('Milho Rei do Agreste', 4900, 4.10, '2026-07-01'),
('Milho Estrela Cadente', 5100, 3.40, '2026-07-10'),
('Milho Gigante Pop', 4700, 4.40, '2026-08-15'),
('Feijão Caipira da Serra', 5300, 3.80, '2026-06-20'),
('Feijão Tropeiro Real', 4400, 4.00, '2026-05-30'),
('Feijão Sertanejo Forte', 5200, 3.55, '2026-07-05'),
('Feijão Terra Mãe', 4600, 4.25, '2026-07-25'),
('Feijão Precioso da Mata', 5400, 3.65, '2026-06-15'),
('Feijão Sol do Sertão', 4300, 4.35, '2026-08-10'),
('Feijão Aurora Dourada', 5050, 3.75, '2026-05-25'),
('Feijão Chama da Roça', 4850, 4.15, '2026-07-20'),
('Soja Esmeralda Verde', 5150, 3.45, '2026-07-30'),
('Soja Soberana', 4750, 4.45, '2026-08-25'),
('Soja Riacho Doce', 5350, 3.85, '2026-06-05'),
('Soja Plenitude', 4450, 4.05, '2026-05-10');

-- 4. TRANSPORTADORA

INSERT INTO `bancodadosipa`.`transportadora` (`Nome`, `CNPJ`, `Telefone`, `Email`) VALUES
('Veloz Agreste Cargas', '00.111.222/0001-33', '(81) 98765-4321', 'contato@velozagreste.com'), 
('Sertão Logística Express', '00.111.222/0002-33', '(81) 98765-4322', 'contato@sertaolog.com'), 
('Rota Verde Nordestina', '00.111.222/0003-33', '(81) 98765-4323', 'contato@rotaverde.com'), 
('Asa Branca Transportes', '00.111.222/0004-33', '(81) 98765-4324', 'contato@asabranca.com'), 
('Jequitibá Entregas Urgentes', '00.111.222/0005-33', '(81) 98765-4325', 'contato@jequitiba.com'), 
('Caminhos do Maracatu', '00.111.222/0006-33', '(81) 98765-4326', 'contato@caminhosmaracatu.com'), 
('Trator de Ouro Logística', '00.111.222/0007-33', '(81) 98765-4327', 'contato@tratordeouro.com'), 
('Raio de Sol Encomendas', '00.111.222/0008-33', '(81) 98765-4328', 'contato@raiodesol.com'), 
('Frota do Cariri', '00.111.222/0009-33', '(81) 98765-4329', 'contato@frotacariri.com'), 
('Expresso Mandacaru', '00.111.222/0010-33', '(81) 98765-4330', 'contato@expressomandacaru.com'), 
('Transportes Xique-Xique', '00.111.222/0011-33', '(81) 98765-4331', 'contato@xiquexique.com'), 
('Sementeira Rodoviária', '00.111.222/0012-33', '(81) 98765-4332', 'contato@sementeira.com'), 
('Água Nova Transportes', '00.111.222/0013-33', '(81) 98765-4333', 'contato@aguanovatransp.com'), 
('Cangaço Cargas', '00.111.222/0014-33', '(81) 98765-4334', 'contato@cangacocargas.com'), 
('Logística da Caatinga', '00.111.222/0015-33', '(81) 98765-4335', 'contato@logicaatinga.com'), 
('Entregas Beija-Flor', '00.111.222/0016-33', '(81) 98765-4336', 'contato@beijaflorentregas.com'), 
('Carreta do Sol Nascente', '00.111.222/0017-33', '(81) 98765-4337', 'contato@carretasol.com'), 
('Vagão da Roça', '00.111.222/0018-33', '(81) 98765-4338', 'contato@vagaodaroça.com'), 
('Frota do Capibaribe', '00.111.222/0019-33', '(81) 98765-4339', 'contato@frotacapibaribe.com'), 
('Estrada Real Log', '00.111.222/0020-33', '(81) 98765-4340', 'contato@estradareallog.com');




-- 5. ENDERECO
INSERT INTO `bancodadosipa`.`endereco` (`CEP`, `UF`, `Bairro`, `Rua`, `Numero`, `Cidade`, `Complemento`, `ipa_CNPJIPA`) VALUES
('50000-000', 'PE', 'Centro', 'Av. Agamenon Magalhães', 100, 'Recife', 'Prédio principal', '01.000.000/0001-90');

-- 6. COOPERATIVA
INSERT INTO `bancodadosipa`.`cooperativa` (`CNPJ`, `Nome`, `Tipo`, `Saida`, `Entrada`, `TipoGraos`, `QntdGraos`, `ipa_CNPJIPA`, `Email`, `Telefone`) VALUES
('05.555.555/0001-01', 'Coop. Milho Nordeste', 'Produção', '2025-11-20', '2024-01-15', 'Milho', 500, '01.000.000/0001-90', 'milhonordeste@coop.br', '(81) 3411-1001'),
('05.555.555/0002-01', 'Coop. Feijão Agreste', 'Comercial', '2025-10-10', '2024-02-20', 'Feijão', 450, '01.000.000/0001-90', 'feijaoagreste@coop.br', '(81) 3411-1002'),
('05.555.555/0003-01', 'Coop. Sertão Grãos', 'Mista', '2025-09-05', '2024-03-01', 'Milho', 600, '01.000.000/0001-90', 'sertaograos@coop.br', '(81) 3411-1003'),
('05.555.555/0004-01', 'Coop. Vale Ipojuca', 'Produção', '2025-12-01', '2024-04-10', 'Feijão', 550, '01.000.000/0001-90', 'valepoipojuca@coop.br', '(81) 3411-1004'),
('05.555.555/0005-01', 'Coop. Mata Sul', 'Comercial', '2025-08-20', '2024-05-15', 'Milho', 480, '01.000.000/0001-90', 'matasul@coop.br', '(81) 3411-1005'),
('05.555.555/0006-01', 'Coop. Alto Pajeú', 'Mista', '2025-07-15', '2024-06-01', 'Feijão', 520, '01.000.000/0001-90', 'altopajeu@coop.br', '(81) 3411-1006'),
('05.555.555/0007-01', 'Coop. Carnaíba', 'Produção', '2025-06-10', '2024-07-20', 'Milho', 580, '01.000.000/0001-90', 'carnaiba@coop.br', '(81) 3411-1007'),
('05.555.555/0008-01', 'Coop. Bezerros', 'Comercial', '2025-05-05', '2024-08-05', 'Feijão', 400, '01.000.000/0001-90', 'bezerros@coop.br', '(81) 3411-1008'),
('05.555.555/0009-01', 'Coop. Garanhuns', 'Mista', '2025-04-25', '2024-09-10', 'Milho', 650, '01.000.000/0001-90', 'garanhuns@coop.br', '(81) 3411-1009'),
('05.555.555/0010-01', 'Coop. Serra Talhada', 'Produção', '2025-03-15', '2024-10-01', 'Feijão', 470, '01.000.000/0001-90', 'serratalhada@coop.br', '(81) 3411-1010'),
('05.555.555/0011-01', 'Coop. Limoeiro', 'Comercial', '2025-02-10', '2024-11-12', 'Milho', 530, '01.000.000/0001-90', 'limoeiro@coop.br', '(81) 3411-1011'),
('05.555.555/0012-01', 'Coop. Arcoverde', 'Mista', '2025-01-01', '2024-12-05', 'Feijão', 490, '01.000.000/0001-90', 'arcoverde@coop.br', '(81) 3411-1012'),
('05.555.555/0013-01', 'Coop. Petrolina', 'Produção', '2024-12-01', '2023-11-20', 'Milho', 590, '01.000.000/0001-90', 'petrolina@coop.br', '(81) 3411-1013'),
('05.555.555/0014-01', 'Coop. Carpina', 'Comercial', '2024-11-15', '2023-10-10', 'Feijão', 410, '01.000.000/0001-90', 'carpina@coop.br', '(81) 3411-1014'),
('05.555.555/0015-01', 'Coop. Palmares', 'Mista', '2024-10-01', '2023-09-01', 'Milho', 620, '01.000.000/0001-90', 'palmares@coop.br', '(81) 3411-1015'),
('05.555.555/0016-01', 'Coop. Pesqueira', 'Produção', '2024-09-20', '2023-08-15', 'Feijão', 460, '01.000.000/0001-90', 'pesqueira@coop.br', '(81) 3411-1016'),
('05.555.555/0017-01', 'Coop. Vicência', 'Comercial', '2024-08-10', '2023-07-01', 'Milho', 540, '01.000.000/0001-90', 'vicencia@coop.br', '(81) 3411-1017'),
('05.555.555/0018-01', 'Coop. São Bento', 'Mista', '2024-07-05', '2023-06-10', 'Feijão', 430, '01.000.000/0001-90', 'saobento@coop.br', '(81) 3411-1018'),
('05.555.555/0019-01', 'Coop. Afogados', 'Produção', '2024-06-01', '2023-05-20', 'Milho', 610, '01.000.000/0001-90', 'afogados@coop.br', '(81) 3411-1019'),
('05.555.555/0020-01', 'Coop. Salgueiro', 'Comercial', '2024-05-15', '2023-04-05', 'Feijão', 440, '01.000.000/0001-90', 'salgueiro@coop.br', '(81) 3411-1020');

-- 7. ENDERECO COOPERATIVAS
INSERT INTO `bancodadosipa`.`enderecocooperativas` (`CEP`, `UF`, `Bairro`, `Rua`, `Numero`, `Cidade`, `Complemento`, `Cooperativa_CNPJ`) VALUES
('55500-001', 'PE', 'Centro', 'Rua Principal A', 10, 'Caruaru', 'Galpão 1', '05.555.555/0001-01'),
('55500-002', 'PE', 'Distrito Industrial', 'Av. das Indústrias B', 20, 'Garanhuns', NULL, '05.555.555/0002-01'),
('55500-003', 'PE', 'Zona Rural', 'Estrada do Milho C', 30, 'Salgueiro', 'Fazenda X', '05.555.555/0003-01'),
('55500-004', 'PE', 'Centro', 'Rua Principal D', 40, 'Serra Talhada', 'Escritório', '05.555.555/0004-01'),
('55500-005', 'PE', 'Distrito Industrial', 'Av. das Indústrias E', 50, 'Petrolina', 'Armazém Y', '05.555.555/0005-01'),
('55500-006', 'PE', 'Zona Rural', 'Estrada do Feijão F', 60, 'Pesqueira', NULL, '05.555.555/0006-01'),
('55500-007', 'PE', 'Centro', 'Rua Principal G', 70, 'Arcoverde', 'Galpão 2', '05.555.555/0007-01'),
('55500-008', 'PE', 'Distrito Industrial', 'Av. das Indústrias H', 80, 'Limoeiro', 'Sede nova', '05.555.555/0008-01'),
('55500-009', 'PE', 'Zona Rural', 'Estrada do Milho I', 90, 'Bezerros', 'Fazenda W', '05.555.555/0009-01'),
('55500-010', 'PE', 'Centro', 'Rua Principal J', 100, 'Palmares', NULL, '05.555.555/0010-01'),
('55500-011', 'PE', 'Distrito Industrial', 'Av. das Indústrias K', 110, 'Carpina', 'Galpão 3', '05.555.555/0011-01'),
('55500-012', 'PE', 'Zona Rural', 'Estrada do Feijão L', 120, 'Afogados', 'Armazém Z', '05.555.555/0012-01'),
('55500-013', 'PE', 'Centro', 'Rua Principal M', 130, 'Vicência', 'Escritório', '05.555.555/0013-01'),
('55500-014', 'PE', 'Distrito Industrial', 'Av. das Indústrias N', 140, 'São Bento', NULL, '05.555.555/0014-01'),
('55500-015', 'PE', 'Zona Rural', 'Estrada do Milho O', 150, 'Carnaíba', 'Sede antiga', '05.555.555/0015-01'),
('55500-016', 'PE', 'Centro', 'Rua Principal P', 160, 'Jaboatão', 'Prédio A', '05.555.555/0016-01'),
('55500-017', 'PE', 'Distrito Industrial', 'Av. das Indústrias Q', 170, 'Olinda', 'Armazém B', '05.555.555/0017-01'),
('55500-018', 'PE', 'Zona Rural', 'Estrada do Feijão R', 180, 'Recife', 'Galpão C', '05.555.555/0018-01'),
('55500-019', 'PE', 'Centro', 'Rua Principal S', 190, 'Cabo', NULL, '05.555.555/0019-01'),
('55500-020', 'PE', 'Distrito Industrial', 'Av. das Indústrias T', 200, 'Igarassu', 'Sede D', '05.555.555/0020-01');

-- 8. AGRICULTORES
INSERT INTO `bancodadosipa`.`agricultores` (`CPF_CNPJ`, `Nome`, `Idade`, `TipoEntidade`, `Telefone`, `Email`, `DataCadastro`, `Status`, `Cooperativa_CNPJ`) VALUES
('123.456.789-01', 'João da Silva', 45, 'Pessoa Física', '(87) 99123-4501', 'joao.silva@exemplo.com', '2024-03-01', 'Ativo', '05.555.555/0001-01'),
('123.456.789-02', 'Maria dos Santos', 38, 'Pessoa Física', '(87) 99123-4502', 'maria.santos@exemplo.com', '2024-04-10', 'Ativo', '05.555.555/0002-01'),
('123.456.789-03', 'José Pereira', 52, 'Pessoa Física', '(87) 99123-4503', 'jose.pereira@exemplo.com', '2024-05-20', 'Inativo', '05.555.555/0003-01'),
('123.456.789-04', 'Ana Oliveira', 29, 'Pessoa Jurídica', '(87) 99123-4504', 'ana.oliveira@exemplo.com', '2024-06-15', 'Ativo', '05.555.555/0004-01'),
('123.456.789-05', 'Pedro Costa', 61, 'Pessoa Física', '(87) 99123-4505', 'pedro.costa@exemplo.com', '2024-07-01', 'Ativo', '05.555.555/0005-01'),
('123.456.789-06', 'Paulo Ricardo', 40, 'Pessoa Física', '(87) 99123-4506', 'paulo.ricardo@exemplo.com', '2024-08-05', 'Ativo', '05.555.555/0006-01'),
('123.456.789-07', 'Marta Lima', 35, 'Pessoa Jurídica', '(87) 99123-4507', 'marta.lima@exemplo.com', '2024-09-10', 'Inativo', '05.555.555/0007-01'),
('123.456.789-08', 'Carlos Souza', 55, 'Pessoa Física', '(87) 99123-4508', 'carlos.souza@exemplo.com', '2024-10-01', 'Ativo', '05.555.555/0008-01'),
('123.456.789-09', 'Fernanda Alves', 32, 'Pessoa Física', '(87) 99123-4509', 'fernanda.alves@exemplo.com', '2024-11-12', 'Ativo', '05.555.555/0009-01'),
('123.456.789-10', 'Roberto Gomes', 48, 'Pessoa Jurídica', '(87) 99123-4510', 'roberto.gomes@exemplo.com', '2024-12-05', 'Ativo', '05.555.555/0010-01'),
('123.456.789-11', 'Lúcia Ferreira', 50, 'Pessoa Física', '(87) 99123-4511', 'lucia.ferreira@exemplo.com', '2023-11-20', 'Inativo', '05.555.555/0011-01'),
('123.456.789-12', 'Antônio Rocha', 42, 'Pessoa Física', '(87) 99123-4512', 'antonio.rocha@exemplo.com', '2023-10-10', 'Ativo', '05.555.555/0012-01'),
('123.456.789-13', 'Sandra Mendes', 36, 'Pessoa Jurídica', '(87) 99123-4513', 'sandra.mendes@exemplo.com', '2023-09-01', 'Ativo', '05.555.555/0013-01'),
('123.456.789-14', 'Guilherme Lopes', 58, 'Pessoa Física', '(87) 99123-4514', 'guilherme.lopes@exemplo.com', '2023-08-15', 'Ativo', '05.555.555/0014-01'),
('123.456.789-15', 'Helena Dias', 30, 'Pessoa Física', '(87) 99123-4515', 'helena.dias@exemplo.com', '2023-07-01', 'Inativo', '05.555.555/0015-01'),
('123.456.789-16', 'Felipe Nunes', 44, 'Pessoa Jurídica', '(87) 99123-4516', 'felipe.nunes@exemplo.com', '2023-06-10', 'Ativo', '05.555.555/0016-01'),
('123.456.789-17', 'Viviane Castro', 51, 'Pessoa Física', '(87) 99123-4517', 'viviane.castro@exemplo.com', '2023-05-20', 'Ativo', '05.555.555/0017-01'),
('123.456.789-18', 'Rogério Mota', 39, 'Pessoa Física', '(87) 99123-4518', 'rogerio.mota@exemplo.com', '2023-04-05', 'Ativo', '05.555.555/0018-01'),
('123.456.789-19', 'Natália Sousa', 47, 'Pessoa Jurídica', '(87) 99123-4519', 'natalia.sousa@exemplo.com', '2023-03-15', 'Inativo', '05.555.555/0019-01'),
('123.456.789-20', 'Thiago Sales', 33, 'Pessoa Física', '(87) 99123-4520', 'thiago.sales@exemplo.com', '2023-02-01', 'Ativo', '05.555.555/0020-01');

-- 9. ENDERECO AGRICULTORES
INSERT INTO `bancodadosipa`.`enderecoagricultores` (`CEP`, `UF`, `Bairro`, `Rua`, `Numero`, `Cidade`, `Complemento`, `Agricultores_CPF_CNPJ`) VALUES
('55501-001', 'PE', 'Assentamento Esperança', 'Sítio 1', 10, 'Caruaru', NULL, '123.456.789-01'),
('55501-002', 'PE', 'Quilombo do Tambor', 'Sítio 2', 20, 'Garanhuns', 'Próximo à igreja', '123.456.789-02'),
('55501-003', 'PE', 'Comunidade Riacho Seco', 'Sítio 3', 30, 'Salgueiro', NULL, '123.456.789-03'),
('55501-004', 'PE', 'Povoado do Umbuzeiro', 'Sítio 4', 40, 'Serra Talhada', 'Casa amarela', '123.456.789-04'),
('55501-005', 'PE', 'Vale do Sol Poente', 'Sítio 5', 50, 'Petrolina', NULL, '123.456.789-05'),
('55501-006', 'PE', 'Sítios do Pé de Serra', 'Sítio 6', 60, 'Pesqueira', 'Ao lado do açude', '123.456.789-06'),
('55501-007', 'PE', 'Vila Nova da Colheita', 'Sítio 7', 70, 'Arcoverde', NULL, '123.456.789-07'),
('55501-008', 'PE', 'Recanto das Águas', 'Sítio 8', 80, 'Limoeiro', 'Galpão verde', '123.456.789-08'),
('55501-009', 'PE', 'Fazenda Bonita', 'Sítio 9', 90, 'Bezerros', NULL, '123.456.789-09'),
('55501-010', 'PE', 'Terra Fértil', 'Sítio 10', 100, 'Palmares', 'Em frente à escola', '123.456.789-10'),
('55501-011', 'PE', 'Baixa do Milho', 'Sítio 11', 110, 'Carpina', NULL, '123.456.789-11'),
('55501-012', 'PE', 'Morada dos Ventos', 'Sítio 12', 120, 'Afogados', 'Sítio do vovô', '123.456.789-12'),
('55501-013', 'PE', 'Chã de Alegria', 'Sítio 13', 130, 'Vicência', NULL, '123.456.789-13'),
('55501-014', 'PE', 'Caminho Novo', 'Sítio 14', 140, 'São Bento', 'Próximo à nascente', '123.456.789-14'),
('55501-015', 'PE', 'Agrovila Progresso', 'Sítio 15', 150, 'Carnaíba', NULL, '123.456.789-15'),
('55501-016', 'PE', 'Comunidade do Cajá', 'Sítio 16', 160, 'Jaboatão', 'Casa da fazenda', '123.456.789-16'),
('55501-017', 'PE', 'Setor Verde Olinda', 'Sítio 17', 170, 'Olinda', NULL, '123.456.789-17'),
('55501-018', 'PE', 'Horto do Capibaribe', 'Sítio 18', 180, 'Recife', 'Perto da estrada', '123.456.789-18'),
('55501-019', 'PE', 'Pomar do Cabo', 'Sítio 19', 190, 'Cabo', NULL, '123.456.789-19'),
('55501-020', 'PE', 'Estrada da Integração', 'Sítio 20', 200, 'Igarassu', 'Casa principal', '123.456.789-20');

-- 10. TRANSPORTESEMENTES
-- Note: idTransporte é auto-incremento.
INSERT INTO `bancodadosipa`.`transportesementes`
(`Transportadora_idTransportadora`, `Origem`, `DataEnvio`, `DataEntrega`, `Status`)
VALUES
(1, 'Armazém Raízes Forte', '2025-11-15', '2025-11-18', 'Em transporte'),
(2, 'Depósito Semente Viva', '2025-11-16', '2025-11-19', 'Entregue'),
(3, 'Galpão Colheita Farta', '2025-11-17', '2025-11-20', 'Em transporte'),
(4, 'Ponto Logístico Sertão', '2025-11-18', '2025-11-21', 'Entregue'),
(5, 'Estoque Central Agreste', '2025-11-19', '2025-11-22', 'Em transporte'),
(6, 'Armazém Ouro Verde', '2025-11-20', '2025-11-23', 'Entregue'),
(7, 'Depósito Sol Nascente', '2025-11-21', '2025-11-24', 'Em transporte'),
(8, 'Galpão Vento Sul', '2025-11-22', '2025-11-25', 'Entregue'),
(9, 'Ponto Rota Agro', '2025-11-23', '2025-11-26', 'Em transporte'),
(10, 'Estoque Nordestino', '2025-11-24', '2025-11-27', 'Entregue'),
(11, 'Armazém da Palma', '2025-11-25', '2025-11-28', 'Em transporte'),
(12, 'Depósito Canaã', '2025-11-26', '2025-11-29', 'Entregue'),
(13, 'Galpão Fartura PE', '2025-11-27', '2025-11-30', 'Em transporte'),
(14, 'Ponto de Distribuição A', '2025-11-28', '2025-12-01', 'Entregue'),
(15, 'Estoque Principal B', '2025-11-29', '2025-12-02', 'Em transporte'),
(16, 'Armazém Produtor', '2025-11-30', '2025-12-03', 'Entregue'),
(17, 'Depósito C Marítimo', '2025-12-01', '2025-12-04', 'Em transporte'),
(18, 'Galpão da Capital', '2025-12-02', '2025-12-05', 'Entregue'),
(19, 'Ponto Central Z', '2025-12-03', '2025-12-06', 'Em transporte'),
(20, 'Estoque Final', '2025-12-04', '2025-12-07', 'Entregue');


-- 11. AGRICULTORES HAS TRANSPORTES
INSERT INTO `bancodadosipa`.`agricultores_has_transportes` (`Agricultores_CPF_CNPJ`, `Transporte_idTransporte`) VALUES
('123.456.789-01', 1), ('123.456.789-02', 2), ('123.456.789-03', 3), ('123.456.789-04', 4),
('123.456.789-05', 5), ('123.456.789-06', 6), ('123.456.789-07', 7), ('123.456.789-08', 8),
('123.456.789-09', 9), ('123.456.789-10', 10), ('123.456.789-11', 11), ('123.456.789-12', 12),
('123.456.789-13', 13), ('123.456.789-14', 14), ('123.456.789-15', 15), ('123.456.789-16', 16),
('123.456.789-17', 17), ('123.456.789-18', 18), ('123.456.789-19', 19), ('123.456.789-20', 20);

-- 12. AGRICULTORES HAS PRODUCAO SEMENTES
INSERT INTO `bancodadosipa`.`agricultores_has_producaosementes` (`Agricultores_CPF_CNPJ`, `ProducaoSementes_idProducaoSementes`) VALUES
('123.456.789-01', 1), ('123.456.789-02', 2), ('123.456.789-03', 3), ('123.456.789-04', 4),
('123.456.789-05', 5), ('123.456.789-06', 6), ('123.456.789-07', 7), ('123.456.789-08', 8),
('123.456.789-09', 9), ('123.456.789-10', 10), ('123.456.789-11', 11), ('123.456.789-12', 12),
('123.456.789-13', 13), ('123.456.789-14', 14), ('123.456.789-15', 15), ('123.456.789-16', 16),
('123.456.789-17', 17), ('123.456.789-18', 18), ('123.456.789-19', 19), ('123.456.789-20', 20);

-- 13. COOPERATIVA HAS TRANSPORTES
INSERT INTO `bancodadosipa`.`cooperativa_has_transportes` (`Cooperativa_CNPJ`, `Transporte_idTransporte`) VALUES
('05.555.555/0001-01', 1), ('05.555.555/0002-01', 2), ('05.555.555/0003-01', 3), ('05.555.555/0004-01', 4),
('05.555.555/0005-01', 5), ('05.555.555/0006-01', 6), ('05.555.555/0007-01', 7), ('05.555.555/0008-01', 8),
('05.555.555/0009-01', 9), ('05.555.555/0010-01', 10), ('05.555.555/0011-01', 11), ('05.555.555/0012-01', 12),
('05.555.555/0013-01', 13), ('05.555.555/0014-01', 14), ('05.555.555/0015-01', 15), ('05.555.555/0016-01', 16),
('05.555.555/0017-01', 17), ('05.555.555/0018-01', 18), ('05.555.555/0019-01', 19), ('05.555.555/0020-01', 20);