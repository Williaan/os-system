/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `client` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `employees` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[description]` on the table `parts` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[description]` on the table `services` will be added. If there are existing duplicate values, this will fail.

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
ALTER TABLE "order_service" ADD COLUMN     "equipmentId" TEXT,
ALTER COLUMN "clientId" DROP NOT NULL,
ALTER COLUMN "employeesId" DROP NOT NULL,
ALTER COLUMN "partsId" DROP NOT NULL,
ALTER COLUMN "servicesId" DROP NOT NULL;

-- CreateTable
CREATE TABLE "Equipment" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "serial" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Equipment_description_key" ON "Equipment"("description");

-- CreateIndex
CREATE UNIQUE INDEX "client_name_key" ON "client"("name");

-- CreateIndex
CREATE UNIQUE INDEX "employees_name_key" ON "employees"("name");

-- CreateIndex
CREATE UNIQUE INDEX "parts_description_key" ON "parts"("description");

-- CreateIndex
CREATE UNIQUE INDEX "services_description_key" ON "services"("description");

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_employeesId_fkey" FOREIGN KEY ("employeesId") REFERENCES "employees"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_partsId_fkey" FOREIGN KEY ("partsId") REFERENCES "parts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_servicesId_fkey" FOREIGN KEY ("servicesId") REFERENCES "services"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
