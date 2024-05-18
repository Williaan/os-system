/*
  Warnings:

  - You are about to drop the column `order_ServiceId` on the `client` table. All the data in the column will be lost.
  - You are about to drop the column `order_ServiceId` on the `employees` table. All the data in the column will be lost.
  - You are about to drop the column `order_ServiceId` on the `parts` table. All the data in the column will be lost.
  - You are about to drop the column `order_ServiceId` on the `services` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "client" DROP CONSTRAINT "client_order_ServiceId_fkey";

-- DropForeignKey
ALTER TABLE "employees" DROP CONSTRAINT "employees_order_ServiceId_fkey";

-- DropForeignKey
ALTER TABLE "parts" DROP CONSTRAINT "parts_order_ServiceId_fkey";

-- DropForeignKey
ALTER TABLE "services" DROP CONSTRAINT "services_order_ServiceId_fkey";

-- AlterTable
ALTER TABLE "client" DROP COLUMN "order_ServiceId";

-- AlterTable
ALTER TABLE "employees" DROP COLUMN "order_ServiceId";

-- AlterTable
ALTER TABLE "order_service" ADD COLUMN     "clientId" INTEGER,
ADD COLUMN     "employeesId" INTEGER,
ADD COLUMN     "partsId" INTEGER,
ADD COLUMN     "servicesId" INTEGER;

-- AlterTable
ALTER TABLE "parts" DROP COLUMN "order_ServiceId";

-- AlterTable
ALTER TABLE "services" DROP COLUMN "order_ServiceId";

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_employeesId_fkey" FOREIGN KEY ("employeesId") REFERENCES "employees"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_partsId_fkey" FOREIGN KEY ("partsId") REFERENCES "parts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_servicesId_fkey" FOREIGN KEY ("servicesId") REFERENCES "services"("id") ON DELETE SET NULL ON UPDATE CASCADE;
