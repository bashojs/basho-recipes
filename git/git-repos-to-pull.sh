# Usage
# ./git-repos-to-commit-or-push.sh

# Explanation
#
# 1. Pipe the output of ls to basho
# 2. flatten the array to get a list of directory names
# 3. Named each item 'dirname'
# 4. cd into the directory and do a 'git status'
# 5. Check if the output contains 'branch is behind'
# 6. If so, print the previously saved 'dirname'

ls | basho 'x.split("\t")' \
  -m x \
  -n dirname \
  -e 'cd ${x} && git remote update && git status' \
  -f 'x.some(_ => /branch is behind/.test(_))' \
  -s dirname