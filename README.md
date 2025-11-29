📄 README do Banco de Dados IPA - Gestão de Sementes
Este repositório contém o script de criação e o modelo lógico de um banco de dados relacional projetado para gerenciar a distribuição de sementes e o monitoramento das atividades de Agricultores e Cooperativas em colaboração com o IPA (Instituto Agronômico de Pernambuco).

🎯 Objetivo
O principal objetivo deste banco de dados é fornecer uma plataforma estruturada para:

Rastrear a produção, estoque e distribuição de sementes.

Monitorar as informações cadastrais dos agricultores, cooperativas e unidades do IPA.

Controlar o fluxo de entrada e saída de sementes (transporte e produção).

Garantir a integridade dos dados através de chaves primárias/estrangeiras e regras de negócio (Triggers).

🏗️ Estrutura do Banco de Dados
O banco de dados, denominado bancodadosipa, é composto por 12 tabelas principais, interligadas por relacionamentos que cobrem as principais entidades e processos do sistema.

📜 Entidades Principais
Tabela,Descrição,Chave Principal
agricultores,Dados cadastrais e status (Ativo/Inativo) dos agricultores.,CPF_CNPJ
cooperativa,Dados cadastrais das cooperativas filiadas ao IPA.,CNPJ
ipa,Informações sobre as unidades do Instituto Agronômico de Pernambuco.,CNPJIPA
producaosementes,"Registro das sementes produzidas, incluindo tipo, preço e validade.",idProducaoSementes
transportadora,Cadastro das empresas responsáveis pelo transporte das sementes.,idTransportadora
transportesementes,"Detalhes de cada remessa de transporte (data, status, etc.).",idTransporte

🔗 Tabelas de Relacionamento (Muitos-para-Muitos)
agricultores_has_producaosementes (Agricultor ↔ Produção)

agricultores_has_transportes (Agricultor ↔ Transporte)

cooperativa_has_transportes (Cooperativa ↔ Transporte)

🛠️ Regras de Negócio e Triggers
O banco de dados implementa uma regra de integridade crítica usando um Trigger (Gatilho) para proteger contra grandes variações de preço.

⚙️ Scripts e Uso
1. Script SQL
O script principal (script_bancodadosipa.sql) contém:

Criação do Schema (USE bancodadosipa;).

Criação de todas as 12 tabelas.

Criação do Trigger (tg_before_update_producao).

Comandos INSERT para popular as tabelas com dados de teste.

Comandos SELECT avançados (com subqueries) para consultas de teste.

Grupo:
Ian

Sabrina 

Daniel Cabral

Marcelo Bezerra

Marcelo Martins

Otávio Augusto
