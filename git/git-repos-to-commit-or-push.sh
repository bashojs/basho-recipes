ls | basho 'x.split("\t")' \
  -m x \
  -n dirname \
  -e 'cd ${x} && git status' \
  -f '!x.some(_ => /nothing to commit/.test(_)) && !x.some(_ => /branch is up-to-date/.test(_))' \
  -s dirname