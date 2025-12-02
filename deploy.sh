#!/bin/bash

echo "======================================="
echo "  🚀 Hexo 自动化部署脚本（增强版 · 安全版）"
echo "======================================="
echo ""

cd /root/myblog || exit

echo "== 1. Hexo Clean =="
hexo clean
echo ""

echo "== 2. Hexo Generate =="
hexo g
echo ""

echo "== 3. Deploy to Nginx =="
NGINX_DIR="/var/www/html"
rm -rf ${NGINX_DIR:?}/*
cp -r public/* $NGINX_DIR/
echo "✔ 部署到 $NGINX_DIR 完成"
echo ""

echo "== 4. 推送源码到 GitHub（排除 themes/public） =="

# 只添加 Hexo 源文件，不添加主题和 public
git add \
  _config.yml \
  package.json \
  package-lock.json \
  deploy.sh \
  source \
  scaffolds \
  themes/.gitkeep \
  .gitignore

git commit -m "Auto Deploy at $(date '+%Y-%m-%d %H:%M:%S')" || true
git push origin main

echo ""
echo "✔ GitHub 推送完成"
echo ""
echo "======================================="
echo "   🎉 完整部署成功！博客已更新上线"
echo "======================================="

