-- CreateTable
CREATE TABLE `anime`
(
    `id`            INTEGER       NOT NULL AUTO_INCREMENT,
    `title`         VARCHAR(1024) NOT NULL,
    `title_english` VARCHAR(1024) NULL,
    `synopsis`      TEXT NULL,
    `img_url`       VARCHAR(1024) NULL,
    `episodes`      INTEGER NULL,
    `pegi_id`       INTEGER NULL,
    `airing`        VARCHAR(1024) NULL,
    `aired`         TINYINT NULL,

    INDEX           `pegi_id_idx`(`pegi_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `article`
(
    `id`          INTEGER      NOT NULL AUTO_INCREMENT,
    `title`       VARCHAR(512) NOT NULL,
    `body`        TEXT         NOT NULL,
    `created_at`  DATETIME(0) NOT NULL,
    `author_id`   INTEGER NULL,
    `cover_id`    INTEGER NULL,
    `category_id` SMALLINT NULL,

    INDEX         `cover_id_idx`(`cover_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `article_categories`
(
    `id`       INTEGER      NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(512) NOT NULL,
    `bg_color` VARCHAR(45) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `authorities`
(
    `username`  VARCHAR(50) NOT NULL,
    `authority` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`username`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `comment`
(
    `id`         INTEGER NOT NULL AUTO_INCREMENT,
    `body`       TEXT    NOT NULL,
    `user_id`    INTEGER NOT NULL,
    `post_date`  DATE NULL,
    `anime_id`   INTEGER NULL,
    `article_id` SMALLINT NULL,
    `list_id`    INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `genre`
(
    `id`   INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(512) NULL,

    UNIQUE INDEX `name_UNIQUE`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `has_genre`
(
    `id`       INTEGER NOT NULL AUTO_INCREMENT,
    `id_anime` INTEGER NULL,
    `id_genre` INTEGER NULL,

    INDEX      `id_anime_idx`(`id_anime`),
    INDEX      `id_genre_idx`(`id_genre`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `has_producer`
(
    `id`          INTEGER NOT NULL AUTO_INCREMENT,
    `id_anime`    INTEGER NULL,
    `id_producer` INTEGER NULL,

    INDEX         `id_idx`(`id_anime`),
    INDEX         `id_idx1`(`id_producer`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `has_studio`
(
    `id`        INTEGER NOT NULL AUTO_INCREMENT,
    `id_anime`  INTEGER NULL,
    `id_studio` INTEGER NULL,

    INDEX       `has_anime_key_idx`(`id_anime`),
    INDEX       `has_studio_key_idx`(`id_studio`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `imagesuploaded`
(
    `id`      INTEGER      NOT NULL AUTO_INCREMENT,
    `content` BLOB         NOT NULL,
    `name`    VARCHAR(128) NOT NULL,

    UNIQUE INDEX `Image_id_uindex`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `islistedin`
(
    `id`       INTEGER NOT NULL AUTO_INCREMENT,
    `list_id`  INTEGER NOT NULL,
    `anime_id` INTEGER NOT NULL,

    INDEX      `isListedIn_Anime_FK`(`anime_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `list`
(
    `id`          INTEGER      NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(128) NOT NULL,
    `date`        DATE NULL,
    `description` VARCHAR(2056) NULL,
    `is_owned_by` INTEGER      NOT NULL,
    `is_default`  SMALLINT NULL DEFAULT 0,

    INDEX         `list_users_id_fk`(`is_owned_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `malanime`
(
    `malid`         INTEGER NOT NULL AUTO_INCREMENT,
    `aired`         VARCHAR(512) NULL,
    `airing`        VARCHAR(45) NULL,
    `episodes`      VARCHAR(45) NULL,
    `genres`        VARCHAR(2048) NULL,
    `image_url`     VARCHAR(128) NULL,
    `producers`     VARCHAR(2048) NULL,
    `rating`        VARCHAR(45) NULL,
    `studios`       VARCHAR(1024) NULL,
    `synopsis`      TEXT NULL,
    `title`         VARCHAR(512) NULL,
    `title_english` VARCHAR(512) NULL,

    PRIMARY KEY (`malid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pegi`
(
    `id`   INTEGER NOT NULL AUTO_INCREMENT,
    `pegi` VARCHAR(1024) NULL,

    UNIQUE INDEX `pegi_UNIQUE`(`pegi`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `producer`
(
    `id`   INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(512) NULL,

    UNIQUE INDEX `name_UNIQUE`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rating`
(
    `user_id`  INTEGER NOT NULL,
    `anime_id` INTEGER NOT NULL,
    `rate` DOUBLE NULL,

    INDEX      `rating_users_id_fk`(`user_id`),
    PRIMARY KEY (`anime_id`, `user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `studio`
(
    `id`   INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(512) NULL,

    UNIQUE INDEX `name_UNIQUE`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `token`
(
    `tokenid`         INTEGER NOT NULL AUTO_INCREMENT,
    `token`           VARCHAR(64) NULL,
    `expiration_date` DATETIME(0) NULL,
    `user_id`         INTEGER NULL,

    PRIMARY KEY (`tokenid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users`
(
    `id`        INTEGER     NOT NULL AUTO_INCREMENT,
    `username`  VARCHAR(64) NOT NULL,
    `password`  VARCHAR(64) NOT NULL,
    `enabled`   BOOLEAN NULL DEFAULT true,
    `firstname` VARCHAR(64) NOT NULL,
    `lastname`  VARCHAR(64) NOT NULL,
    `email`     VARCHAR(64) NOT NULL,
    `gender`    VARCHAR(1) NULL,
    `bio`       TEXT NULL,
    `image_id`  INTEGER     NOT NULL,
    `ip`        VARCHAR(64) NOT NULL,

    UNIQUE INDEX `users_username_uindex`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `anime`
    ADD CONSTRAINT `pegi_id` FOREIGN KEY (`pegi_id`) REFERENCES `pegi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `article`
    ADD CONSTRAINT `cover_id` FOREIGN KEY (`cover_id`) REFERENCES `imagesuploaded` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `authorities`
    ADD CONSTRAINT `authorities_users_username_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `has_genre`
    ADD CONSTRAINT `id` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `has_genre`
    ADD CONSTRAINT `id_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `has_producer`
    ADD CONSTRAINT `id_anime_has_producer` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `has_producer`
    ADD CONSTRAINT `id_producer_has_producer` FOREIGN KEY (`id_producer`) REFERENCES `producer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `has_studio`
    ADD CONSTRAINT `has_anime_key` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `has_studio`
    ADD CONSTRAINT `has_studio_key` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `islistedin`
    ADD CONSTRAINT `isListedIn_Anime_FK` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `list`
    ADD CONSTRAINT `list_users_id_fk` FOREIGN KEY (`is_owned_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rating`
    ADD CONSTRAINT `rating_anime_id_fk` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rating`
    ADD CONSTRAINT `rating_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

