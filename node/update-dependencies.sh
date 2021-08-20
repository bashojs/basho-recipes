# Usage
# ./update-dependencies.sh

cat package.json | basho --json -j 'Object.keys(x.dependencies)' -m x -e 'npm install ${x}@latest'