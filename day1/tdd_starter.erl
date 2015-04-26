-module(tdd_starter).
-export([sum/2, product/2]).
-include_lib("eunit/include/eunit.hrl").

sum(A, B) -> A + B.

product(A, B) -> A * B.

sum_test() ->
	?assertEqual(0, sum(0, 0)),
	?assertEqual(2, sum(1, 1)).

product_test() ->
	?assertEqual(0, product(1, 0)),
	?assertEqual(3, product(3, 1)),
	?assertEqual(6, product(3, 2)).
