# Usage
# ./repos-to-push.sh
# Works in a directory containing your git hosted projects.

# Explanation
#
# - Pipe the output of ls to basho
# - Directory entries start with 'd'. Filter them.
# - Named each item 'dirname'
# - Read git config file and call it 'config'
# - Find the position of [remote "origin"] in the config
# - Call it (the position) 'remotepos'
# - Filter if remotepos not found
# - Club dirname,config,remotepos
# - Find the actual url at remotepos + 1
# - Get the user/org name and project name
# - git remote set-url origin git@github.com:${ORG}/${PROJECT}.git
# - Print glorious success

ls -alt | \
  basho 'x.split(/\s+/)'  \
  -f 'x.length>2'  \
  -f 'x[0].startsWith("d")' \
  -j 'x.slice(-1)[0]'  \
  -f '![".", ".."].includes(x)' \
  -n dirname \
  -e 'cat ${x}/.git/config' \
  -n config \
  -j 'x.indexOf("[remote \"origin\"]")' \
  -n remotepos \
  -f 'x >= 0' \
  -c dirname,config,remotepos \
  -j 'x[1][x[2]+1]' \
  -f 'x.includes("url = https://github.com/")' \
  -j 'x.trim().substring("url = https://github.com/".length)' \
  -j 'x.split("/")' \
  -e 'cd ${x[1]} && git remote set-url origin git@github.com:${x[0]}/${x[1]}.git' \
  -s dirname \
  -j '`Fixed ${x}`'

