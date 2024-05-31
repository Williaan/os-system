/*
  Warnings:

  - The primary key for the `order_service` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "order_service" DROP CONSTRAINT "order_service_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "order_service_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "order_service_id_seq";
