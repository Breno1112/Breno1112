rm -rf docs
ng build --output-path docs --base-href /Breno1112/
cp docs/index.html docs/404.html
git commit -am "new version"
git push