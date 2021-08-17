# Usage
# ./pull-all-repos.sh
# Works in a directory containing your git projects.

# Explanation
#
# 1. Pipe the output of ls to basho
# 2. Directory entries start with 'd'. Filter them.
# 3. Named each item 'dirname'
# 4. cd into the directory and do a 'git pull'
# 5. Call it gitstatus
# 5. Seek dirname,gitstatus and print

ls -alt | \
  basho 'x.split(/\s+/)'  \
  -f 'x.length>2'  \
  -f 'x[0].startsWith("d")' \
  -j 'x.slice(-1)[0]'  \
  -f '![".", ".."].includes(x)' \
  -n dirname \
  -e 'cd ${x} && git pull' \
  -n gitstatus \
  -s dirname \
  -c dirname,gitstatus
