# Usage

# echo "some lalala long text goes here lalala" | ./count-word-occurences.sh lalala
# cat somefile.txt | ./count-word-occurences.sh lalala

# Explanation
#
# -d defines a constant named word available as 'k.word'
#    with a value $1, which is the first parameter to the shell script.
#
# -r acc+x reduces an array of lines (in the case of 'cat'ing a text file) to a string
# 
# -j matches the text with k.word which was set above, an returns the number of matches
#

basho -d word "\"$1\"" -r 'acc+x' '""' -j '(x.match(new RegExp(k.word, "g")) || []).length'