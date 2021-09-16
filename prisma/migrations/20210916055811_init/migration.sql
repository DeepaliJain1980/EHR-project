-- CreateEnum
CREATE TYPE "Weekday" AS ENUM ('SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY');

-- AlterTable
ALTER TABLE "Employee" ALTER COLUMN "organizationId" DROP NOT NULL;

-- CreateTable
CREATE TABLE "Doctor" (
    "id" SERIAL NOT NULL,
    "emailId" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Availability" (
    "id" SERIAL NOT NULL,
    "emailId" TEXT NOT NULL,
    "weekday" "Weekday",
    "slot" TEXT[],

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Doctor.emailId_unique" ON "Doctor"("emailId");

-- AddForeignKey
ALTER TABLE "Doctor" ADD FOREIGN KEY ("emailId") REFERENCES "EmployeeDetail"("emailId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Availability" ADD FOREIGN KEY ("emailId") REFERENCES "Doctor"("emailId") ON DELETE CASCADE ON UPDATE CASCADE;
