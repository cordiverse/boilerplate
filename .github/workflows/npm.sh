mkdir -p $RUNNER_TEMP/dist
cp -a * $RUNNER_TEMP/dist
cp -a .github $RUNNER_TEMP/dist
cp -a .vscode $RUNNER_TEMP/dist
cp -a .yarn $RUNNER_TEMP/dist
cp .* $RUNNER_TEMP/dist
mv $RUNNER_TEMP/dist dist

cd dist

rm -rf node_modules

# do not ignore lockfiles
sed -i .gitignore \
-e '/yarn.lock/d'

cat package.json | jq ".version=\"0.0.0-$GITHUB_SHA\" | .private=false" > package.json.tmp
mv -f package.json.tmp package.json

cd ..
tar -czf dist.tgz dist
npm publish dist.tgz --access public --tag nightly
