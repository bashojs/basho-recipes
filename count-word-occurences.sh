# Usage
# echo "some lalala long text goes here lalala" | ./count-word-occurences.sh lalala

basho -d word "\"$1\"" -r 'acc+x' '""' -j '(x.match(new RegExp(k.word, "g")) || []).length'