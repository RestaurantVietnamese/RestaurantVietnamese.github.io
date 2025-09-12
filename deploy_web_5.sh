#!/bin/bash

echo "🔄 Checkout code branch"
git checkout feature/fix_screenshot_mobile_web || exit

echo "🛠 Building web..."
flutter build web || exit

echo "📁 Copying build to temp"
mkdir -p ~/web_temp
cp -r build/web/* ~/web_temp/

echo "🚀 Switching to main"
git checkout main || exit

echo "🧹 Cleaning main branch"
find . -maxdepth 1 ! -name '.' ! -name '.git' -exec rm -rf {} +

echo "📥 Copying web build into main"
cp -r ~/web_temp/* ./

echo "📦 Committing and pushing"
git add .
git commit -m "Deploy web from feature/fix_screenshot_mobile_web"
git push --force origin main
git checkout feature/fix_screenshot_mobile_web

echo "✅ Done!"
