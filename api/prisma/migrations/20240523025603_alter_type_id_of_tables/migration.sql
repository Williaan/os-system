/*
  Warnings:

  - The primary key for the `client` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `employees` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `parts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `services` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "order_service" DROP CONSTRAINT "order_service_clientId_fkey";

-- DropForeignKey
ALTER TABLE "order_service" DROP CONSTRAINT "order_service_employeesId_fkey";

-- DropForeignKey
ALTER TABLE "order_service" DROP CONSTRAINT "order_service_partsId_fkey";

-- DropForeignKey
ALTER TABLE "order_service" DROP CONSTRAINT "order_service_servicesId_fkey";

-- AlterTable
ALTER TABLE "client" DROP CONSTRAINT "client_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "client_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "client_id_seq";

-- AlterTable
ALTER TABLE "employees" DROP CONSTRAINT "employees_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "employees_id_seq";

-- AlterTable
ALTER TABLE "order_service" ALTER COLUMN "clientId" SET DATA TYPE TEXT,
ALTER COLUMN "employeesId" SET DATA TYPE TEXT,
ALTER COLUMN "partsId" SET DATA TYPE TEXT,
ALTER COLUMN "servicesId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "parts" DROP CONSTRAINT "parts_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "parts_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "parts_id_seq";

-- AlterTable
ALTER TABLE "services" DROP CONSTRAINT "services_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "services_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "services_id_seq";

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_employeesId_fkey" FOREIGN KEY ("employeesId") REFERENCES "employees"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_partsId_fkey" FOREIGN KEY ("partsId") REFERENCES "parts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_servicesId_fkey" FOREIGN KEY ("servicesId") REFERENCES "services"("id") ON DELETE SET NULL ON UPDATE CASCADE;
