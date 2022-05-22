# これはビルダーパターンと呼ばれていて、コンパイルする環境と実行する環境を分ける Dockerfile のパターン
# ADD: リモートからもファイル追加できる。圧縮ファイルが自動解凍される
# COPY: リモートからのファイル追加は出来ない。圧縮ファイルは自動解凍されない
FROM golang:1.17.6 as builder
WORKDIR /workspace
COPY . /workspace

RUN chmod +x ./docker/bin/build && ./docker/bin/build

FROM alpine:3.15
WORKDIR /app
# https://qiita.com/watawuwu/items/d547d0cb1ab1db5e079c
# RustでAlpineからHTTPS
RUN apk --no-cache add ca-certificates
# TODO: 以下に変更できたらする
# RUN chmod +x ./docker/bin/install && ./docker/bin/install
# root ユーザだとなんでもできてしまうため appuser を作成する
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /workspace/main ./
# コンテナを立ち上げたとき、勝手にWeb サーバーを立ち上げる
CMD ["./main"]