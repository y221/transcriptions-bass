# create_new_mscz.sh

このスクリプトは`music/_template/template.mscz` を元に `.mscz` ファイルを作成するツールです。\
新規でファイル作成する際に実行します。

## 使い方

```
$ sh script/create_new_mscz.sh "<曲名>" "<アルバム名またはYouTubeチャンネル名>"
```

# generate_readme.sh

このスクリプトは.svg ファイルが含まれるディレクトリを再帰的に探索し、README.md を自動生成するツールです。
SVGファイルをエクスポートした後に実行します。

## 使い方

```
$ sh script/generate_readme.sh
```
