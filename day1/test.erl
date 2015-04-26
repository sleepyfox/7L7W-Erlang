-module(test).
-export([fac/1]).

main([String]) ->
  N = list_to_integer(String),
  F = fac(N),
  io:format("factorial ~w = ~w\n", [N,F]).

fac(0) -> 1;
fac(N) -> N * fac(N - 1).
