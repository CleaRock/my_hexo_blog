#!/bin/bash

echo "======================================="
echo "  🚀 Hexo 自动化部署脚本（增强版）"
echo "======================================="
echo ""

# 进入 Hexo 根目录
cd /root/myblog || exit

echo "== 1. 清理 Hexo 缓存 =="
hexo clean
echo ""

echo "== 2. 生成静态文件 (hexo g) =="
hexo g
echo ""

echo "== 3. 部署到 Nginx 目录 =="
NGINX_DIR="/var/www/html"
rm -rf ${NGINX_DIR:?}/*
cp -r public/* $NGINX_DIR/
echo "✔ 已部署到 $NGINX_DIR"
echo ""

echo "== 4. 推送 Hexo 源码到 GitHub main 分支 =="
git add .
git commit -m "Auto Deploy at $(date '+%Y-%m-%d %H:%M:%S')" || true
git push origin main
echo "✔ 已推送到 GitHub: CleaRock/my_hexo_blog"
echo ""

# ----（可选）启用 GitHub Pages 推送----
# 取消下面两行注释即可自动部署 public 到 gh-pages
# echo "== 5. 部署 public 到 GitHub Pages (gh-pages 分支) =="
# npx gh-pages -d public

# ----（可选）Cloudflare 清理缓存----
# 把 <EMAIL> <API_KEY> <ZONE_ID> 换成你的 CF 配置即可
# curl -X POST "https://api.cloudflare.com/client/v4/zones/<ZONE_ID>/purge_cache" \
#      -H "X-Auth-Email: <EMAIL>" \
#      -H "X-Auth-Key: <API_KEY>" \
#      -H "Content-Type: application/json" \
#      --data '{"purge_everything":true}'

echo ""
echo "======================================="
echo "   🎉 部署完成！你的博客已更新上线！"
echo "======================================="
