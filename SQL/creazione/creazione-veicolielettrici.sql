CREATE TABLE produttore
(
  nome character varying NOT NULL,
  CONSTRAINT produttore_pkey PRIMARY KEY (nome )
);

CREATE TABLE veicolo
(

  volumecarico numeric(10,2),
  posti numeric(3,0),
  lunghezza numeric(10,2),
  larghezza numeric(10,2),
  altezza numeric(10,2),
  peso numeric(10,2),
  porte numeric(2,0),
  nome character varying NOT NULL,
  prezzo numeric(10,2),
  potenza numeric(10,2),
  consumi numeric(10,2),
  accelerazione numeric(10,2),
  velocitamax numeric(10,2),
  raggiosterzata numeric(10,2),
  ricarica numeric(10,2),
  autonomia numeric(10,2),
  tipo character varying NOT NULL,
  sottotipo character varying,
  produttore character varying NOT NULL,
  website character varying,
  annoproduzione numeric(5,0),
  CONSTRAINT veicolo_pkey PRIMARY KEY (nome ),
  CONSTRAINT produttore foreign key (produttore)
      REFERENCES produttore (nome) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE colonnina
(
  id numeric,
  latitudine numeric(10,8) NOT NULL,
  longitudine numeric(10,8) NOT NULL,
  via character varying,
  civico character varying,
  comune character varying,
  provincia character varying,
  cap character varying,
  gestore character varying,
  costruttore character varying,
  CONSTRAINT colonnina_pkey PRIMARY KEY (id )
);

CREATE TABLE concessionario
(
  id numeric,
  nome character varying NOT NULL,
  latitudine numeric(10,8),
  longitudine numeric(10,8),
  via character varying NOT NULL,
  civico character varying NOT NULL,
  comune character varying NOT NULL,
  provincia character varying NOT NULL,
  cap character varying NOT NULL,
  fax character varying,
  web character varying,
  telefono character varying,
  CONSTRAINT concessionario_pkey PRIMARY KEY (id )
);

CREATE TABLE utente
(
  username character varying NOT NULL,
  email character varying NOT NULL,
  latitudine numeric(10,8),
  longitudine numeric(10,8),
  CONSTRAINT utente_pkey PRIMARY KEY (username )
);

CREATE TABLE possesso
(
  veicolo character varying NOT NULL,
  utente character varying NOT NULL,
  CONSTRAINT possesso_pkey PRIMARY KEY (veicolo , utente ),
  CONSTRAINT possesso_utente foreign key (utente)
      REFERENCES utente (username) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT possesso_veicolo foreign key (veicolo)
      REFERENCES veicolo (nome) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE recensione
(
  veicolo character varying NOT NULL,
  utente character varying NOT NULL,
  data character varying NOT NULL,
  likes numeric,
  dislikes numeric,
  voto numeric(2,0) NOT NULL,
  posseduto boolean DEFAULT false,
  testo character varying NOT NULL,
  CONSTRAINT recensione_pkey PRIMARY KEY (utente , veicolo , data ),
  CONSTRAINT recensione_utente foreign key (utente)
      REFERENCES utente (username) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT recensione_veicolo foreign key (veicolo)
      REFERENCES veicolo (nome) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE segnalazione
(
  colonnina numeric NOT NULL,
  utente character varying NOT NULL,
  data character varying NOT NULL,
  utile numeric,
  inutile numeric,
  tipo character varying NOT NULL,
  descrizione character varying NOT NULL,
  CONSTRAINT segnalazine_pkey PRIMARY KEY (utente , colonnina , data ),
  CONSTRAINT segnalazione_colonnina foreign key (colonnina)
      REFERENCES colonnina (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT segnalazione_utente foreign key (utente)
      REFERENCES utente (username) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE vendita
(
  veicolo character varying NOT NULL,
  concessionario numeric NOT NULL,
  CONSTRAINT vendita_pkey PRIMARY KEY (veicolo , concessionario ),
  CONSTRAINT vendita_concessionario foreign key (concessionario)
      REFERENCES concessionario (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT vendita_veicolo foreign key (veicolo)
      REFERENCES veicolo (nome) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
