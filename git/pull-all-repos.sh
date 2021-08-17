# Usage
# ./pull-all-repos.sh
# Works in a directory containing your git projects.

# Explanation
#
# - Pipe the output of ls to basho
# - Directory entries start with 'd'. Filter them.
# - Named each item 'dirname'
# - cd into the directory and do a 'git pull'
# - Call it gitstatus
# - Seek dirname,gitstatus and print

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
