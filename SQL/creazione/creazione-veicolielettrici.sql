CREATE TABLE "Produttore"
(
  "Nome" character varying NOT NULL,
  CONSTRAINT "Produttore_pkey" PRIMARY KEY ("Nome" )
);

CREATE TABLE "Veicolo"
(
  "VolumeCarico" numeric(10,2),
  "Posti" numeric(3,0),
  "Lunghezza" numeric(10,2),
  "Larghezza" numeric(10,2),
  "Altezza" numeric(10,2),
  "Porte" numeric(2,0),
  "Nome" character varying NOT NULL,
  "Prezzo" numeric(10,2),
  "Potenza" numeric(10,2),
  "Consumi" numeric(10,2),
  "Accelerazione" numeric(10,2),
  "VelocitaMax" numeric(10,2),
  "RaggioSterzata" numeric(10,2),
  "Ricarica" numeric(10,2),
  "Autonomia" numeric(10,2),
  "Tipo" character varying NOT NULL,
  "Sottotipo" character varying,
  "Produttore" character varying NOT NULL,
  "AnnoProduzione" numeric(5,0),
  CONSTRAINT "Veicolo_pkey" PRIMARY KEY ("Nome" ),
  CONSTRAINT "Produttore" FOREIGN KEY ("Produttore")
      REFERENCES "Produttore" ("Nome") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE "Colonnina"
(
  "Id" character varying NOT NULL,
  "Latitudine" numeric(10,2),
  "Longitudine" numeric(10,2),
  "Via" character varying NOT NULL,
  "Civico" character varying NOT NULL,
  "Comune" character varying NOT NULL,
  "Provincia" character varying NOT NULL,
  "Cap" character varying NOT NULL,
  "Gestore" character varying,
  "Costruttore" character varying,
  CONSTRAINT "Colonnina_pkey" PRIMARY KEY ("Id" )
);

CREATE TABLE "Concessionario"
(
  "Id" character varying NOT NULL,
  "Nome" character varying NOT NULL,
  "Latitudine" numeric(10,2),
  "Longitudine" numeric(10,2),
  "Via" character varying NOT NULL,
  "Civico" character varying NOT NULL,
  "Comune" character varying NOT NULL,
  "Provincia" character varying NOT NULL,
  "Cap" character varying NOT NULL,
  "Fax" character varying,
  "Web" character varying,
  "Telefono" character varying,
  CONSTRAINT "Concessionario_pkey" PRIMARY KEY ("Id" )
);

CREATE TABLE "Utente"
(
  "Username" character varying NOT NULL,
  "Email" character varying NOT NULL,
  "Latitudine" numeric(10,2),
  "Longitudine" numeric(10,2),
  CONSTRAINT "Utente_pkey" PRIMARY KEY ("Username" )
);

CREATE TABLE "Possesso"
(
  "Veicolo" character varying NOT NULL,
  "Utente" character varying NOT NULL,
  CONSTRAINT "Possesso_pkey" PRIMARY KEY ("Veicolo" , "Utente" ),
  CONSTRAINT "Possesso_Utente" FOREIGN KEY ("Utente")
      REFERENCES "Utente" ("Username") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Possesso_Veicolo" FOREIGN KEY ("Veicolo")
      REFERENCES "Veicolo" ("Nome") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE "Recensione"
(
  "Veicolo" character varying NOT NULL,
  "Utente" character varying NOT NULL,
  "Data" character varying NOT NULL,
  "Likes" numeric,
  "Dislikes" numeric,
  "Voto" numeric(2,0) NOT NULL,
  CONSTRAINT "Recensione_pkey" PRIMARY KEY ("Utente" , "Veicolo" , "Data" ),
  CONSTRAINT "Recensione_Utente" FOREIGN KEY ("Utente")
      REFERENCES "Utente" ("Username") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Recensione_Veicolo" FOREIGN KEY ("Veicolo")
      REFERENCES "Veicolo" ("Nome") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE "Segnalazione"
(
  "Colonnina" character varying NOT NULL,
  "Utente" character varying NOT NULL,
  "Data" character varying NOT NULL,
  "Utile" numeric,
  "Inutile" numeric,
  "Tipo" character varying NOT NULL,
  "Descrizione" character varying NOT NULL,
  CONSTRAINT "Segnalazine_pkey" PRIMARY KEY ("Utente" , "Colonnina" , "Data" ),
  CONSTRAINT "Segnalazione_Colonnina" FOREIGN KEY ("Colonnina")
      REFERENCES "Colonnina" ("Id") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Segnalazione_Utente" FOREIGN KEY ("Utente")
      REFERENCES "Utente" ("Username") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE "Vendita"
(
  "Veicolo" character varying NOT NULL,
  "Concessionario" character varying NOT NULL,
  CONSTRAINT "Vendita_pkey" PRIMARY KEY ("Veicolo" , "Concessionario" ),
  CONSTRAINT "Vendita_Concessionario" FOREIGN KEY ("Concessionario")
      REFERENCES "Concessionario" ("Id") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Vendita_Veicolo" FOREIGN KEY ("Veicolo")
      REFERENCES "Veicolo" ("Nome") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
