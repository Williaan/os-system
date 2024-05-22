/*
  Warnings:

  - You are about to drop the `OrderService` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "OrderService" DROP CONSTRAINT "OrderService_clientId_fkey";

-- DropForeignKey
ALTER TABLE "OrderService" DROP CONSTRAINT "OrderService_employeesId_fkey";

-- DropForeignKey
ALTER TABLE "OrderService" DROP CONSTRAINT "OrderService_order_ServiceId_fkey";

-- DropForeignKey
ALTER TABLE "OrderService" DROP CONSTRAINT "OrderService_partsId_fkey";

-- DropForeignKey
ALTER TABLE "OrderService" DROP CONSTRAINT "OrderService_servicesId_fkey";

-- AlterTable
ALTER TABLE "order_service" ADD COLUMN     "clientId" INTEGER,
ADD COLUMN     "employeesId" INTEGER,
ADD COLUMN     "partsId" INTEGER,
ADD COLUMN     "servicesId" INTEGER;

-- DropTable
DROP TABLE "OrderService";

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_employeesId_fkey" FOREIGN KEY ("employeesId") REFERENCES "employees"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_partsId_fkey" FOREIGN KEY ("partsId") REFERENCES "parts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_service" ADD CONSTRAINT "order_service_servicesId_fkey" FOREIGN KEY ("servicesId") REFERENCES "services"("id") ON DELETE SET NULL ON UPDATE CASCADE;
