/* modelo fisico: */
CREATE TABLE Evento (
    nome varchar(255),
    publico_alvo varchar(255),
    numEdicao varchar(255),
    data date,
    tema varchar(255),
    descricao varchar(255),
    id int PRIMARY KEY
);
CREATE TABLE Entidade (
    nome varchar(255),
    tipoEntidade varchar(255),
    rua varchar(255),
    cidade varchar(255),
    estado varchar(255),
    numero varchar(255),
    cep varchar(255),
    complemento varchar(255),
    contato varchar(255),
    id int PRIMARY KEY,
    fk_Evento_id integer,
    fk_Evento_id_ integer
);
CREATE TABLE Atividades (
    data date,
    horario time,
    duracao time,
    publico_alvo varchar(255),
    valor_inscriacao float,
    promotor varchar(255),
    lotacao integer,
    id integer PRIMARY KEY,
    nome varchar(255),
    tema varchar(255),
    afiliacao varchar(255),
    minicurriculo varchar(255),
    objetivo varchar(255),
    nivel varchar(255),
    nome_sessao varchar(255),
    fk_regras_regras_PK integer,
    fk_premiacao_premiacao_PK integer,
    tipo varchar(255),
    numero_sessao varchar(255),
    Atividades_TIPO varchar(255),
    fk_Evento_id integer,
    fk_Sala_id integer
);
CREATE TABLE Desconto (
    valor float,
    regras varchar(255),
    id integer PRIMARY KEY
);
CREATE TABLE Tipo_de_ingresso (
    nome varchar(255),
    descricao varchar(255),
    valor_base float,
    id integer PRIMARY KEY
);
CREATE TABLE Pessoa (
    nome varchar(255),
    documento varchar(255),
    telefone varchar(255),
    email varchar(255),
    id integer PRIMARY KEY
);
CREATE TABLE Certificado_Funcao (
    id integer PRIMARY KEY,
    descricao varchar(255),
    data_de_emissao date,
    nome varchar(255)
);
CREATE TABLE Responsavel (
    nome varchar(255),
    telefone varchar(255),
    email varchar(255),
    id integer PRIMARY KEY,
    fk_Entidade_id integer
);
CREATE TABLE Artigo (
    nome varchar(255),
    resumo text,
    autoria varchar(255),
    data_de_publicacao date,
    id integer PRIMARY KEY
);
CREATE TABLE Sala (
    nome varchar(255),
    descricao varchar(255),
    capaciadade integer,
    id integer PRIMARY KEY,
    fk_Local_id integer
);
CREATE TABLE Saida_de_dinheiro_Local (
    valor float,
    descricao varchar(255),
    data date,
    tipo varchar(255),
    id integer PRIMARY KEY,
    rua varchar(255),
    cidade varchar(255),
    estado varchar(255),
    cep varchar(255),
    numero varchar(255),
    complemento varchar(255),
    valor_locacao float,
    fk_Evento_id integer,
    fk_Pessoa_id integer
);
CREATE TABLE Loja (
    nome varchar(255),
    descricao varchar(255),
    id integer PRIMARY KEY,
    fk_Sala_id integer
);
CREATE TABLE Produtos (
    nome varchar(255),
    quantidade integer,
    descricao varchar(255),
    preco float,
    id integer PRIMARY KEY,
    fk_Saida_de_dinheiro_Local_id integer,
    fk_Loja_id integer,
    fk_Venda_Participante_Ingresso_Entrada_de_dinheiro_id integer
);
CREATE TABLE Venda_Participante_Ingresso_Entrada_de_dinheiro (
    data date,
    valor_total float,
    id integer PRIMARY KEY,
    fk_Loja_id integer,
    nome varchar(255),
    telefone varchar(255),
    email varchar(255),
    estado varchar(255),
    rua varchar(255),
    cidade varchar(255),
    cep varchar(255),
    numero varchar(255),
    complemento varchar(255),
    fk_cargos_cargos_PK integer,
    fk_Evento_id integer,
    data_de_compra date,
    fk_Tipo_de_ingresso_id integer,
    valor float,
    descricao varchar(255),
    tipo varchar(255)
);
CREATE TABLE regras (
    regras_PK integer NOT NULL PRIMARY KEY,
    regras varchar(255)
);
CREATE TABLE premiacao (
    premiacao_PK integer NOT NULL PRIMARY KEY,
    premiacao varchar(255)
);
CREATE TABLE cargos (
    cargos_PK integer NOT NULL PRIMARY KEY,
    cargos integer
);
CREATE TABLE Patrocina_Entidade_Evento_Entrada_de_dinheiro (
    fk_Entidade_id integer,
    fk_Evento_id integer,
    fk_Entrada_de_dinheiro_id integer
);
CREATE TABLE Possui (
    fk_Desconto_id integer,
    fk_Participante_Ingresso_Entrada_de_dinheiro_id integer
);
CREATE TABLE Exerce (
    fk_Funcao_id integer,
    fk_Pessoa_id integer
);
CREATE TABLE Ganha (
    fk_Pessoa_id integer,
    fk_Certificado_Funcao_id integer
);
CREATE TABLE Trabalha (
    fk_Atividades_id integer,
    fk_Pessoa_id integer
);
CREATE TABLE Atende (
    fk_Atividades_id integer,
    fk_Participante_Ingresso_Entrada_de_dinheiro_id integer
);
CREATE TABLE Promove (
    fk_Entidade_id integer,
    fk_Atividades_id integer
);
CREATE TABLE Apresentado (
    fk_Artigo_id integer,
    fk_Atividades_id integer
);
CREATE TABLE Paga (
    fk_Participante_Ingresso_Entrada_de_dinheiro_id integer,
    fk_Venda_Participante_Ingresso_Entrada_de_dinheiro_id integer
);
ALTER TABLE Entidade
ADD CONSTRAINT FK_Entidade_2 FOREIGN KEY (fk_Evento_id, fk_Evento_id_) REFERENCES Evento (id, id) ON DELETE RESTRICT;
ALTER TABLE Atividades
ADD CONSTRAINT FK_Atividades_2 FOREIGN KEY (fk_regras_regras_PK) REFERENCES regras (regras_PK);
ALTER TABLE Atividades
ADD CONSTRAINT FK_Atividades_3 FOREIGN KEY (fk_premiacao_premiacao_PK) REFERENCES premiacao (premiacao_PK);
ALTER TABLE Atividades
ADD CONSTRAINT FK_Atividades_4 FOREIGN KEY (fk_Evento_id) REFERENCES Evento (id) ON DELETE RESTRICT;
ALTER TABLE Atividades
ADD CONSTRAINT FK_Atividades_5 FOREIGN KEY (fk_Sala_id) REFERENCES Sala (id) ON DELETE RESTRICT;
ALTER TABLE Responsavel
ADD CONSTRAINT FK_Responsavel_2 FOREIGN KEY (fk_Entidade_id) REFERENCES Entidade (id) ON DELETE RESTRICT;
ALTER TABLE Saida_de_dinheiro_Local
ADD CONSTRAINT FK_Saida_de_dinheiro_Local_2 FOREIGN KEY (fk_Evento_id) REFERENCES Evento (id);
ALTER TABLE Saida_de_dinheiro_Local
ADD CONSTRAINT FK_Saida_de_dinheiro_Local_3 FOREIGN KEY (fk_Pessoa_id) REFERENCES Pessoa (id) ON DELETE RESTRICT;
ALTER TABLE Loja
ADD CONSTRAINT FK_Loja_2 FOREIGN KEY (fk_Sala_id) REFERENCES Sala (id) ON DELETE RESTRICT;
ALTER TABLE Produtos
ADD CONSTRAINT FK_Produtos_2 FOREIGN KEY (fk_Saida_de_dinheiro_Local_id) REFERENCES Saida_de_dinheiro_Local (id) ON DELETE RESTRICT;
ALTER TABLE Produtos
ADD CONSTRAINT FK_Produtos_3 FOREIGN KEY (fk_Loja_id) REFERENCES Loja (id) ON DELETE RESTRICT;
ALTER TABLE Produtos
ADD CONSTRAINT FK_Produtos_4 FOREIGN KEY (
        fk_Venda_Participante_Ingresso_Entrada_de_dinheiro_id
    ) REFERENCES Venda_Participante_Ingresso_Entrada_de_dinheiro (id) ON DELETE RESTRICT;
ALTER TABLE Venda_Participante_Ingresso_Entrada_de_dinheiro
ADD CONSTRAINT FK_Venda_Participante_Ingresso_Entrada_de_dinheiro_2 FOREIGN KEY (fk_Loja_id) REFERENCES Loja (id) ON DELETE CASCADE;
ALTER TABLE Venda_Participante_Ingresso_Entrada_de_dinheiro
ADD CONSTRAINT FK_Venda_Participante_Ingresso_Entrada_de_dinheiro_3 FOREIGN KEY (fk_cargos_cargos_PK) REFERENCES cargos (cargos_PK);
ALTER TABLE Venda_Participante_Ingresso_Entrada_de_dinheiro
ADD CONSTRAINT FK_Venda_Participante_Ingresso_Entrada_de_dinheiro_4 FOREIGN KEY (fk_Evento_id) REFERENCES Evento (id);
ALTER TABLE Venda_Participante_Ingresso_Entrada_de_dinheiro
ADD CONSTRAINT FK_Venda_Participante_Ingresso_Entrada_de_dinheiro_5 FOREIGN KEY (fk_Tipo_de_ingresso_id) REFERENCES Tipo_de_ingresso (id);
ALTER TABLE Patrocina_Entidade_Evento_Entrada_de_dinheiro
ADD CONSTRAINT FK_Patrocina_Entidade_Evento_Entrada_de_dinheiro_1 FOREIGN KEY (fk_Entidade_id) REFERENCES Entidade (id) ON DELETE NO ACTION;
ALTER TABLE Patrocina_Entidade_Evento_Entrada_de_dinheiro
ADD CONSTRAINT FK_Patrocina_Entidade_Evento_Entrada_de_dinheiro_2 FOREIGN KEY (fk_Evento_id) REFERENCES Evento (id) ON DELETE RESTRICT;
ALTER TABLE Possui
ADD CONSTRAINT FK_Possui_1 FOREIGN KEY (fk_Desconto_id) REFERENCES Desconto (id) ON DELETE RESTRICT;
ALTER TABLE Exerce
ADD CONSTRAINT FK_Exerce_2 FOREIGN KEY (fk_Pessoa_id) REFERENCES Pessoa (id) ON DELETE
SET NULL;
ALTER TABLE Ganha
ADD CONSTRAINT FK_Ganha_1 FOREIGN KEY (fk_Pessoa_id) REFERENCES Pessoa (id) ON DELETE RESTRICT;
ALTER TABLE Ganha
ADD CONSTRAINT FK_Ganha_2 FOREIGN KEY (fk_Certificado_Funcao_id) REFERENCES Certificado_Funcao (id) ON DELETE
SET NULL;
ALTER TABLE Trabalha
ADD CONSTRAINT FK_Trabalha_1 FOREIGN KEY (fk_Atividades_id) REFERENCES Atividades (id) ON DELETE RESTRICT;
ALTER TABLE Trabalha
ADD CONSTRAINT FK_Trabalha_2 FOREIGN KEY (fk_Pessoa_id) REFERENCES Pessoa (id) ON DELETE RESTRICT;
ALTER TABLE Atende
ADD CONSTRAINT FK_Atende_1 FOREIGN KEY (fk_Atividades_id) REFERENCES Atividades (id) ON DELETE RESTRICT;
ALTER TABLE Promove
ADD CONSTRAINT FK_Promove_1 FOREIGN KEY (fk_Entidade_id) REFERENCES Entidade (id) ON DELETE RESTRICT;
ALTER TABLE Promove
ADD CONSTRAINT FK_Promove_2 FOREIGN KEY (fk_Atividades_id) REFERENCES Atividades (id) ON DELETE RESTRICT;
ALTER TABLE Apresentado
ADD CONSTRAINT FK_Apresentado_1 FOREIGN KEY (fk_Artigo_id) REFERENCES Artigo (id) ON DELETE RESTRICT;
ALTER TABLE Apresentado
ADD CONSTRAINT FK_Apresentado_2 FOREIGN KEY (fk_Atividades_id) REFERENCES Atividades (id) ON DELETE RESTRICT;
ALTER TABLE Paga
ADD CONSTRAINT FK_Paga_2 FOREIGN KEY (
        fk_Venda_Participante_Ingresso_Entrada_de_dinheiro_id
    ) REFERENCES Venda_Participante_Ingresso_Entrada_de_dinheiro (id) ON DELETE
SET NULL;
/*     Inserindo tuplas */
/*---------------------------*/
/*Inserindo na tabela Evento*/
/*---------------------------*/
/* #1 */
INSERT INTO Evento(
        nome,
        publico_alvo,
        numEdicao,
        data,
        tema,
        descricao,
        id
    )
VALUES (
        "Palestra sobre financiamento na ciencia ",
        "estudantes graduação",
        "segunda edição",
        VALUES(TO_DATE('17/12/2021', 'DD/MM/YYYY')),
        "questões administrativas",
        "Palestra sobre as formas de possiveis de financiamento em pesquisa cientifica",
        0
    );
/* #2 */
INSERT INTO Evento(
        nome,
        publico_alvo,
        numEdicao,
        data,
        tema,
        descricao,
        id
    )
VALUES (
        "Compo abordar metodo cientifico de forma didatica ",
        "estudantes pós graduação",
        "primeira edição",
        VALUES(TO_DATE('18/12/2021', 'DD/MM/YYYY')),
        "abordagem cientifica",
        "Palestra sobre didatica na abordagem do metodo cientifico",
        1
    );
/* #3 */
INSERT INTO Evento(
        nome,
        publico_alvo,
        numEdicao,
        data,
        tema,
        descricao,
        id
    )
VALUES (
        "Workshop ensino de biologia ",
        "estudantes graduação",
        "decima edição",
        VALUES(TO_DATE('18/12/2021', 'DD/MM/YYYY')),
        "abordagem cientifica",
        "Workshop sobre ensino de biologia",
        2
    );
/* #4 */
INSERT INTO Evento(
        nome,
        publico_alvo,
        numEdicao,
        data,
        tema,
        descricao,
        id
    )
VALUES (
        "Apresentação de bancas ",
        "estudantes pós graduação",
        "nona edição",
        VALUES(TO_DATE('18/12/2021', 'DD/MM/YYYY')),
        "Apresentação de artigos",
        "Apresentação das bancas",
        3
    );
/* #5 */
INSERT INTO Evento(
        nome,
        publico_alvo,
        numEdicao,
        data,
        tema,
        descricao,
        id
    )
VALUES (
        "Apresentação de bancas ",
        "estudantes pós graduação",
        "decima edição",
        VALUES(TO_DATE('18/13/2021', 'DD/MM/YYYY')),
        "Apresentação de artigos",
        "Apresentação das bancas",
        3
    );
/* ----------------------------- */
/* Inserindo na tabela Entidade  */
/* ----------------------------- */
/* #1 */
INSERT INTO Entidade(
        nome,
        tipoEntidade,
        rua,
        cidade,
        estado,
        numero,
        cep,
        complemento,
        contato,
        id,
        fk_Evento_id fk_Evento_id_
    )
VALUES (
        "CNPQ",
        "Governamental",
        "Rua Estrada",
        "Aparecida de Goiânia",
        "GO",
,
        "123" "74973-695",
        " ",
        0,
        1,
        2
    );
/* #2 */
INSERT INTO Entidade(
        nome,
        tipoEntidade,
        rua,
        cidade,
        estado,
        numero,
        cep,
        complemento,
        contato,
        id,
        fk_Evento_id fk_Evento_id_
    )
VALUES (
        "CNPQ",
        "Governamental",
        "Rua Capitão Pedroso",
        "Porto Alegre",
        "RS",
,
        "124" "91790-790",
        " ",
        1,
        2,
        1
    );
/* #3 */
INSERT INTO Entidade(
        nome,
        tipoEntidade,
        rua,
        cidade,
        estado,
        numero,
        cep,
        complemento,
        contato,
        id,
        fk_Evento_id fk_Evento_id_
    )
VALUES (
        "IFUSP",
        "Governamental",
        "Rua Francisco Virgílio de Vasconcelos",
        "Fortaleza",
        "CE",
,
        "124" "60165-060",
        "Apt 30",
        2,
        2,
        1
    );
/* #4 */
INSERT INTO Entidade(
        nome,
        tipoEntidade,
        rua,
        cidade,
        estado,
        numero,
        cep,
        complemento,
        contato,
        id,
        fk_Evento_id fk_Evento_id_
    )
VALUES (
        "Microsoft",
        "Privada",
        "Escadaria Eurico Pereira",
        "Vitória",
        "ES",
,
        "124" "29047-603",
        "Apt 55",
        3,
        2,
        1
    );
/* #5 */
INSERT INTO Entidade(
        nome,
        tipoEntidade,
        rua,
        cidade,
        estado,
        numero,
        cep,
        complemento,
        contato,
        id,
        fk_Evento_id fk_Evento_id_
    )
VALUES (
        "ITA",
        "Governamental",
        "Rua Augusto Pinto de Jesus",
        "Linhares",
        "ES",
,
        "124" "29915-075",
        "Apt 5",
        4,
        2,
        1
    );
/* ------------------------------ */
/* Inserindo na tabela Atividades */
/* ------------------------------ */
/* #1 */
INSERT INTO Atividades(
        data,
        horario,
        duracao,
        publico_alvo,
        valor_inscriacao,
        promotor,
        lotacao,
        id,
        nome,
        tema,
        afiliacao,
        minicurriculo,
        objetivo,
        nivel,
        nome_sessao,
        fk_regras_regras_PK,
        fk_premiacao_premiacao_PK,
        tipo,
        numero_sessao,
        Atividades_TIPO,
        fk_Evento_id,
        fk_Sala_id
    )
VALUES (
        VALUES(TO_DATE('22/11/2021', 'DD/MM/YYYY')),
            "13:00",
            "15:00",
            "Estudantes",
            0.0,
            "Alexandre Grichkov",
            100,
            0,
            "Calculo do pi",
            "IME" "Metodologias para o calculo do pi",
            "Alexandre Grichkov do IME",
            "Calcular o pi",
            "?????",
            "Atividade calculo pi",
            1,
            2 "?????" "Workshop",
            "2" 0,
            1
    );
/* #2 */
INSERT INTO Atividades(
        data,
        horario,
        duracao,
        publico_alvo,
        valor_inscriacao,
        promotor,
        lotacao,
        id,
        nome,
        tema,
        afiliacao,
        minicurriculo,
        objetivo,
        nivel,
        nome_sessao,
        fk_regras_regras_PK,
        fk_premiacao_premiacao_PK,
        tipo,
        numero_sessao,
        Atividades_TIPO,
        fk_Evento_id,
        fk_Sala_id
    )
VALUES (
        VALUES(TO_DATE('23/11/2021', 'DD/MM/YYYY')),
            "14:00",
            "16:00",
            "Estudantes",
            0.0,
            "Alexandre Grichkov",
            100,
            1,
            "Calculo de e",
            "IME" "Metodologias para o calculo de e",
            "Alexandre Grichkov do IME",
            "Calcular o numero e",
            "?????",
            "Atividade calculo e",
            2,
            2 "?????" "Workshop",
            "3" 0,
            1
    );
/* #3 */
INSERT INTO Atividades(
        data,
        horario,
        duracao,
        publico_alvo,
        valor_inscriacao,
        promotor,
        lotacao,
        id,
        nome,
        tema,
        afiliacao,
        minicurriculo,
        objetivo,
        nivel,
        nome_sessao,
        fk_regras_regras_PK,
        fk_premiacao_premiacao_PK,
        tipo,
        numero_sessao,
        Atividades_TIPO,
        fk_Evento_id,
        fk_Sala_id
    )
VALUES (
        VALUES(TO_DATE('27/11/2021', 'DD/MM/YYYY')),
            "14:00",
            "16:00",
            "Estudantes",
            0.0,
            "Claudio Gorodski",
            130,
            2,
            "Metodos previsão do tempo",
            "IME" "Metodologias para o calculo da previsão do tempo",
            "Claudio Gorodski do IME",
            "Calcular previsões do clima",
            "?????",
            "Atividade de calculo do clima ",
            2,
            2 "?????" "Workshop",
            "3" 1,
            0
    );
/* #4 */
INSERT INTO Atividades(
        data,
        horario,
        duracao,
        publico_alvo,
        valor_inscriacao,
        promotor,
        lotacao,
        id,
        nome,
        tema,
        afiliacao,
        minicurriculo,
        objetivo,
        nivel,
        nome_sessao,
        fk_regras_regras_PK,
        fk_premiacao_premiacao_PK,
        tipo,
        numero_sessao,
        Atividades_TIPO,
        fk_Evento_id,
        fk_Sala_id
    )
VALUES (
        VALUES(TO_DATE('27/11/2021', 'DD/MM/YYYY')),
            "14:00",
            "16:00",
            "Estudantes",
            0.0,
            "Claudio Gorodski",
            10,
            3,
            "Apresentação banca",
            "EACH" "Apresentação de banca do alunos da EACH",
            "Claudio Gorodski do IME",
            "Apresentação de banca dos alunos da EACH",
            "?????",
            "Atividade de Apresentação de banca dos alunos da EACH",
            3,
            2 "?????" "Banca",
            "3" 2,
            0
    );
/* #5 */
INSERT INTO Atividades(
        data,
        horario,
        duracao,
        publico_alvo,
        valor_inscriacao,
        promotor,
        lotacao,
        id,
        nome,
        tema,
        afiliacao,
        minicurriculo,
        objetivo,
        nivel,
        nome_sessao,
        fk_regras_regras_PK,
        fk_premiacao_premiacao_PK,
        tipo,
        numero_sessao,
        Atividades_TIPO,
        fk_Evento_id,
        fk_Sala_id
    )
VALUES (
        VALUES(TO_DATE('29/11/2021', 'DD/MM/YYYY')),
            "13:00",
            "18:00",
            "Estudantes",
            0.0,
            "Claudio Gorodski",
            10,
            3,
            "Apresentação banca",
            "EACH" "Apresentação de banca do alunos da EACH",
            "Claudio Gorodski do IME",
            "Apresentação de banca dos alunos da EACH",
            "?????",
            "Atividade de Apresentação de banca dos alunos da EACH",
            3,
            2 "?????" "Banca",
            "3" 4,
            0
    );
/* ------------------------------ */
/* Inserindo na tabela Desconto   */
/* ------------------------------ */
/* #1 */
INSERT INTO Desconto(valor, regras, id)
VALUES (
        0.8,
        "Aplicado para estudantes" 0
    );
/* #2 */
INSERT INTO  Desconto(valor, regras, id)
VALUES (
        0.6,
        "Aplicado para estudantes e professores" 1
    );
/* #3 */
INSERT INTO Desconto(valor, regras, id)
VALUES (
        0.8,
        "Aplicado para estudantes e professores" 2
    );



/*--------------------------------------*/
/*Inserindo na tabela Tipo_de_ingresso  */
/*--------------------------------------*/
/* #1 */
INSERT INTO Tipo_de_ingresso(nome, descricao, valor_base,id)
VALUES (
        "Regular",
        "Ingresso regular",
        1.0,
        0 
    );
/* #2 */
INSERT INTO Tipo_de_ingresso(nome, descricao, valor_base,id)
VALUES (
        "FIM DE SEMANA",
        "Ingresso fim de semana",
        0.5,
        1 
    );



/*--------------------------------------*/
/*     Inserindo na tabela Pessoa       */
/*--------------------------------------*/
/* #1 */
INSERT INTO Pessoa(nome, documento, telefone,email,id)
VALUES (
        "Charlotte",
        "122534123",
        "(11)91232-1232",
        "mail1@mail.com"
        0 
    );
/* #2 */
INSERT INTO Pessoa(nome, documento, telefone,email,id)
VALUES (
        "Oliver",
        "122534122",
        "(11)91232-1234",
        "mail2@mail.com"
        1
    );

    /* #3 */
INSERT INTO Pessoa(nome, documento, telefone,email,id)
VALUES (
        "Jack",
        "136534122",
        "(11)91232-8834",
        "mail3@mail.com"
        2
    );


/* #4 */
INSERT INTO Pessoa(nome, documento, telefone,email,id)
VALUES (
        "Ruby",
        "122235122",
        "(11)91232-2234",
        "mail4@mail.com"
        3
    );


/* #5 */
INSERT INTO Pessoa(nome, documento, telefone,email,id)
VALUES (
        "Isla",
        "124434122",
        "(11)23232-1234",
        "mail5@mail.com"
        4
    );


/*-------------------------------------------------*/
/*     Inserindo na tabela Certificado_Funcao      */
/*-------------------------------------------------*/
/* #1 */
INSERT INTO Certificado_Funcao  (id,descricao,data_de_emissao,nome)
VALUES (
        0,
        "Certificado de workshop",
         VALUES(TO_DATE('29/11/2021', 'DD/MM/YYYY')),
        "Certificado de conclusão de workshop"
        0 
    );


    /* #2 */
INSERT INTO Certificado_Funcao  (id,descricao,data_de_emissao,nome)
VALUES (
        0,
        "Certificado de palestra",
         VALUES(TO_DATE('20/11/2021', 'DD/MM/YYYY')),
        "Certificado de conclusão de palestra"
        1 
    );

    /* #3 */
INSERT INTO Certificado_Funcao  (id,descricao,data_de_emissao,nome)
VALUES (
        0,
        "Certificado de workshop",
         VALUES(TO_DATE('05/11/2021', 'DD/MM/YYYY')),
        "Certificado de conclusão de workshop"
        2 
    );

    /* #4 */
INSERT INTO Certificado_Funcao  (id,descricao,data_de_emissao,nome)
VALUES (
        0,
        "Certificado de banca",
         VALUES(TO_DATE('29/11/2021', 'DD/MM/YYYY')),
        "Certificado de conclusão de banca"
        3 
    );



/*-------------------------------------------------*/
/*     Inserindo na tabela Responsavel             */
/*-------------------------------------------------*/
/* #1 */
INSERT INTO Responsavel  (nome,telefone,email,id,fk_Entidade_id)
VALUES (
    
        "Samuel Douglas",
         "(11)98211-4460",
        "fakemail1@mail.com",
        0,
        0 
    );


    /* #2 */
INSERT INTO Responsavel  (nome,telefone,email,id,fk_Entidade_id)
VALUES (
    
        "Samuel Pietro",
         "(11)98211-4461",
        "fakemail2@mail.com",
        1,
        1 
    );



/* #3 */
INSERT INTO Responsavel  (nome,telefone,email,id,fk_Entidade_id)
VALUES (
    
        "Samuel Pablo",
         "(11)98211-2231",
        "fakemail3@mail.com",
        2,
        2 
    );



/* #4 */
INSERT INTO Responsavel  (nome,telefone,email,id,fk_Entidade_id)
VALUES (
        0,
        "Samuel Kleber",
         "(11)92222-4460",
        "fakemail4@mail.com",
        3,
        1 
    );


/*-------------------------------------------------*/
/*     Inserindo na tabela Artigo                  */
/*-------------------------------------------------*/
/* #1 */
INSERT INTO Artigo  (nome,resumo,autoria,data_de_publicacao,id)
VALUES (
        "Clean code em C",
         "Boas praticas de programação em C",
    "Richard Gates",
        VALUES(TO_DATE('12/11/2021', 'DD/MM/YYYY')),
        0 
    );

/* #2 */
INSERT INTO Artigo  (nome,resumo,autoria,data_de_publicacao,id)
VALUES (
        "Clean code em JAVA",
         "Boas praticas de programação em JAVA",
    "Denise Babel",
        VALUES(TO_DATE('13/11/2021', 'DD/MM/YYYY')),
        1 
    );
/* #3 */
INSERT INTO Artigo  (nome,resumo,autoria,data_de_publicacao,id)
VALUES (
        "Clean code em JS",
         "Boas praticas de programação em JavaScript",
    "Denise Roberta",
        VALUES(TO_DATE('14/11/2021', 'DD/MM/YYYY')),
        2 
    );



/*-------------------------------------------------*/
/*     Inserindo na tabela Sala                    */
/*-------------------------------------------------*/
/* #1 */
INSERT INTO Sala  (nome,descricao,capacidade,id,  fk_Local_id)
VALUES (
        "Auditorio",
         "Auditorio central",
    200,
        0,
        0 
    );


/* #2 */
INSERT INTO Sala  (nome,descricao,capacidade,id,  fk_Local_id)
VALUES (
        "Auditorio",
         "Auditorio secundario",
    200,
        1,
        0 
    );


/*-------------------------------------------------*/
/*   Inserindo na tabela Saida_de_dinheiro_Local   */
/*-------------------------------------------------*/

/* #1 */
INSERT INTO Saida_de_dinheiro_Local  (nome,descricao,capacidade,id,  fk_Local_id)
VALUES (
        "Auditorio",
         "Auditorio central",
    200,
        0,
        0 
    );

