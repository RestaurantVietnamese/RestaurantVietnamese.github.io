#!/bin/bash

# Đường dẫn build web tuyệt đối
BUILD_PATH="/Users/pch/Desktop/personal/web_g18/build/web"
TEMP_PATH="$HOME/web_temp"

echo "🔄 Checkout code branch"
git checkout feature/code_game || exit 1

echo "📁 Copying build from $BUILD_PATH to temp ($TEMP_PATH)"
rm -rf "$TEMP_PATH"
mkdir -p "$TEMP_PATH"
cp -r "$BUILD_PATH"/* "$TEMP_PATH"/

echo "🚀 Switching to main"
git checkout main || exit 1

echo "🧹 Cleaning main branch (remove everything except .git)"
shopt -s extglob
rm -rf !(.git)

echo "📥 Copying web build into main"
cp -r "$TEMP_PATH"/* ./

echo "📦 Committing and pushing"
git add .
git commit -m "Deploy web from feature/code_game"
git push --force origin main

echo "✅ Done!"
