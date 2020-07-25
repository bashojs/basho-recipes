ls | basho 'x.split("\t")' \
  -m x \
  -n dirname \
  -e 'cd ${x} && git remote update && git status' \
  -f 'x.some(_ => /branch is behind/.test(_))' \
  -s dirname