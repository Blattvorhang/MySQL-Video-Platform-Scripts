-- Crate database for movie management system
CREATE DATABASE `movie_management`
  CHARACTER SET 'utf8mb4'
  COLLATE 'utf8mb4_general_ci';
USE `movie_management`;

-- Create user table
CREATE TABLE `user` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50)
);

-- Create video table
CREATE TABLE `video` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(50),
  `score` FLOAT,
  `starring` VARCHAR(100),
  `date` DATE,
  `description` TEXT,
  `path` VARCHAR(200)
);

-- Create message table
CREATE TABLE `message` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT,
  `description` TEXT,
  `date` DATE,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);

-- Create user-video collection relationship table
CREATE TABLE `user_video_collect` (
  `user_id` INT,
  `video_id` INT,
  PRIMARY KEY (`user_id`, `video_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
  FOREIGN KEY (`video_id`) REFERENCES `video`(`id`)
);
