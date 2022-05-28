.PHONY: \
	setup \
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

# 最終的に必要なツールが判明次第、対応する
setup:
	which aa || printf '${B}%s\n' "# dddd";\

# which migrate || brew install golang-migrate
# which sqlboiler ||\
# 	cd $(shell mktemp -d) &&\
# 	go install github.com/volatiletech/sqlboiler/v4@latest &&\
# 	go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-mysql@latest
# which openapi-generator || brew install openapi-generator
# cd app && ./envtool decrypt local



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
	printf '${B}%s\n' "# Cantabile project start.";\
	docker-compose down && docker-compose up

# Dockerfileを更新した際にbuildしてください
build:
	@printf '${G}%s\n' "# Cantabile project build.";\
	docker-compose build $(SERVICE)

down:
	printf '${R}%s\n' "# Cantabile project down.";\
	docker-compose down

# 最終的に必要なツールが判明次第、対応する
# setup:
# 	which migrate || brew install golang-migrate
# 	which sqlboiler ||\
# 		cd $(shell mktemp -d) &&\
# 		go install github.com/volatiletech/sqlboiler/v4@latest &&\
# 		go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-mysql@latest
# 	which openapi-generator || brew install openapi-generator
# 	cd app && ./envtool decrypt local



_log: $(message)
	printf '${B}%s\n' "$(message)";\


