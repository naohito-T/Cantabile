# migrate

当プロジェクトのマイグレーションディレクトリ

[参考URL](https://yuzu441.hateblo.jp/entry/2019/06/11/150000)

## migration ファイル　ベストプラティクス

{version}_{title}.up.{extension}
{version}_{title}.down.{extension}

イメージとしては{version}に連番を振るかtimestampを使うのが推奨されてるようです

1_initialize_schema.down.sql
1_initialize_schema.up.sql
2_add_table.down.sql
2_add_table.up.sql
...

# or

1500360784_initialize_schema.down.sql
1500360784_initialize_schema.up.sql
1500445949_add_table.down.sql
1500445949_add_table.up.sql

## DB想定

パスワード認証した際に、user_authにpasswordが記載される。
そのidを元にuserてーbル「に書き込みデフォルトuserを作成する。