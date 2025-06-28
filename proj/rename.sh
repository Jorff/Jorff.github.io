#!/bin/bash

# 定义前缀和后缀
prefix="netpic_20250628_1_"
suffix=".png"

shopt -s nullglob          # 若没有匹配文件也不报错
for f in $(ls image-*.png | sort -t'-' -k2 -n); do
  num=${f#image-}          # 去掉前缀 image-
  num=${num%.png}          # 去掉后缀 .png
  new=$((num + 1))         # 递增
  # 构建新文件名
  new_name="${prefix}${new}${suffix}"

  # 执行重命名
  mv "$f" "$new_name"

  # 输出执行信息（可选）
  echo "Renamed $f to $new_name"
done