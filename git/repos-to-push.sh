# Usage
# ./repos-to-push.sh

# Explanation
#
# - Pipe the output of ls to basho
# - Directory entries start with 'd'. Filter them.
# - Named each item 'dirname'
# - cd into the directory and do a 'git status'
# - Check if the output of 'git status' has 'nothing to commit' or 'branch is up-to-date'
# - If not, print the previously saved 'dirname'

ls -alt | \
  basho 'x.split(/\s+/)'  \
  -f 'x.length>2'  \
  -f 'x[0].startsWith("d")' \
  -j 'x.slice(-1)[0]'  \
  -f '![".", ".."].includes(x)' \
  -n dirname \
  -e 'cd ${x} && git status' -f 'x.some(_ => /branch is ahead/.test(_)) || (!x.some(_ => /nothing to commit/.test(_)) && !x.some(_ => /branch is up-to-date/.test(_)))' \
  -s dirname
