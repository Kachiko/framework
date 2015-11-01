--User Propriétaire créé : ComptaProprio
--MdP Du user : ComptaProprio
--Database : D_COMPTA

--Création du schéma sous Postgres

CREATE TABLE "Regroupement_Compte"
(
  id integer NOT NULL,
  nom varchar(25),
  CONSTRAINT PK_Regroupement_Compte PRIMARY KEY (id)
);

CREATE TABLE "Compte_Comptable"
(
  compte integer NOT NULL,
  libelle varchar(50),
  sens varchar(1),
  CONSTRAINT PK_Compte_Comptable PRIMARY KEY (compte)
);
ALTER TABLE "Compte_Comptable"
  OWNER TO "ComptaProprio";


CREATE TABLE "Lnk_Compte_Regroupement"
(
  fkId integer NOT NULL,
  fkCompte integer NOT NULL,
  CONSTRAINT PK_Lnk_Compte_Regroupement PRIMARY KEY (fkId, fkCompte)
);

ALTER TABLE "Lnk_Compte_Regroupement"
  ADD CONSTRAINT "FK_LCR_Compte_Comptable" FOREIGN KEY (fkCompte) REFERENCES "Compte_Comptable" (compte)
    ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX "FKI_LCR_Compte_Comptable"
  ON "Lnk_Compte_Regroupement"(fkCompte);

ALTER TABLE "Lnk_Compte_Regroupement"
  ADD CONSTRAINT "FK_LCR_Regroupement_Compte" FOREIGN KEY (fkId) REFERENCES "Regroupement_Compte" (id)
    ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX "FKI_LCR_Regroupement_Compte"
  ON "Lnk_Compte_Regroupement"(fkId);
  
 
CREATE TABLE "Journal_Ecriture"
(
  id bigint NOT NULL,
  datevaleur date NOT NULL,
  montant integer,
  sens character varying(1),
  fkcompte integer,
  CONSTRAINT pk_journal_ecriture PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Journal_Ecriture"
  OWNER TO "ComptaProprio";

ALTER TABLE "Journal_Ecriture"
  ADD CONSTRAINT "FK_JE_Compte_Comptable" FOREIGN KEY (fkcompte) REFERENCES "Compte_Comptable" (compte)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX "FKI_JE_Compte_Comptable"
  ON "Journal_Ecriture"(fkcompte);
  
CREATE SEQUENCE "SQ_Journal_Ecriture"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 999999999
  START 1
  CACHE 1
  CYCLE;