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
ALTER TABLE "order_service" DROP COLUMN "clientId",
DROP COLUMN "employeesId",
DROP COLUMN "partsId",
DROP COLUMN "servicesId";

-- CreateTable
CREATE TABLE "OrderService" (
    "clientId" INTEGER NOT NULL,
    "order_ServiceId" INTEGER NOT NULL,
    "employeesId" INTEGER NOT NULL,
    "partsId" INTEGER NOT NULL,
    "servicesId" INTEGER NOT NULL,

    CONSTRAINT "OrderService_pkey" PRIMARY KEY ("clientId","order_ServiceId","employeesId","partsId","servicesId")
);

-- AddForeignKey
ALTER TABLE "OrderService" ADD CONSTRAINT "OrderService_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderService" ADD CONSTRAINT "OrderService_order_ServiceId_fkey" FOREIGN KEY ("order_ServiceId") REFERENCES "order_service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderService" ADD CONSTRAINT "OrderService_employeesId_fkey" FOREIGN KEY ("employeesId") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderService" ADD CONSTRAINT "OrderService_partsId_fkey" FOREIGN KEY ("partsId") REFERENCES "parts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderService" ADD CONSTRAINT "OrderService_servicesId_fkey" FOREIGN KEY ("servicesId") REFERENCES "services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
