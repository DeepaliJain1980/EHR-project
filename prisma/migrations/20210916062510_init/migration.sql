-- AlterTable
ALTER TABLE "Employee" ALTER COLUMN "department" DROP NOT NULL;

-- RenameIndex
ALTER INDEX "Department.roleName_department_unique" RENAME TO "role_department";
