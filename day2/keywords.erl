-module(keywords).
-include_lib("eunit/include/eunit.hrl").

lookup([], _) -> false;
lookup(List, Word) ->
    element(2, hd(lists:filter(fun({X,_}) -> X == Word end, List))).

empty_list_returns_null_test() ->
    ?assertEqual(false, lookup([], word)).

can_find_word_in_list_of_one_item_test() ->
    Animal = [{cat, "a feline"}],
    ?assertEqual("a feline", lookup(Animal, cat)).

can_find_word_in_list_of_three_items_test() ->
    Animals = [{fox, "a vulpine"}, {cat, "a feline"}, {dog, "a canine"}],
    ?assertEqual("a feline", lookup(Animals, cat)).
