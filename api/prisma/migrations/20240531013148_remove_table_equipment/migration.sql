/*
  Warnings:

  - You are about to drop the column `equipmentId` on the `order_service` table. All the data in the column will be lost.
  - You are about to drop the `Equipment` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "order_service" DROP CONSTRAINT "order_service_equipmentId_fkey";

-- AlterTable
ALTER TABLE "order_service" DROP COLUMN "equipmentId";

-- DropTable
DROP TABLE "Equipment";
