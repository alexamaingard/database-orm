/*
  Warnings:

  - You are about to drop the column `screenNumber` on the `Screening` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_screenNumber_fkey";

-- DropIndex
DROP INDEX "Screen_number_key";

-- AlterTable
ALTER TABLE "Screening" DROP COLUMN "screenNumber",
ADD COLUMN     "screenId" INTEGER;

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("id") ON DELETE SET NULL ON UPDATE CASCADE;
