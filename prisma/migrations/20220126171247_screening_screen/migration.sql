-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_movieId_fkey";

-- DropForeignKey
ALTER TABLE "Screening" DROP CONSTRAINT "Screening_screenNumber_fkey";

-- AlterTable
ALTER TABLE "Screening" ALTER COLUMN "movieId" DROP NOT NULL,
ALTER COLUMN "screenNumber" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_screenNumber_fkey" FOREIGN KEY ("screenNumber") REFERENCES "Screen"("number") ON DELETE SET NULL ON UPDATE CASCADE;
