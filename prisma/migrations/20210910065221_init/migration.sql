/*
  Warnings:

  - You are about to drop the column `emailId` on the `VisitNotes` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[patientId,date]` on the table `VisitNotes` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `patientId` to the `VisitNotes` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "CallType" AS ENUM ('PHONE', 'MESSAGE', 'EMAIL', 'CHAT', 'VIDEO');

-- CreateEnum
CREATE TYPE "CallStatus" AS ENUM ('INCOMING', 'OUTGOING', 'MISSED');

-- DropForeignKey
ALTER TABLE "VisitNotes" DROP CONSTRAINT "VisitNotes_emailId_fkey";

-- DropIndex
DROP INDEX "VisitNotes.emailId_date_unique";

-- AlterTable
ALTER TABLE "PatientDetail" ADD COLUMN     "id" SERIAL NOT NULL,
ADD PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "VisitNotes" DROP COLUMN "emailId",
ADD COLUMN     "patientId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "PatientCallLog" (
    "patientId" INTEGER NOT NULL,

    PRIMARY KEY ("patientId")
);

-- CreateTable
CREATE TABLE "CallLog" (
    "id" SERIAL NOT NULL,
    "patientId" INTEGER NOT NULL,
    "callType" "CallType",
    "callTime" TIMESTAMP(3),
    "callStatus" "CallStatus",

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "VisitNotes.patientId_date_unique" ON "VisitNotes"("patientId", "date");

-- AddForeignKey
ALTER TABLE "VisitNotes" ADD FOREIGN KEY ("patientId") REFERENCES "PatientDetail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientCallLog" ADD FOREIGN KEY ("patientId") REFERENCES "PatientDetail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CallLog" ADD FOREIGN KEY ("patientId") REFERENCES "PatientCallLog"("patientId") ON DELETE CASCADE ON UPDATE CASCADE;
