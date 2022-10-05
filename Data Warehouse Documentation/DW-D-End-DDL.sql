CREATE TABLE Dim_Cliente (
    cli_id int IDENTITY(1, 1),
    cli_id_ori varchar(250),
    cli_nome varchar(250),
    cli_data_nascimento varchar(30),
    cli_qtd_dependente int,
    cli_marca_otica bigint,
    cli_marca_otica_odonto bigint,
    cli_situacao varchar(50),
    cli_data_cancelamento varchar(30),
    cli_data_situacao varchar(30),
    cli_cod_contrato numeric(8,2),
    CONSTRAINT Dim_Cliente_pk PRIMARY KEY  (cli_id)
);

CREATE TABLE Dim_Convenio (
    con_id int IDENTITY(1, 1),
    con_codigo bigint,
    con_nome varchar(250),
    con_data_suspensao varchar(30),
    CONSTRAINT Dim_Convenio_pk PRIMARY KEY  (con_id)
);

CREATE TABLE Dim_Plano (
    pln_id int IDENTITY(1, 1),
    pln_codigo varchar(50),
    pln_nome varchar(250),
    pln_operadora varchar(250),
    pln_ini_vigencia varchar(30),
    CONSTRAINT Dim_Plano_pk PRIMARY KEY  (pln_id)
);

CREATE TABLE Dim_Repasse (
    rep_id int IDENTITY(1, 1),
    rep_saude_orig numeric(8,2),
    rep_saude_net_orig numeric(8,2),
    rep_competencia varchar(30),
    rep_data_geracao varchar(30),
    CONSTRAINT Dim_Repasse_pk PRIMARY KEY  (rep_id)
);

CREATE TABLE Fato_Medical (
    Dim_Cliente_cli_id int,
    Dim_Plano_pln_id int,
    Dim_Repasse_rep_id int,
    Dim_Convenio_con_id int,
    CONSTRAINT Fato_Medical_pk PRIMARY KEY  (Dim_Cliente_cli_id,Dim_Plano_pln_id,Dim_Repasse_rep_id,Dim_Convenio_con_id)
);

ALTER TABLE Fato_Medical ADD CONSTRAINT fk_cliente_medical_cli_id
    FOREIGN KEY (Dim_Cliente_cli_id)
    REFERENCES Dim_Cliente (cli_id);

ALTER TABLE Fato_Medical ADD CONSTRAINT fk_convenio_medical_con_id
    FOREIGN KEY (Dim_Convenio_con_id)
    REFERENCES Dim_Convenio (con_id);

ALTER TABLE Fato_Medical ADD CONSTRAINT fk_plano_medical_pln_id
    FOREIGN KEY (Dim_Plano_pln_id)
    REFERENCES Dim_Plano (pln_id);

ALTER TABLE Fato_Medical ADD CONSTRAINT fk_repasse_medical_rep_id
    FOREIGN KEY (Dim_Repasse_rep_id)
    REFERENCES Dim_Repasse (rep_id);


