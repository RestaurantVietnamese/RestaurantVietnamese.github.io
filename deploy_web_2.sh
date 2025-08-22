#!/bin/bash

# Đường dẫn build web tuyệt đối
BUILD_PATH="/Users/pch/Desktop/personal/web_g18/build/web"
TEMP_PATH="$HOME/web_temp"

echo "🔄 Checkout code branch"
git checkout feature/code_game || exit

echo "📁 Copying build from $BUILD_PATH to temp ($TEMP_PATH)"
mkdir -p "$TEMP_PATH"
cp -r "$BUILD_PATH"/* "$TEMP_PATH"/

echo "🚀 Switching to main"
git checkout main || exit

echo "🧹 Cleaning main branch"
find . -maxdepth 1 ! -name '.' ! -name '.git' -exec rm -rf {} +

echo "📥 Copying web build into main"
cp -r "$TEMP_PATH"/* ./

echo "📦 Committing and pushing"
git add .
git commit -m "Deploy web from feature/code_game"
git push --force origin main

echo "✅ Done!"
