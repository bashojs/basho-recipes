# Usage

# The first argument is the text to match
# echo "some lalala long text goes here lalala" | count-matching-words.sh lalala
basho -d word "\"$1\"" -j '(x.match(new RegExp(k.word, "g")) || []).length'