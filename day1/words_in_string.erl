-module(words_in_string).
-include_lib("eunit/include/eunit.hrl").

words_in_string_test() ->
	?assertEqual(0, words_in_string("")),
	?assertEqual(1, words_in_string("Gold")),
	?assertEqual(2, words_in_string("White Gold")),
	?assertEqual(3, words_in_string("White Gold Wielder")).

count_words_with_empty_string_test() ->
	?assertEqual(1, count_words("", 1, space)),
	?assertEqual(0, count_words("", 0, space)).

count_words_with_one_character_test() ->
	?assertEqual(1, count_words("z", 0, space)),
	?assertEqual(0, count_words("z", 0, letter)).

count_words_with_one_word_followed_by_space_test() ->
	?assertEqual(1, count_words("z ", 0, space)),
	?assertEqual(1, count_words("z  ", 0, space)).

count_words_with_one_word_preceded_by_space_test() ->
	?assertEqual(1, count_words(" z", 0, space)),
	?assertEqual(1, count_words("  z", 0, space)).

count_words_with_one_word_surrounded_by_space_test() ->
	?assertEqual(1, count_words(" z ", 0, space)),
	?assertEqual(1, count_words("  z  ", 0, space)).

count_words_with_cat_test() ->
	?assertEqual(1, count_words("cat", 0, space)),
	?assertEqual(1, count_words("cat ", 0, space)),
	?assertEqual(1, count_words(" cat", 0, space)),
	?assertEqual(1, count_words("cat", 0, space)).

count_words_with_2_words_test() ->
	?assertEqual(2, count_words("lol cat", 0, space)),
	?assertEqual(2, count_words("lol  cat", 0, space)),
	?assertEqual(2, count_words("lol cat ", 0, space)),
	?assertEqual(2, count_words(" lol cat", 0, space)),
	?assertEqual(2, count_words(" lol cat ", 0, space)).

% Base case
words_in_string("") ->
	0;
% Initialise the count_words function
words_in_string(Z) ->
	count_words(Z, 0, space).

%
% A space followed by a non-space indicates a word,
% as does the first non-space of a string
%
% Base case: if there's nothing left, return the count of words
count_words("", Words, _) ->
	Words;
% else recursivly reduce the string
% ( a reducer wouldn't work here because of the need to keep
%   track of the state of the last letter encountered ) 
count_words([32|Tail], Words, _) ->
	count_words(Tail, Words, space);
count_words([_|Tail], Words, space) ->
	count_words(Tail, Words + 1, letter);
count_words([_|Tail], Words, letter) ->
	count_words(Tail, Words, letter).
