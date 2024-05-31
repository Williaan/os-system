/*
  Warnings:

  - You are about to drop the column `clientId` on the `order_service` table. All the data in the column will be lost.
  - You are about to drop the column `employeesId` on the `order_service` table. All the data in the column will be lost.
  - You are about to drop the column `partsId` on the `order_service` table. All the data in the column will be lost.
  - You are about to drop the column `servicesId` on the `order_service` table. All the data in the column will be lost.

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
ALTER TABLE "client" ADD COLUMN     "order_ServiceId" INTEGER;

-- AlterTable
ALTER TABLE "employees" ADD COLUMN     "order_ServiceId" INTEGER;

-- AlterTable
ALTER TABLE "order_service" DROP COLUMN "clientId",
DROP COLUMN "employeesId",
DROP COLUMN "partsId",
DROP COLUMN "servicesId";

-- AlterTable
ALTER TABLE "parts" ADD COLUMN     "order_ServiceId" INTEGER;

-- AlterTable
ALTER TABLE "services" ADD COLUMN     "order_ServiceId" INTEGER;

-- AddForeignKey
ALTER TABLE "client" ADD CONSTRAINT "client_order_ServiceId_fkey" FOREIGN KEY ("order_ServiceId") REFERENCES "order_service"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_order_ServiceId_fkey" FOREIGN KEY ("order_ServiceId") REFERENCES "order_service"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "parts" ADD CONSTRAINT "parts_order_ServiceId_fkey" FOREIGN KEY ("order_ServiceId") REFERENCES "order_service"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "services" ADD CONSTRAINT "services_order_ServiceId_fkey" FOREIGN KEY ("order_ServiceId") REFERENCES "order_service"("id") ON DELETE SET NULL ON UPDATE CASCADE;
