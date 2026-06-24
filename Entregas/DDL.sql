CREATE TABLE cliente (
id_cliente int AUTO_INCREMENT PRIMARY KEY,
cpf varchar(14) NOT NULL UNIQUE,
nome varchar(100) NOT NULL,
dt_nasc date NOT NULL,
telefone varchar(20) NOT NULL,
email varchar(100) NOT NULL
);

CREATE TABLE pais (
id_pais int AUTO_INCREMENT PRIMARY KEY,
nome varchar(30) NOT NULL
);

CREATE TABLE estado (
id_estado int AUTO_INCREMENT PRIMARY KEY,
uf char(2) UNIQUE NOT NULL,
id_pais int NOT NULL,
FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE cidade(
id_cidade int AUTO_INCREMENT PRIMARY KEY,
nome varchar(30) NOT NULL,
id_estado int NOT NULL,
FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE cep(
id_cep varchar(8) PRIMARY KEY,
id_cidade int NOT NULL,
FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

CREATE TABLE endereco(
id_endereco int AUTO_INCREMENT PRIMARY KEY,
bairro varchar(100) NOT NULL,
rua varchar(100) NOT NULL,
numero_end int NOT NULL,
obs varchar(100),
id_cep varchar(8) NOT NULL,
FOREIGN KEY(id_cep) REFERENCES cep(id_cep)
);

CREATE TABLE cliente_endereco(
id_cli_end int AUTO_INCREMENT PRIMARY KEY,
apelido varchar(100),
id_cliente int NOT NULL,
id_endereco int NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);

CREATE TABLE papel_participante(
id_papel int AUTO_INCREMENT PRIMARY KEY,
descr varchar (100) NOT NULL
);

CREATE TABLE status_emprestimo(
id_st_emprestimo int AUTO_INCREMENT PRIMARY KEY,
descr varchar(100) NOT NULL
);

CREATE TABLE tipo_emprestimo(
id_tp_emp int AUTO_INCREMENT PRIMARY KEY,
descr varchar(100) NOT NULL
);

CREATE TABLE emprestimo(
id_emprestimo int AUTO_INCREMENT PRIMARY KEY,
prazo int NOT NULL,
valor_solicitado float NOT NULL,
dt_solicitacao date NOT NULL,
taxa_juros float NOT NULL,
id_st_emprestimo int NOT NULL,
id_tp_emp int NOT NULL,
obs varchar(100),
FOREIGN KEY (id_st_emprestimo) REFERENCES status_emprestimo (id_st_emprestimo),
FOREIGN KEY (id_tp_emp) REFERENCES tipo_emprestimo (id_tp_emp)
);

CREATE TABLE participante_emprestimo(
id_participante_emp int AUTO_INCREMENT PRIMARY KEY,
id_papel int NOT NULL,
id_cliente int NOT NULL,
id_emprestimo int NOT NULL,
FOREIGN KEY (id_papel) REFERENCES papel_participante(id_papel),
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo)
);

CREATE TABLE contrato(
id_contrato int AUTO_INCREMENT PRIMARY KEY,
dt_inicio date NOT NULL,
dt_termino date NOT NULL,
valor_financiado float NOT NULL,
valor_pago float NOT NULL,
id_emprestimo INT NOT NULL,
FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo)
);

CREATE TABLE status_parcela(
id_st_parcela int AUTO_INCREMENT PRIMARY KEY,
descr varchar(100) NOT NULL
);

CREATE TABLE parcela(
id_parcela int AUTO_INCREMENT PRIMARY KEY,
numero int NOT NULL,
dt_venc date NOT NULL,
valor_parcela float NOT NULL,
valor_pago float NOT NULL,
id_contrato int NOT NULL,
id_st_parcela int NOT NULL,
FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato),
FOREIGN KEY (id_st_parcela) REFERENCES status_parcela(id_st_parcela)
);

CREATE TABLE pagamento(
id_pagamento int AUTO_INCREMENT PRIMARY KEY,
dt_pagamento date NOT NULL,
valor_pago float NOT NULL,
id_parcela int NOT NULL,
FOREIGN KEY (id_parcela) REFERENCES parcela(id_parcela)
);
