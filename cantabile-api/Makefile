.PHONY: \
	start \
	build \
	down \

# ログの色
R := \e[31m
G := \e[32m
B := \e[34m
N := \e[0m

start:
	docker-compose down && docker-compose up -d

# Dockerfileを更新した際にbuildしてください
build:
	docker-compose build $(SERVICE)

down:
	docker-compose down