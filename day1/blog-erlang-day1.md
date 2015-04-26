# Erlang - day 1
Erlang learnings - tips and tricks

## Installation
This turns out on Ubuntu to be as simple as:

	$ sudo apt-get install erlang erlang-doc

## More info
I sometimes find that having something explained in a different way can help when I'm struggling to understand that. Whilst the official doco is OK, if somewhat dry, another source of good learning material is the online version of the book 'Learn you some Erlang for great good' [here](http://learnyousomeerlang.com/content).

## REPL
Just type:

	$ erl

Unlike most REPLs, ^d won't exit (nor will ^c - although you will get a menu  which includes an exit choice), instead ^g will bring up the 'user switch' menu and then 'q' will quit ('h' for help lists all available commands).

## Running Erlang programs from the command line
This is a bit more involved than (say) Ruby. First the program must be compiled

	$ erlc my_program.erl

Then the program must be invoked from the CLI, like so:

	$ escript my_program.erl argument1

Your program must be written such that it has a main function, like so:

```erlang
main([String]) ->
  N = list_to_integer(String),
  F = fac(N),
  io:format("factorial ~w = ~w\n", [N,F]).
```

## TDD in Erlang
Erlang has a XUnit-style unit-testing library called 'eunit' (unsurprisingly) which can be found [here]. It's pretty simple to use, create a test file called tdd_starter.erl like so:

```erlang
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
	?assertEqual(5, product(3, 2)).
```

Compile the tests using:

	$ erlc tdd_starter.erl

Run tests using the REPL:

	$ erl

and once in the REPL use:

```
	1> eunit:test(tdd_starter,[verbose]).
	======================== EUnit ========================
	module 'tdd_starter'
	  tdd_starter: sum_test...ok
	  tdd_starter: product_test...*failed*
	in function tdd_starter:'-product_test/0-fun-2-'/1 (tdd_starter.erl, line 16)
	**error:{assertEqual_failed,[{module,tdd_starter},
	                     {line,16},
	                     {expression,"product ( 3 , 2 )"},
	                     {expected,5},
	                     {value,6}]}


	  [done in 0.005 s]
	=======================================================
	  Failed: 1.  Skipped: 0.  Passed: 1.
	error
```
This shows that there was a problem in our tests - two times three does not equal six, as it happens. Once corrected (and compiled) we get the expected output:
```
	5> eunit:test(tdd_starter,[verbose]).
	======================== EUnit ========================
	module 'tdd_starter'
	  tdd_starter: sum_test...ok
	  tdd_starter: product_test...ok
	  [done in 0.005 s]
	=======================================================
	  All 2 tests passed.
	ok
```
We can also use:

	> tdd_starter:test().

Which has the same effect.

## Find
* The Erlang language’s official site - found [here](http://www.erlang.org/)
* Official documentation for Erlang’s function library - Not so obvious, but can be found [here](http://www.erlang.org/doc/apps/stdlib/index.html)
* The documentation for Erlang’s OTP library - A list of all OTP 'applications' and their APIs can be found [here](http://www.erlang.org/doc/applications.html)
##Do
* Write a function that uses recursion to return the number of
words in a string.
* Write a function that uses recursion to count to ten.
* Write a function that uses matching to selectively print “success”
or “error: message” given input of the form {error, Message} or suc-
cess .
