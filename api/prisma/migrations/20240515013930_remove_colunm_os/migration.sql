/*
  Warnings:

  - You are about to drop the column `clients` on the `order_service` table. All the data in the column will be lost.
  - You are about to drop the column `parts` on the `order_service` table. All the data in the column will be lost.
  - You are about to drop the column `services` on the `order_service` table. All the data in the column will be lost.
  - You are about to drop the column `tecnicos` on the `order_service` table. All the data in the column will be lost.
  - Changed the type of `number` on the `client` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "client" DROP COLUMN "number",
ADD COLUMN     "number" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "order_service" DROP COLUMN "clients",
DROP COLUMN "parts",
DROP COLUMN "services",
DROP COLUMN "tecnicos";
