/*
  Warnings:

  - Added the required column `brand` to the `order_service` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `order_service` table without a default value. This is not possible if the table is not empty.
  - Added the required column `serial` to the `order_service` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "order_service" ADD COLUMN     "brand" TEXT NOT NULL,
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "serial" TEXT NOT NULL;
