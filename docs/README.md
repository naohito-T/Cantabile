# Cantabile Docs

Cantabile project Documents.

## アーキテクチャ

3層アーキテクチャで実装している
今後はgolangを生かしてサーバーレスで実装したい

## ディレクトリ構成

```sh
.
├── cantabile-api     # アプリケーションサーバ
├── cantabile-infra   # インフラ
├── cantabile-server  # Webサーバ
└── cantabile-ui      # フロント
```

## envについて

ルートディレクトリにある、envについてはdocker-compose用