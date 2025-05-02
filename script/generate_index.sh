#!/bin/bash

# スクリプトが置かれているディレクトリから1つ上に移動してルートに移動
cd "$(dirname "$0")/.." || exit 1

# 現在のディレクトリから再帰的に検索
find . -type d | while read -r dir; do
  # SVGが1つ以上存在するか
  svg_files=("$dir"/*.svg)
  if compgen -G "$dir"/*.svg > /dev/null && [ ! -f "$dir/index.md" ]; then
    echo "生成: $dir/index.md"
    {
      for svg in "${svg_files[@]}"; do
        filename=$(basename "$svg")
        echo "![${filename%.*}]($filename)"
      done
    } > "$dir/index.md"
  fi
done