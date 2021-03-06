CREATE DATABASE /*!32312 IF NOT EXISTS*/`mybatis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybatis`;

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '作者id',
  `username` VARCHAR(20) DEFAULT NULL COMMENT '用户名',
  `password` VARCHAR(20) DEFAULT NULL COMMENT '密码',
  `email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作者表';

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `title` VARCHAR(20) DEFAULT NULL COMMENT '博客标题',
  `author_id` INT(10) UNSIGNED NOT NULL COMMENT '作者id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_fk` (`author_id`),
  CONSTRAINT `author_fk` FOREIGN KEY (`author_id`) REFERENCES `author`(`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='博客表';


DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `blog_id` INT(10) UNSIGNED NOT NULL COMMENT '博客标题',
  `content` TEXT DEFAULT NULL COMMENT '博客内容',
  `draft` INT NOT NULL COMMENT '草稿',
  PRIMARY KEY (`id`),
  CONSTRAINT `blog_fk` FOREIGN KEY (`blog_id`) REFERENCES `blog`(`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='发布表';

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `post_id` INT(10) UNSIGNED NOT NULL COMMENT '博客标题',
  `content` TEXT DEFAULT NULL COMMENT '博客内容',
  PRIMARY KEY (`id`),
  CONSTRAINT `post_fk` FOREIGN KEY (`post_id`) REFERENCES `post`(`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';

