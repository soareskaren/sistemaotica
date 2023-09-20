CREATE TABLE IF NOT EXISTS banco ( 
  id INT NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(10) DEFAULT null,
  nome VARCHAR(100) DEFAULT null,
  url VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS empresa ( 
  id INT NOT NULL AUTO_INCREMENT,
  razao_social VARCHAR(150) DEFAULT null,
  nome_fantasia VARCHAR(150) DEFAULT null,
  cnpj VARCHAR(18) DEFAULT null,
  inscricao_estadual VARCHAR(45) DEFAULT null,
  inscricao_municipal VARCHAR(45) DEFAULT null,
  tipo_regime CHAR(1) DEFAULT null,
  crt CHAR(1) DEFAULT null,
  email VARCHAR(250) DEFAULT null,
  site VARCHAR(250) DEFAULT null,
  contato VARCHAR(100) DEFAULT null,
  data_constituicao DATE DEFAULT null,
  codigo_ibge_cidade INT DEFAULT null,
  codigo_ibge_uf INT DEFAULT null,
  cei VARCHAR(12) DEFAULT null,
  codigo_cnae_principal VARCHAR(7) DEFAULT null,
  imagem_logotipo BLOB,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS estado_civil ( 
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) DEFAULT null,
  descricao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS forma_pagamento ( 
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS nivel_formacao ( 
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) DEFAULT null,
  descricao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pessoa ( 
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(150) DEFAULT null,
  tipo CHAR(1) DEFAULT null,
  site VARCHAR(250) DEFAULT null,
  email VARCHAR(250) DEFAULT null,
  eh_cliente CHAR(1) DEFAULT null,
  eh_fornecedor CHAR(1) DEFAULT null,
  referencia VARCHAR(100) DEFAULT null,
  observacao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS produto_marca ( 
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) DEFAULT null,
  descricao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS produto_unidade ( 
  id INT NOT NULL AUTO_INCREMENT,
  sigla VARCHAR(10) DEFAULT null,
  descricao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS talao ( 
  id INT NOT NULL AUTO_INCREMENT,
  ano VARCHAR(4) DEFAULT null,
  sequencia INT DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS usuario ( 
  id INT NOT NULL AUTO_INCREMENT,
  login VARCHAR(50) DEFAULT null,
  senha VARCHAR(50) DEFAULT null,
  nome VARCHAR(100) DEFAULT null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS atendimento ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  talao INT DEFAULT null,
  data_atendimento DATE DEFAULT null,
  data_retorno DATE DEFAULT null,
  valor_esferico_od DECIMAL(10,2) DEFAULT null,
  valor_esferico_oe DECIMAL(10,2) DEFAULT null,
  valor_cilindrico_od INT DEFAULT null,
  valor_cilindrico_oe INT DEFAULT null,
  posicao_eixo_od INT DEFAULT null,
  posicao_eixo_oe INT DEFAULT null,
  distancia_naso_pupilar_od DECIMAL(10,2) DEFAULT null,
  distancia_naso_pupilar_oe DECIMAL(10,2) DEFAULT null,
  acuidade_visual_longe_od VARCHAR(6) DEFAULT null,
  acuidade_visual_longe_oe VARCHAR(6) DEFAULT null,
  adicao DECIMAL(10,2) DEFAULT null,
  acuidade_visual_perto_od CHAR(2) DEFAULT null,
  acuidade_visual_perto_oe CHAR(2) DEFAULT null,
  examinador VARCHAR(100) DEFAULT null,
  observacao VARCHAR(500) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_atendimento_pessoa (id_pessoa ASC),
CONSTRAINT fk_atendimento_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS banco_agencia ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_banco INT NOT NULL,
  numero VARCHAR(20) DEFAULT null,
  digito CHAR(1) DEFAULT null,
  nome VARCHAR(100) DEFAULT null,
  telefone VARCHAR(15) DEFAULT null,
  contato VARCHAR(100) DEFAULT null,
  gerente VARCHAR(100) DEFAULT null,
  observacao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_banco_agencia_banco (id_banco ASC),
CONSTRAINT fk_banco_agencia_banco
  FOREIGN KEY (id_banco)
  REFERENCES banco (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS cliente ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  desde DATE DEFAULT null,
  taxa_desconto DECIMAL(18,6) DEFAULT null,
  limite_credito DECIMAL(18,6) DEFAULT null,
  ocupacao VARCHAR(100) DEFAULT null,
  observacao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_cliente_pessoa (id_pessoa ASC),
CONSTRAINT fk_cliente_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS fornecedor ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  desde DATE DEFAULT null,
  observacao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_fornecedor_pessoa (id_pessoa ASC),
CONSTRAINT fk_fornecedor_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pessoa_contato ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  nome VARCHAR(150) DEFAULT null,
  email VARCHAR(250) DEFAULT null,
  observacao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_pessoa_contato_pessoa (id_pessoa ASC),
CONSTRAINT fk_pessoa_contato_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pessoa_endereco ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  logradouro VARCHAR(100) DEFAULT null,
  numero VARCHAR(10) DEFAULT null,
  bairro VARCHAR(100) DEFAULT null,
  cidade VARCHAR(100) DEFAULT null,
  uf CHAR(2) DEFAULT null,
  cep VARCHAR(10) DEFAULT null,
  complemento VARCHAR(100) DEFAULT null,
  principal CHAR(1) DEFAULT null,
  entrega CHAR(1) DEFAULT null,
  cobranca CHAR(1) DEFAULT null,
  correspondencia CHAR(1) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_pessoa_endereco_pessoa (id_pessoa ASC),
CONSTRAINT fk_pessoa_endereco_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pessoa_juridica ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  cnpj VARCHAR(18) DEFAULT null,
  nome_fantasia VARCHAR(100) DEFAULT null,
  inscricao_estadual VARCHAR(45) DEFAULT null,
  inscricao_municipal VARCHAR(45) DEFAULT null,
  data_constituicao DATE DEFAULT null,
  tipo_regime CHAR(1) DEFAULT null,
  crt CHAR(1) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_pessoa_juridica_pessoa (id_pessoa ASC),
CONSTRAINT fk_pessoa_juridica_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pessoa_telefone ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  tipo CHAR(1) DEFAULT null,
  numero VARCHAR(15) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_pessoa_telefone_pessoa (id_pessoa ASC),
CONSTRAINT fk_pessoa_telefone_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS venda_cabecalho ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  codigo INT DEFAULT null,
  data_venda DATE DEFAULT null,
  valor_subtotal DECIMAL(10,2) DEFAULT null,
  valor_desconto DECIMAL(10,2) DEFAULT null,
  valor_total DECIMAL(10,2) DEFAULT null,
  quantidade_parcelas INT DEFAULT null,
  primeiro_vencimento DATE DEFAULT null,
  data_prevista_entrega DATE DEFAULT null,
  data_entrega DATE DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_venda_cabecalho_pessoa (id_pessoa ASC),
CONSTRAINT fk_venda_cabecalho_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS banco_conta_caixa ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_banco_agencia INT NOT NULL,
  numero VARCHAR(20) DEFAULT null,
  digito CHAR(1) DEFAULT null,
  tipo CHAR(1) DEFAULT null,
  nome VARCHAR(100) DEFAULT null,
  descricao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_banco_conta_caixa_banco_agencia (id_banco_agencia ASC),
CONSTRAINT fk_banco_conta_caixa_banco_agencia
  FOREIGN KEY (id_banco_agencia)
  REFERENCES banco_agencia (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS pessoa_fisica ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  id_nivel_formacao INT DEFAULT null,
  id_estado_civil INT DEFAULT null,
  data_nascimento DATE DEFAULT null,
  cpf VARCHAR(11) DEFAULT null,
  rg VARCHAR(20) DEFAULT null,
  orgao_rg VARCHAR(20) DEFAULT null,
  data_emissao_rg DATE DEFAULT null,
  sexo CHAR(1) DEFAULT null,
  raca CHAR(1) DEFAULT null,
  nacionalidade VARCHAR(100) DEFAULT null,
  naturalidade VARCHAR(100) DEFAULT null,
  nome_pai VARCHAR(200) DEFAULT null,
  nome_mae VARCHAR(200) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_pessoa_fisica_pessoa (id_pessoa ASC),
INDEX fk_pessoa_fisica_nivel_formacao (id_nivel_formacao ASC),
INDEX fk_pessoa_fisica_estado_civil (id_estado_civil ASC),
CONSTRAINT fk_pessoa_fisica_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id),
CONSTRAINT fk_pessoa_fisica_nivel_formacao
  FOREIGN KEY (id_nivel_formacao)
  REFERENCES nivel_formacao (id),
CONSTRAINT fk_pessoa_fisica_estado_civil
  FOREIGN KEY (id_estado_civil)
  REFERENCES estado_civil (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS produto ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_produto_marca INT NOT NULL,
  id_produto_unidade INT NOT NULL,
  nome VARCHAR(100) DEFAULT null,
  data_cadastro DATE DEFAULT null,
  descricao VARCHAR(250) DEFAULT null,
  gtin VARCHAR(14) DEFAULT null,
  codigo_interno VARCHAR(50) DEFAULT null,
  valor_compra DECIMAL(18,6) DEFAULT null,
  valor_venda DECIMAL(18,6) DEFAULT null,
  codigo_ncm VARCHAR(8) DEFAULT null,
  estoque_minimo DECIMAL(18,6) DEFAULT null,
  estoque_maximo DECIMAL(18,6) DEFAULT null,
  quantidade_estoque DECIMAL(18,6) DEFAULT null,
  id_pessoa INT NOT NULL COMMENT 'fornecedor',
  PRIMARY KEY (id),
INDEX fk_produto_produto_marca (id_produto_marca ASC),
INDEX fk_produto_produto_unidade (id_produto_unidade ASC),
INDEX fk_produto_pessoa (id_pessoa ASC),
CONSTRAINT fk_produto_produto_marca
  FOREIGN KEY (id_produto_marca)
  REFERENCES produto_marca (id),
CONSTRAINT fk_produto_produto_unidade
  FOREIGN KEY (id_produto_unidade)
  REFERENCES produto_unidade (id),
CONSTRAINT fk_produto_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS venda_detalhe ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_venda_cabecalho INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT DEFAULT null,
  valor_unitario DECIMAL(10,2) DEFAULT null,
  taxa_desconto DECIMAL(10,2) DEFAULT null,
  valor_desconto DECIMAL(10,2) DEFAULT null,
  valor_total DECIMAL(10,2) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_venda_detalhe_venda_cabecalho (id_venda_cabecalho ASC),
INDEX fk_venda_detalhe_produto (id_produto ASC),
CONSTRAINT fk_venda_detalhe_venda_cabecalho
  FOREIGN KEY (id_venda_cabecalho)
  REFERENCES venda_cabecalho (id),
CONSTRAINT fk_venda_detalhe_produto
  FOREIGN KEY (id_produto)
  REFERENCES produto (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS contas_pagar ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  id_forma_pagamento INT NOT NULL,
  id_banco_conta_caixa INT NOT NULL,
  data_lancamento DATE DEFAULT null,
  valor_total DECIMAL(10,2) DEFAULT null,
  numero_parcela INT DEFAULT null,
  valor_parcela DECIMAL(10,2) DEFAULT null,
  data_vencimento DATE DEFAULT null,
  data_recebimento DATE DEFAULT null,
  valor_recebido DECIMAL(10,2) DEFAULT null,
  observacao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_contas_pagar_pessoa (id_pessoa ASC),
INDEX fk_contas_pagar_forma_pagamento (id_forma_pagamento ASC),
INDEX fk_contas_pagar_banco_conta_caixa (id_banco_conta_caixa ASC),
CONSTRAINT fk_contas_pagar_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id),
CONSTRAINT fk_contas_pagar_forma_pagamento
  FOREIGN KEY (id_forma_pagamento)
  REFERENCES forma_pagamento (id),
CONSTRAINT fk_contas_pagar_banco_conta_caixa
  FOREIGN KEY (id_banco_conta_caixa)
  REFERENCES banco_conta_caixa (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS contas_receber ( 
  id INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  id_forma_pagamento INT NOT NULL,
  id_venda_cabecalho INT DEFAULT null,
  id_banco_conta_caixa INT DEFAULT null,
  data_lancamento DATE DEFAULT null,
  valor_total DECIMAL(10,2) DEFAULT null,
  numero_parcela INT DEFAULT null,
  valor_parcela DECIMAL(10,2) DEFAULT null,
  data_vencimento DATE DEFAULT null,
  data_recebimento DATE DEFAULT null,
  valor_recebido DECIMAL(10,2) DEFAULT null,
  observacao VARCHAR(250) DEFAULT null,
  PRIMARY KEY (id),
INDEX fk_contas_receber_pessoa (id_pessoa ASC),
INDEX fk_contas_receber_forma_pagamento (id_forma_pagamento ASC),
INDEX fk_contas_receber_venda_cabecalho (id_venda_cabecalho ASC),
INDEX fk_contas_receber_banco_conta_caixa (id_banco_conta_caixa ASC),
CONSTRAINT fk_contas_receber_pessoa
  FOREIGN KEY (id_pessoa)
  REFERENCES pessoa (id),
CONSTRAINT fk_contas_receber_forma_pagamento
  FOREIGN KEY (id_forma_pagamento)
  REFERENCES forma_pagamento (id),
CONSTRAINT fk_contas_receber_venda_cabecalho
  FOREIGN KEY (id_venda_cabecalho)
  REFERENCES venda_cabecalho (id),
CONSTRAINT fk_contas_receber_banco_conta_caixa
  FOREIGN KEY (id_banco_conta_caixa)
  REFERENCES banco_conta_caixa (id))
ENGINE = InnoDB;

