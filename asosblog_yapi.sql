/*
 Navicat Premium Data Transfer

 Source Server         : AsosBlog
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : asosblog

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 24/07/2020 11:55:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_yazilari
-- ----------------------------
DROP TABLE IF EXISTS `blog_yazilari`;
CREATE TABLE `blog_yazilari`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(0) NOT NULL,
  `baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `resim_yolu` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `ozet` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `icerik` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `guncelleme_tarihi` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `k_id`(`kullanici_id`) USING BTREE,
  INDEX `b_kategori`(`kategori`) USING BTREE,
  CONSTRAINT `b_kategori` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`isim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `k_id` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inceleme_blog_yazilari
-- ----------------------------
DROP TABLE IF EXISTS `inceleme_blog_yazilari`;
CREATE TABLE `inceleme_blog_yazilari`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(0) NOT NULL,
  `baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `resim_yolu` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `ozet` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `icerik` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `guncelleme_tarihi` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `k_id`(`kullanici_id`) USING BTREE,
  INDEX `b_kategori`(`kategori`) USING BTREE,
  CONSTRAINT `inceleme_blog_yazilari_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`isim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inceleme_blog_yazilari_ibfk_2` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  INDEX `isim`(`isim`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kullanicilar
-- ----------------------------
DROP TABLE IF EXISTS `kullanicilar`;
CREATE TABLE `kullanicilar`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_adi` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `rol` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT 'yazar',
  `son_giris` datetime(0) NULL DEFAULT NULL,
  `kayit_tarihi` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `kullanici_adi`) USING BTREE,
  INDEX `rol`(`rol`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `rol` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  INDEX `role`(`rol`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
