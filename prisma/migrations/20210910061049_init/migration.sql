/*
  Warnings:

  - You are about to drop the column `City` on the `OrganizationDetail` table. All the data in the column will be lost.
  - You are about to drop the column `State` on the `OrganizationDetail` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `Employee` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `department` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `city` to the `OrganizationDetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `state` to the `OrganizationDetail` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- AlterTable
ALTER TABLE "Employee" ADD COLUMN     "department" TEXT NOT NULL,
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "OrganizationDetail" DROP COLUMN "City",
DROP COLUMN "State",
ADD COLUMN     "city" TEXT NOT NULL,
ADD COLUMN     "state" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Department" (
    "id" SERIAL NOT NULL,
    "roleName" TEXT NOT NULL,
    "department" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmployeeDetail" (
    "emailId" TEXT NOT NULL,
    "gender" "Gender" NOT NULL DEFAULT E'MALE',
    "mobile" INTEGER NOT NULL,
    "addressLine1" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "zipCode" INTEGER,
    "bankAcNumber" INTEGER,
    "bankNumber" TEXT,
    "practiseLicNumber" TEXT,
    "licenseType" TEXT,
    "experience" TEXT,
    "specilities" TEXT[],
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("emailId")
);

-- CreateTable
CREATE TABLE "PatientDetail" (
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "gender" "Gender" NOT NULL DEFAULT E'MALE',
    "email" TEXT NOT NULL,
    "addressLine1" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "zipCode" INTEGER,
    "bloodGroup" TEXT NOT NULL,
    "height" DOUBLE PRECISION NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "condition" TEXT[],
    "medication" TEXT[],
    "allergies" TEXT[],
    "vaccination" TEXT[],
    "updatedAt" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "VisitNotes" (
    "emailId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "detail" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "Department.roleName_department_unique" ON "Department"("roleName", "department");

-- CreateIndex
CREATE UNIQUE INDEX "PatientDetail.email_unique" ON "PatientDetail"("email");

-- CreateIndex
CREATE UNIQUE INDEX "VisitNotes.emailId_date_unique" ON "VisitNotes"("emailId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "Employee.email_unique" ON "Employee"("email");

-- AddForeignKey
ALTER TABLE "Department" ADD FOREIGN KEY ("roleName") REFERENCES "Role"("role") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("organizationId") REFERENCES "OrganizationDetail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeDetail" ADD FOREIGN KEY ("emailId") REFERENCES "Employee"("email") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VisitNotes" ADD FOREIGN KEY ("emailId") REFERENCES "PatientDetail"("email") ON DELETE CASCADE ON UPDATE CASCADE;
