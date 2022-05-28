# Cantabile

## Description

Persona Management

## Setup

```sh
# Installation of a set of tools required for the project.
$ make setup

# Set environment variables required for the project.
$ make env-setup
```

## Project Start

The setup section must be completed before the project starts.

```sh
$ make start
```

## directory structure

```sh
.
├── GNUmakefile         # 当プロジェクトのタスクランナーツール（GNUmake製）
├── bin                 # タスクランナー & CIから使用されるスクリプト群
├── cantabile-api       # Application Server
├── cantabile-db        # DB
├── cantabile-infra     # amazon cdk
├── cantabile-server    # Web Server
├── cantabile-ui        # front
├── docker-compose.yml  # Docker Bundle
├── docs                # Project Docs
└── env                 # Project env's
```

## マイグレーション実行

DBのマイグレーションには [golang-migrate/migrate](https://github.com/golang-migrate/migrate) を使います。

以下のコマンドを実行することによってマイグレーションを行うことができます。

`migrate` コマンドがインストールされていない場合は自動で `brew install` されます。

```sh
make migration.up
```