/*
  Warnings:

  - The primary key for the `amenity` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `booking` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `endDate` on the `booking` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `booking` table. All the data in the column will be lost.
  - The primary key for the `host` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `property` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `propertyamenity` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `review` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `bookingStatus` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `checkinDate` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `checkoutDate` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numberOfGuests` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `totalPrice` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aboutMe` to the `Host` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `Host` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `Host` table without a default value. This is not possible if the table is not empty.
  - Added the required column `profilePicture` to the `Host` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `Host` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `profilePicture` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `Booking_propertyId_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `Booking_userId_fkey`;

-- DropForeignKey
ALTER TABLE `property` DROP FOREIGN KEY `Property_hostId_fkey`;

-- DropForeignKey
ALTER TABLE `propertyamenity` DROP FOREIGN KEY `PropertyAmenity_amenityId_fkey`;

-- DropForeignKey
ALTER TABLE `propertyamenity` DROP FOREIGN KEY `PropertyAmenity_propertyId_fkey`;

-- DropForeignKey
ALTER TABLE `review` DROP FOREIGN KEY `Review_propertyId_fkey`;

-- DropForeignKey
ALTER TABLE `review` DROP FOREIGN KEY `Review_userId_fkey`;

-- AlterTable
ALTER TABLE `amenity` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `booking` DROP PRIMARY KEY,
    DROP COLUMN `endDate`,
    DROP COLUMN `startDate`,
    ADD COLUMN `bookingStatus` VARCHAR(191) NOT NULL,
    ADD COLUMN `checkinDate` DATETIME(3) NOT NULL,
    ADD COLUMN `checkoutDate` DATETIME(3) NOT NULL,
    ADD COLUMN `numberOfGuests` INTEGER NOT NULL,
    ADD COLUMN `totalPrice` DECIMAL(65, 30) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `userId` VARCHAR(191) NOT NULL,
    MODIFY `propertyId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `host` DROP PRIMARY KEY,
    ADD COLUMN `aboutMe` VARCHAR(191) NOT NULL,
    ADD COLUMN `password` VARCHAR(191) NOT NULL,
    ADD COLUMN `phoneNumber` VARCHAR(191) NOT NULL,
    ADD COLUMN `profilePicture` VARCHAR(191) NOT NULL,
    ADD COLUMN `username` VARCHAR(191) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `property` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `hostId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `propertyamenity` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `propertyId` VARCHAR(191) NOT NULL,
    MODIFY `amenityId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `review` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `userId` VARCHAR(191) NOT NULL,
    MODIFY `propertyId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    ADD COLUMN `phoneNumber` VARCHAR(191) NOT NULL,
    ADD COLUMN `profilePicture` VARCHAR(191) NOT NULL,
    ADD COLUMN `username` VARCHAR(191) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `Property` ADD CONSTRAINT `Property_hostId_fkey` FOREIGN KEY (`hostId`) REFERENCES `Host`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `Property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `Property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PropertyAmenity` ADD CONSTRAINT `PropertyAmenity_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `Property`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PropertyAmenity` ADD CONSTRAINT `PropertyAmenity_amenityId_fkey` FOREIGN KEY (`amenityId`) REFERENCES `Amenity`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
