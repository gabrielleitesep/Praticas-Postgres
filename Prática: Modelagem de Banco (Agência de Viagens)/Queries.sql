CREATE TABLE "aeroportos" (
    "id" SERIAL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "sigla" VARCHAR(3) NOT NULL
);

CREATE TABLE "companhias" (
    "id" SERIAL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "sigla" VARCHAR(3) NOT NULL
);

CREATE TABLE "voos" (
    "id" SERIAL PRIMARY KEY,
    "sigla" VARCHAR(7) NOT NULL,
    "partida_id" INTEGER REFERENCES "aeroportos"("id"),
    "chegada_id" INTEGER REFERENCES "aeroportos"("id"),
    "horario_partida" TIMESTAMP NOT NULL,
    "horario_chegada" TIMESTAMP NOT NULL,
    "companhia_id" INTEGER REFERENCES "customers"("id")
);