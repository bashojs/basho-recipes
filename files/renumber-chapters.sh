# This re-numbers (a series of) directories named like 'ch04-js-tutorial', 'ch05-css-tutorial' etc after a specific insertion point, say '4'.
# the insertion point is defined with 'insertat' in the example below.
# This is useful if you want to insert a chapter.
ls | basho \
  -d insertat 2 \
  -n original \
  -f 'x.startsWith("ch")' \
  -j 'x.split("-")'  \
  -n parts \
  -j 'parseInt(x[0].substring(2))' \
  -j 'x < k.insertat ? x : x+1' \
  -j '`${x}`' \
  -j 'x.length > 1 ? x : `0${x}`' \
  -n renamed \
  -c parts,renamed \
  -j '`ch${x[1]}-${x[0][1]}`' \
  -n final \
  -c original,final \
  -f 'x[0] !== x[1]' \
  -n filtered \
  -e 'mv ${x[0]} ${x[1]}' \
  -s filtered \
  -j '`moved ${x[0]} to ${x[1]}`'
