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

 Date: 24/07/2020 11:56:02
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
-- Records of blog_yazilari
-- ----------------------------
INSERT INTO `blog_yazilari` VALUES (1, 1, 'Güncel yazi 1', 'images/blog/yazi1.jpg', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'guncel', '2020-07-14 00:00:00');
INSERT INTO `blog_yazilari` VALUES (2, 1, 'Örnek Makale 1', 'images/blog/yazi1.jpg', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'guncel', '2020-07-14 00:00:00');
INSERT INTO `blog_yazilari` VALUES (3, 1, 'Örnek Makale 2', 'images/blog/yazi1.jpg', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'guncel', '2020-07-15 01:00:00');
INSERT INTO `blog_yazilari` VALUES (4, 1, 'Örnek Makale 3', 'images/blog/yazi1.jpg', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'guncel', '2020-07-14 00:00:00');
INSERT INTO `blog_yazilari` VALUES (5, 1, 'Örnek Mühendislik 1', 'images/blog/yazi1.jpg', 'Bir Web Sitesine Ait Kullanıcı Erişim Kayıtlarının Web Kullanım Madenciliği Yöntemiyle Analizi Fırat Üniversitesi', 'almia çok şeytan', 'muhendislik', '2020-07-15 02:26:09');
INSERT INTO `blog_yazilari` VALUES (6, 1, 'Bilgisayar Ağı Nedir? ', 'images/blog/yazi1.jpg', 'Bilgisayar Ağı Nedir? En az iki bilgisayarın birbirlerine bağlanıp, bilgi alış-verişinde bulunmasına bilgisayar ağı (Network) denir.', 'Bilgisayar Ağı Nedir? En az iki bilgisayarın birbirlerine bağlanıp, bilgi alış-verişinde bulunmasına bilgisayar ağı (Network) denir. Bilgisayar ağları, kullanıcılara bilgisayarlar arası bilgi paylaşımı yapabilecekleri bir ortam sağlar. Bilgisayar ağına bağlı kullanıcıların, ağın kaynaklarına ulaşması ve diğer kullanıcılarla iletişimde bulunması ağ kullanımının temel amacıdır. Bu da zaman ve para tasarrufu sağlar. Aynı mekanda bulunan ya da birbirine yakın bilgisayarların oluşturduğu ağlara yerel bilgisayar ağları (LAN, Local Area Network) denir. Bir ofiste bulunan birkaç bilgisayarın ve bir yazıcının birbirine bağlanması yerel bilgisayar ağına örnektir. Farklı mekanlarda bulunan ya da birbirlerinden uzak bilgisayarların oluşturduğu ağlara ise geniş bölge ağları (WAN, Wide Area Network) adı verilir. Geniş bölge ağları, yerel bölge ağlarını birbirine bağlar. Farklı ülkelerde birimleri olan büyük bir şirketin bilgisayar ağı, farklı ülkelerdeki yerel bilgisayar ağlarını birbirine bağlayarak geniş bölge ağı meydana getirir.\r\n\r\n\r\nMilyonlarca bilgisayardan oluşan, binlerce bilgisayar ağını birbirine bağlayan global ağa İNTERNET denir. Bu ağın bir yöneticisi yoktur. Internet kullanıcıları birbirleri ile haberleşmek için ortak bir anlaşma dili kullanırlar. Bu ortak anlaşma diline TCP/IP denir. Bu protokol sayesinde donanım ve yazılımdan bağımsız olarak bilgisayarlar arası iletişim mümkün olur. Bu anlaşma dilinde her bilgisayarın bir adresi vardır. Bu adresler numaralarla ifade edilir ve bilgisayarın IP adresi şeklinde ifade edilir. Tıpkı her evin bir adresi, her telefonun bir numarası olduğu gibi. Bu adreslere bilgiler en kestirme yoldan ulaşır. Ulaşım için diğer bilgisayarlardan yararlanılır. Haberleşen iki bilgisayar arasındaki diğer bilgisayarlar kendilerine ait olmayan bilgi paketlerini diğer bilgisayara aktarırlar.', 'guncel', '2020-07-15 12:13:25');
INSERT INTO `blog_yazilari` VALUES (7, 2, 'Deneme', 'images\\image\\yazi1.jpg', 'Deneme', 'Deneme', 'guncel', '2020-07-17 17:15:38');
INSERT INTO `blog_yazilari` VALUES (8, 2, 'Deneme 2', 'images\\image\\yazi1.jpg', 'Deneme 2', 'Bu bir deneme yazsıdır.', 'guncel', '2020-07-21 23:10:03');
INSERT INTO `blog_yazilari` VALUES (10, 2, 'deneme5', 'images\\image\\Ek Açıklama 2020-05-28 222856.png', 'Deneme5', 'çşüşsgetscbjhjh ', 'guncel', '2020-07-24 11:19:09');

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
-- Records of inceleme_blog_yazilari
-- ----------------------------
INSERT INTO `inceleme_blog_yazilari` VALUES (4, 2, 'Deneme3', 'images\\image\\yazi1.jpg', 'Deneme3', 'almilanın bebişleri', 'guncel', '2020-07-23 22:51:30');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  INDEX `isim`(`isim`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES ('akademik');
INSERT INTO `kategori` VALUES ('guncel');
INSERT INTO `kategori` VALUES ('muhendislik');

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
-- Records of kullanicilar
-- ----------------------------
INSERT INTO `kullanicilar` VALUES (1, 'Arzu Nur SEMIZ', 'arzunur', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'yazar', '2020-07-14 00:00:00', '2020-07-14 00:00:00');
INSERT INTO `kullanicilar` VALUES (2, 'arzu semiz', 'arzu12', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'editor', '2020-07-15 13:51:38', '2020-07-15 13:51:38');
INSERT INTO `kullanicilar` VALUES (3, 'arzu semiz', 'arzu13', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'yazar', '2020-07-15 13:59:34', '2020-07-15 13:59:34');
INSERT INTO `kullanicilar` VALUES (4, 'Ã¶zlem semiz', 'Ã¶ziÅ', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'yazar', '2020-07-15 14:23:26', '2020-07-15 14:23:26');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `rol` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  INDEX `role`(`rol`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('editor');
INSERT INTO `rol` VALUES ('yazar');

SET FOREIGN_KEY_CHECKS = 1;
