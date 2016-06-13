$string1 = 'some string'
$single_word1 = check_if_single_word($string1)
notify{ "string1: $string1; single_word1: ${single_word1}": }

$string2 = 'some'
$single_word2 = check_if_single_word($string2)
notify{ "string2: $string2; single_word2: ${single_word2}": }

