-- DropForeignKey
ALTER TABLE "Customer" DROP CONSTRAINT "Customer_contactId_fkey";

-- AlterTable
ALTER TABLE "Customer" ALTER COLUMN "contactId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "Contact"("id") ON DELETE SET NULL ON UPDATE CASCADE;
