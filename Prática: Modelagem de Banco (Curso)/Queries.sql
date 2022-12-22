CREATE TABLE "alunos" (
    "id" SERIAL PRIMARY KEY,
    "nome" SERIAL PRIMARY KEY,
    "cpf" VARCHAR(11) NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "turma_id" INTEGER REFERENCES "turma"("id"),
    "entregas_id" INTEGER REFERENCES "entregas"("id")
);

CREATE TABLE "turma" (
    "id" SERIAL PRIMARY KEY,
    "codigo" VARCHAR(3) NOT NULL
);

CREATE TABLE "entregas" (
    "id" SERIAL PRIMARY KEY,
    "data" TIMESTAMP NOT NULL,
    "nota" TEXT NOT NULL,
    "projetos_id" INTEGER REFERENCES "projetos"("id")
);

CREATE TABLE "projetos" (
    "id" SERIAL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "modulo_id" INTEGER REFERENCES "modulos"("id"),
    "turma_id" INTEGER REFERENCES "turma"("id")
);

CREATE TABLE "modulos" (
    "id" SERIAL PRIMARY KEY,
    "nome" TEXT NOT NULL
);