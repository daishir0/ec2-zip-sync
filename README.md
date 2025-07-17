# ec2-zip-sync

## Overview
`ec2-zip-sync` is a simple batch script that connects to a remote Linux (e.g., EC2) server via SSH, streams a `.zip`-compressed version of a specified directory, and extracts it directly into the local working directory. It overwrites any previous copy automatically to ensure a clean one-way sync.

## Installation
1. Clone this repository:
```sh
   git clone https://github.com/daishir0/ec2-zip-sync
   cd ec2-zip-sync
````

2. Ensure the following are installed and available in your PATH:

   * OpenSSH (`ssh`)
   * PowerShell (`Expand-Archive`)
   * A valid `.pem` file (for SSH authentication)

## Usage

```sh
ec2-zip-sync.bat /remote/absolute/path/to/directory
```

Example:

```sh
ec2-zip-sync.bat /home/your-user/myproject
```

## Notes

* The target local directory will be **automatically deleted and replaced** on each execution.
* The server must have `zip` installed.
* Tested on Windows 10+ with UTF-8 terminal (`chcp 65001`).

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

# ec2-zip-sync

## 概要

`ec2-zip-sync` は、リモートLinuxサーバー（例: EC2）にSSH接続し、指定ディレクトリを `.zip` 形式でストリーミング圧縮・ダウンロードして、ローカルの作業ディレクトリに展開するシンプルなバッチスクリプトです。ローカルに既存の同名ディレクトリがある場合は、自動で上書きされます。

## インストール方法

1. このリポジトリをクローンします:

   ```cmd
   git clone https://github.com/daishir0/ec2-zip-sync
   cd ec2-zip-sync
   ```

2. 以下がインストール済みでPATHに通っていることを確認してください:

   * OpenSSH（`ssh`）
   * PowerShell（`Expand-Archive`）
   * SSH接続用の`.pem`鍵ファイル

## 使い方

```cmd
ec2-zip-sync.bat /remote/absolute/path/to/directory
```

使用例:

```cmd
ec2-zip-sync.bat /home/your-user/myproject
```

## 注意点

* 実行時に、同名のローカルディレクトリは**削除され、上書き**されます。
* サーバー側に `zip` コマンドがインストールされている必要があります。
* Windows 10以降で `chcp 65001` によりUTF-8対応している必要があります。

## ライセンス

このプロジェクトはMITライセンスの下でライセンスされています。詳細はLICENSEファイルを参照してください。