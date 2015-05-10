-module(counting).
-include_lib("eunit/include/eunit.hrl").
-export([count_to/1, count_to/2]).

count_to(0) -> ok;
count_to(Number) -> count_to(Number, 1).

count_to(Number, Count) when Count > Number -> ok;
count_to(Number, Count) ->
  io:format("~w~n", [Count]),
  count_to(Number, Count + 1).
