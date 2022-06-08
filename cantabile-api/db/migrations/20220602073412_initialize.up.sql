-- user tableはデフォルトで作る。
CREATE TABLE IF NOT EXISTS user (
    id int NOT NULL AUTO_INCREMENT comment 'user id',
    created_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updated_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    name varchar(255) NOT NULL comment 'userの名前（上下一緒）',
    age int NOT NULL DEFAULT 20 comment '年齢',
    sex enum ('0', '1', '2') NOT NULL DEFAULT '0' comment '1: man 2: woman',
    email varchar(255) UNIQUE NOT NULL comment 'email',
    business varchar(255) comment '職業',
    annual_salary varchar(255) comment '年収',
    image_url varchar(255) comment 'プロフィール画像',
    -- delete enum ('0', '1') DEFAULT 0 comment '削除ユーザ',
    PRIMARY KEY (id)
) COMMENT = 'USER テーブル' ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_bin;

-- 一番最初にloginした際にdbに保存する。
CREATE TABLE IF NOT EXISTS user_authority (
    id int NOT NULL AUTO_INCREMENT comment 'content id',
    created_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) comment '作成された日時',
    updated_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) comment 'アップデート日',
    password varchar(255) NOT NULL comment 'password',
    authority_id int NOT NULL comment 'マスターのid一つ',
    PRIMARY KEY (id)
) COMMENT = '権限マスターテーブル' ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_bin;

-- 権限マスタ
CREATE TABLE IF NOT EXISTS authority (
    id int NOT NULL AUTO_INCREMENT comment 'content id',
    created_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updated_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    authority enum ('0', '1', '2') DEFAULT '0' comment '0 = 一般, 1 = read, 2 = 編集者, 3 管理者',
    PRIMARY KEY (id)
) COMMENT = '権限マスターテーブル' ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_bin;

-- ペルソナコンテンツ
CREATE TABLE IF NOT EXISTS persona (
    id int NOT NULL AUTO_INCREMENT comment 'content id',
    created_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updated_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    user_id int comment 'user table relation',
    is_show tinyint NOT NULL DEFAULT 0 comment 'ペルソナコンテンツ非表示か',
    PRIMARY KEY (id)
) COMMENT = 'ペルソナコンテンツテーブル' ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_bin;