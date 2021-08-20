# Usage
# ./update-dev-dependencies.sh

cat package.json | basho --json -j 'Object.keys(x.devDependencies)' -m x -e 'npm install -D ${x}@latest'