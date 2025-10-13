#!/bin/bash

echo "🔄 Checkout code branch"
git checkout restaurant || exit

echo "🛠 Building web (PROD)..."
flutter build web -t lib/main_prod.dart || exit

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
git commit -m "Deploy web from restaurant"
git push --force origin main
git checkout restaurant

echo "✅ Done!"
