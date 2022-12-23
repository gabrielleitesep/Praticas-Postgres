CREATE TABLE "atores" (
    "id" SERIAL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "pais" TEXT NOT NULL,
    "nascimento" DATE NOT NULL
);

CREATE TABLE "filmes" (
    "id" SERIAL PRIMARY KEY,
    "titulo" TEXT NOT NULL,
    "categoria" TEXT NOT NULL
);

CREATE TABLE "atoresFilme" (
    "id" SERIAL PRIMARY KEY,
    "filme_id" INTEGER REFERENCES "filmes"("id"),
    "ator_id" INTEGER REFERENCES "atores"("id")
);

CREATE TABLE "discos" (
    "id" SERIAL PRIMARY KEY,
    "numero" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,
    "filme_id" INTEGER REFERENCES "filmes"("id")
);

CREATE TABLE "locacao" (
    "id" SERIAL PRIMARY KEY,
    "cliente_id" INTEGER REFERENCES "cliente"("id"),
    "retirada" DATE DEFAULT NOW() NOT NULL,
    "entrega" DATE NOT NULL,
    "satisfacao" TEXT NOT NULL
);

CREATE TABLE "discoLocado" (
    "id" SERIAL PRIMARY KEY,
    "disco_id" INTEGER REFERENCES "discos"("id"),
    "locacao_id" INTEGER REFERENCES "locacao"("id"),
    "satisfacao" TEXT NOT NULL
);

CREATE TABLE "clientes" (
    "id" SERIAL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE "telefones" (
    "id" SERIAL PRIMARY KEY,
    "cliente_id" INTEGER REFERENCES "cliente"("id"),
    "numero" TEXT NOT NULL UNIQUE
);

CREATE TABLE "estados" (
    "id" SERIAL PRIMARY KEY,
    "nome" TEXT NOT NULL
);

CREATE TABLE "cidades" (
    "id" SERIAL PRIMARY KEY,
    "nome" SERIAL PRIMARY KEY,
    "estado_id" INTEGER REFERENCES "estados"("id")
);

CREATE TABLE "bairros" (
    "id" SERIAL PRIMARY KEY,
    "nome" SERIAL PRIMARY KEY,
    "cidade_id" INTEGER REFERENCES "cidades"("id")
);

CREATE TABLE "rua" (
    "id" SERIAL PRIMARY KEY,
    "nome" SERIAL PRIMARY KEY,
    "bairro_id" INTEGER REFERENCES "bairros"("id")
);

CREATE TABLE "endereco" (
    "id" SERIAL PRIMARY KEY,
    "cliente_id" INTEGER REFERENCES "clientes"("id"),
    "rua_id" INTEGER REFERENCES "rua"("id"),
    "numero" TEXT NOT NULL UNIQUE,
    "complemento" TEXT NOT NULL,
    "cep" VARCHAR(8) NOT NULL UNIQUE
);