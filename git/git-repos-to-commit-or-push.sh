# Usage
# ./git-repos-to-commit-or-push.sh

# Explanation
#
# 1. Pipe the output of ls to basho
# 2. flatten the array to get a list of directory names
# 3. Named each item 'dirname'
# 4. cd into the directory and do a 'git status'
# 5. Check if the output of 'git status' has 'nothing to commit' or 'branch is up-to-date'
# 6. If not, print the previously saved 'dirname'

ls -alt | basho 'x.split(/\s+/)' \
  -f 'x.length>2' \
  -j 'x.slice(-1)[0]' \
  -f '![".", ".."].includes(x)' \
  -n dirname \
  -e 'cd ${x} && git status' -f 'x.some(_ => /branch is ahead/.test(_)) || (!x.some(_ => /nothing to commit/.test(_)) && !x.some(_ => /branch is up-to-date/.test(_)))' \
  -s dirname
