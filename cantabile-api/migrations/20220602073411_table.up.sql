-- CREATE TABLE IF NOT EXISTS users (
--     id serial,
--     name varchar(50) NOT NULL,
--     email varchar(256) NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     updated_at timestamp with time zone NOT NULL,
--     PRIMARY KEY (id)
-- );
CREATE TABLE IF NOT EXISTS users (
    id int primary key auto_increment comment 'USER ID',
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null comment 'user name',
    password varchar(255) not null comment 'password',
    age int not null comment '年齢',
    sex varchar(10) not null comment '性別',
    business varchar(255) comment '職業',
    annual_salary varchar(255) comment '職業',
    image_url varchar(255) comment 'プロフィール画像',
    delete int default 0 comment '削除ユーザ',
) COMMENT = 'USER テーブル' ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE IF NOT EXISTS personas (
    id int primary key auto_increment comment 'content id',
    created_at datetime not null,
    updated_at datetime not null,
    user_id int comment 'user table relation',
) COMMENT = 'Persona コンテンツテーブル' ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE IF NOT EXISTS authority (
    id int primary key auto_increment comment 'content id',
    created_at datetime not null,
    updated_at datetime not null,
    authority int default 0 comment '0 = 一般, 1 = read, 2 = 編集者, 3 管理者',
) COMMENT = '権限マスターテーブル' ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_bin;

-- migrate - path cantabile - api / migrations - database "mysql://root:password@tcp(127.0.0.1:33306)/cantabile" force 20220602073411