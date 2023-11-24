# beestrap

ISUCON**練習**向けにサーバセットアップを自動化・構成管理するためのリポジトリ

## ツール

各種ツール経由でインストールされるパッケージやツールは、各種設定ファイルを参照のこと

- [mitamae](https://github.com/itamae-kitchen/mitamae) ... システムパッケージや設定ファイルを展開
- [aqua](https://github.com/aquaproj/aqua) ... CLIツールをインストール

## インストール

sudoが使えるユーザで以下のコマンドを実行

```sh
curl https://raw.githubusercontent.com/corrupt952/beestrap/main/install.sh | bash
```
