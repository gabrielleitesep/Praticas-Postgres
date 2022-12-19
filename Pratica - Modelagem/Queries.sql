CREATE TABLE "Users" (
	"id" SERIAL PRIMARY KEY,
    "name" TEXT VARCHAR(20) NOT NULL,
    "email" TEXT VARCHAR(50) NOT NULL,
    "password" TEXT VARCHAR(20) NOT NULL,
    "address_id" INTEGER REFERENCES "Address"("id")
);

CREATE TABLE "Address" (
    "id" SERIAL PRIMARY KEY,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL
);

CREATE TABLE "Orders" (
    "id" SERIAL PRIMARY KEY,
    "state" TEXT NOT NULL,
    "user_id" INTEGER REFERENCES "Users"("id"),
	"cart_id" INTEGER REFERENCES "ShoppingCart"("id"),
    "address_id" INTEGER REFERENCES "Address"("id")"address_id" INTEGER REFERENCES "Address"("id")
);

CREATE TABLE "ShoppingCart" (
    "id" SERIAL PRIMARY KEY,
    "product_id" INTEGER REFERENCES "Products"("id"),
    "user_id" INTEGER REFERENCES "Users"("id")
);

CREATE TABLE "Products" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
	"price" TEXT NOT NULL,
	"type_id" INTEGER REFERENCES "ProductType"("id"),
	"size_id" INTEGER REFERENCES "ProductSize"("id"),
    "photo_id" INTEGER REFERENCES "ProductPhoto"("id")
);

CREATE TABLE "ProductPhoto" (
    "id" SERIAL PRIMARY KEY,
    "url" TEXT NOT NULL
);

CREATE TABLE "ProductSize" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT VARCHAR(1) NOT NULL
);

CREATE TABLE "ProductType" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);