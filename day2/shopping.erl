% Consider a shopping list that looks like: [{item quantity price}, ...]
% Write a list comprehension that builds a list of items of the form 
% [{item total_price}, ...] where total_price is quantity times price

-module(shopping).
-include_lib("eunit/include/eunit.hrl").

total([]) -> [];
total(List) -> [ {Item, Quantity * Price} || {Item, Quantity, Price} <- List].

total_of_empty_list_returns_same_test() ->
    ?assertEqual([], total([])).

total_of_list_with_one_item_test() ->
    ?assertEqual([{rock, 8}], total([{rock, 4, 2}])).

total_of_list_with_two_items_test() ->
    ?assertEqual([{pebble, 9}, {rock, 8}], total([{pebble, 3, 3}, {rock, 4, 2}])).