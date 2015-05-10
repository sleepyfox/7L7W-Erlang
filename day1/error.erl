-module(error).
-include_lib("eunit/include/eunit.hrl").
-export([handler/1]).

handler(success) ->
  Result = "success",
  io:format("~s~n", [Result]),
  Result;

handler({error, Message}) ->
  Result = "error: " ++ Message,
  io:format("~s~n", [Result]),
  Result.

error_on_success_test() ->
  ?assertEqual("success", handler(success)).

error_on_fail_test() ->
  Output = handler({error, "There's an emergency happening!"}),
  ?assertEqual("error: There's an emergency happening!", Output).
