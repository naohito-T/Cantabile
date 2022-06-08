# Structure


## ディレクトリ構成

[リファレンス](https://github.com/golang-standards/project-layout)
[リファレンスを解説している記事](https://qiita.com/sueken/items/87093e5941bfbc09bea8)

---

## DBマイグレーション

[参考URL](https://dev.classmethod.jp/articles/db-migrate-with-golang-migrate/)

GoでのORM自体がマイグレーションをCLIを提供していないため使い勝手が悪い。
そのためGo専用のマイグレーションツール（いろいろなDBに使える）golang-migrateでDBマイグレーションをする。

```sh
$ migrate -version
v4.15.2
```

.up
マイグレーションを進めるクエリ

.down
マイグレーションを戻す用のクエリ

### 特徴

特徴としては、マイグレーションを定義しているファイルをGitHubやAWS S3などから直接参照することができること（もちろんローカルのファイルシステムにも対応している）
また対応しているデータベースエンジンも多く、MySQLやPostgreSQL以外にもMongoDBなどにも対応しているなど、様々な場面で使うことができるツール。

## docker-composeとの兼ね合い

docker-composeでは、初期にDBは用意するがマイグレーションなどはアプリケーション層で用意させる。

## マイグレーションを考える

goの汎用的ツールでやる？？
SESにdeployするためどうなる？
とりあえずはいいかも

dbでマイグレーションを叩く？ init スクリプト

アプリケーション層で、最初にマイグレーションを実行する

`$ migrate -path cantabile-api/migrations -database "mysql://root:password@tcp(127.0.0.1:33306)/cantabile" force 20220602073412`