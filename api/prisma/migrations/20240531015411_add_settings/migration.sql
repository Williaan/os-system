/*
  Warnings:

  - A unique constraint covering the columns `[serial]` on the table `order_service` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[serial]` on the table `parts` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "order_service_serial_key" ON "order_service"("serial");

-- CreateIndex
CREATE UNIQUE INDEX "parts_serial_key" ON "parts"("serial");
