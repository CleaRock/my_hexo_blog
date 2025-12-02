#!/bin/bash

echo "== 1. Hexo Clean & Generate =="
hexo clean
hexo g

echo "== 2. Deploy to Nginx =="
rm -rf /var/www/html/*
cp -r public/* /var/www/html/

echo "== 3. Reload Nginx =="
nginx -s reload

echo "== Deployment Completed =="
