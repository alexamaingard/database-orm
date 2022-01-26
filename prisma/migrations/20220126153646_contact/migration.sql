/*
  Warnings:

  - A unique constraint covering the columns `[contactId]` on the table `Customer` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `contactId` to the `Customer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Customer" ADD COLUMN     "contactId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Customer_contactId_key" ON "Customer"("contactId");

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "Contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
