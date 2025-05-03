#!/bin/bash

set -e

# テンプレートパス
TEMPLATE_PATH="./music/_template/template.mscz"

# 引数チェック
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <曲名（小文字）> <アルバム名またはYouTubeチャンネル名（小文字）>"
  exit 1
fi

SONG_NAME="$1"
ALBUM_NAME="$2"

# 曲名バリデーション
if [[ ! "$SONG_NAME" =~ ^[a-z0-9\ ]+$ ]]; then
  echo "エラー: 曲名は小文字とスペースのみを使用してください。"
  exit 1
fi

# アルバム名バリデーション
if [[ ! "$ALBUM_NAME" =~ ^[a-z0-9\ ]+$ ]]; then
  echo "エラー: アルバム名またはチャンネル名は小文字とスペースのみを使用してください。"
  exit 1
fi

# ファイル名用にスネークケースに変換
FILENAME=$(echo "$SONG_NAME" | tr ' ' '_' )

# 作成先パス
TARGET_DIR="./music/$SONG_NAME/$ALBUM_NAME"
TARGET_FILE="$TARGET_DIR/${FILENAME}.mscz"

# ディレクトリ作成
mkdir -p "$TARGET_DIR"

# ファイルコピー
cp "$TEMPLATE_PATH" "$TARGET_FILE"

echo "✔ コピー完了: $TARGET_FILE"
