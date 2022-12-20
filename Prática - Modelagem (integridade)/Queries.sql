CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stateID" INTEGER REFERENCES "states"("id")
);

CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "number" NOT NULL,
    "customerID" INTEGER REFERENCES "customers"("id"),
    "type" TEXT NOT NULL
);

CREATE TABLE "customerAddresses" (
    "id" SERIAL PRIMARY KEY,
    "customerID" INTEGER REFERENCES "customers"("id"),
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "postalCode" TEXT NOT NULL,
    "cityID" INTEGER REFERENCES "cities"("id")
);

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "cpf" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "fullName" TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerID" INTEGER REFERENCES "customers"("id"),
    "accountNumber" NOT NULL,
    "agency" NOT NULL,
    "openDate" DATE DEFAULT NOW() NOT NULL,
    "closeDate" NOT NULL
);

CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountID" INTEGER REFERENCES "bankAccount"("id"),
    "amount" NOT NULL,
    "type" TEXT NOT NULL,
    "time" TIME DEFAULT NOW() NOT NULL,
    "description" TEXT NOT NULL,
    "canceled" NOT NULL
);

CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountID" INTEGER REFERENCES "bankAccount"("id"),
    "name" TEXT NOT NULL,
    "securityCode" NOT NULL,
    "expirationMonth" NOT NULL,
    "expirationYear" NOT NULL,
    "password" TEXT NOT NULL,
    "limit" NOT NULL
);

