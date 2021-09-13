/*
  Warnings:

  - The primary key for the `PatientCallLog` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `CallLog` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CallLog" DROP CONSTRAINT "CallLog_patientId_fkey";

-- AlterTable
ALTER TABLE "PatientCallLog" DROP CONSTRAINT "PatientCallLog_pkey",
ADD COLUMN     "callStatus" TEXT,
ADD COLUMN     "callTime" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "callType" "CallType",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD PRIMARY KEY ("id");

-- DropTable
DROP TABLE "CallLog";

-- DropEnum
DROP TYPE "CallStatus";
