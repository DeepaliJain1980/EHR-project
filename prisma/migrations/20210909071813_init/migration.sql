/*
  Warnings:

  - You are about to drop the `Exercise` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Exercise" DROP CONSTRAINT "Exercise_userId_fkey";

-- DropTable
DROP TABLE "Exercise";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "OrganizationDetail" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "websiteLink" TEXT,
    "linkedInPage" TEXT,
    "email" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "addressLine1" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "City" TEXT NOT NULL,
    "zipCode" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "role" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "roleName" TEXT NOT NULL,
    "dateOfCreation" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT,
    "checklistName" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Checklist" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChecklistItems" (
    "checklistName" TEXT NOT NULL,
    "itemName" TEXT NOT NULL,
    "description" TEXT,
    "mandatory" BOOLEAN NOT NULL DEFAULT false,
    "requireUploadingFile" BOOLEAN NOT NULL DEFAULT false
);

-- CreateIndex
CREATE UNIQUE INDEX "Role.role_unique" ON "Role"("role");

-- CreateIndex
CREATE UNIQUE INDEX "Checklist.name_unique" ON "Checklist"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ChecklistItems.checklistName_itemName_unique" ON "ChecklistItems"("checklistName", "itemName");

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("roleName") REFERENCES "Role"("role") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD FOREIGN KEY ("checklistName") REFERENCES "Checklist"("name") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChecklistItems" ADD FOREIGN KEY ("checklistName") REFERENCES "Checklist"("name") ON DELETE CASCADE ON UPDATE CASCADE;
