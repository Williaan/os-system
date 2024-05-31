/*
  Warnings:

  - Made the column `clientId` on table `order_service` required. This step will fail if there are existing NULL values in that column.
  - Made the column `employeesId` on table `order_service` required. This step will fail if there are existing NULL values in that column.
  - Made the column `partsId` on table `order_service` required. This step will fail if there are existing NULL values in that column.
  - Made the column `servicesId` on table `order_service` required. This step will fail if there are existing NULL values in that column.

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
ALTER TABLE "order_service" ALTER COLUMN "clientId" SET NOT NULL,
ALTER COLUMN "employeesId" SET NOT NULL,
ALTER COLUMN "partsId" SET NOT NULL,
ALTER COLUMN "servicesId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_employeesId_fkey" FOREIGN KEY ("employeesId") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_partsId_fkey" FOREIGN KEY ("partsId") REFERENCES "parts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_servicesId_fkey" FOREIGN KEY ("servicesId") REFERENCES "services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
