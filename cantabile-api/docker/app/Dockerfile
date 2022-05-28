# これはビルダーパターンと呼ばれていて、コンパイルする環境と実行する環境を分ける Dockerfile のパターン
# ADD: リモートからもファイル追加できる。圧縮ファイルが自動解凍される
# COPY: リモートからのファイル追加は出来ない。圧縮ファイルは自動解凍されない
FROM golang:1.17.6 as base

# ディレクトリが存在しない場合は作成されるのか？
WORKDIR /app/go/base

COPY go.mod ./ 
COPY go.sum ./
COPY ./docker/bin/base ./
RUN chmod +x ./base && ./base
COPY . .

FROM golang:1.17.6 as builder
WORKDIR /app/go/builder

COPY --from=base /app/go/base /app/go/builder
# RUN chmod +x ./docker/bin/build && ./docker/bin/build
RUN CGO_ENABLED=0 go build cmd/app/main.go

FROM alpine:3.15 as production
WORKDIR /app
# https://qiita.com/watawuwu/items/d547d0cb1ab1db5e079c
RUN apk --no-cache add ca-certificates
# TODO: 以下に変更できたらする
# RUN chmod +x ./docker/bin/install && ./docker/bin/install
# root ユーザだとなんでもできてしまうため appuser を作成する
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /app/go/builder/main ./app/main
# コンテナを立ち上げたとき、勝手にWeb サーバーを立ち上げる
# docker-composeで指定するcommandはDockerfileよりも優先される
CMD ["./main"]