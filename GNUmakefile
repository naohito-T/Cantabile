# Makefileの場合、個々のコマンド列は直接シェルによって実行されるのではなく、一旦makeによって解釈されるという点に気をつけなくてはいけません。
# makefile中の コマンドはほかのシェルを指定しない限り、つねに‘/bin/sh’によって 解釈されます

SHELL=/bin/bash

.PHONY: \
	setup \
	migration.create \
	migration.up \
	migration.down \
	migration.force \
	encrypt \
	decrypt \
	help \
	start \
	build \
	down \
	log \

# ログの色
R := \e[31m
G := \e[32m
B := \e[34m
N := \e[0m

# マイグレーションディレクトリ
MIGRATION_SOURCE_DIR := "migrations"
# マイグレーション source 
MIGRATIONS := file://${PWD}/cantabile-api/migrations/

# MIGRATION_SOURCE := "file://${PWD}/app/migration/"
# マイグレーション 対象DB
MIGRATION_DATABASE := "mysql://root:password@tcp(127.0.0.1:33306)/cantabile"

MYSQL_USER ?= root
MYSQL_PASS ?= password
MYSQL_HOST ?= 127.0.0.1
MYSQL_PORT ?= 33306
MYSQL_DBNAME ?= cantabile

# 最終的に必要なツールが判明次第、対応する
setup:
	which migrate || brew install golang-migrate

# マイグレーションファイルを作成する
migration.create: setup
	@printf '${B}%s\n' "# Migration file create.";\
	cd cantabile-api &&\
		migrate -database ${MIGRATION_DATABASE} create -ext sql -dir ${MIGRATION_SOURCE_DIR} ${NAME}

migration.up: setup
	@printf '${B}%s\n' "# Migration up Start.";\
	cd cantabile-api &&\
		migrate -database ${MIGRATION_DATABASE} -source ${MIGRATIONS} up

migration.down: setup
	@printf '${B}%s\n' "# Migration down start.";\
	cd cantabile-api &&\
		migrate -database ${MIGRATION_DATABASE} -source ${MIGRATIONS} down

# migrationgの整合性が取れなくなった時に使用する OPTIONにmigration versionを渡す
migration.force: setup
	@printf '${B}%s\n' "# Migration force Start.";\
	cd cantabile-api &&\
		migrate -database ${MIGRATION_DATABASE} -source ${MIGRATIONS} force ${OPTION}

mysql:
	mysql -u${MYSQL_USER} -p${MYSQL_PASS} -h${MYSQL_HOST} -P${MYSQL_PORT} ${MYSQL_DBNAME}

encrypt:
	_var := "暗号化開始します。"
	@make _log $(_var)
	./bin/envtool encrypt 

decrypt:
	_var := "See help envtool."
	@make _log $(_var)
	./bin/envtool decrypt

help:
	./bin/envtool help

start:
	@printf '${B}%s\n' "# Cantabile project start.";\
	docker-compose down && docker-compose up

# Dockerfileを更新した際にbuildしてください
build:
	@printf '${G}%s\n' "# Cantabile project build.";\
	docker-compose build $(SERVICE)

down:
	@printf '${R}%s\n' "# Cantabile project down.";\
	docker-compose down


# 関数
_log: $(message)
	printf '${B}%s\n' "$(message)";\


