#! /bin/bash

# Make build directory & copy required files over
if [ -d "build" ]; then
  rm -rf build
fi
mkdir build
cp --recursive -v index.html LICENSE.txt images build
mkdir build/assets
cp --recursive -v assets/fonts assets/icons build/assets
mkdir build/assets/css
cp --recursive -v assets/css/images assets/css/font-awesome.min.css build/assets/css
mkdir build/assets/js
cp --recursive -v assets/js/jquery.min.js assets/js/skel.min.js build/assets/js

# Minify js & css
echo "minifying main CSS file"
curl -X POST -s --data-urlencode 'input@assets/css/main.css' https://cssminifier.com/raw > build/assets/css/main.css
echo "minifying JavaScript files"
curl -X POST -s --data-urlencode 'input@assets/js/main.js' https://javascript-minifier.com/raw > build/assets/js/main.js
curl -X POST -s --data-urlencode 'input@assets/js/util.js' https://javascript-minifier.com/raw > build/assets/js/util.js