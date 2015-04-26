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

## Data types


## TDD in Erlang
Run tests using:

	$

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
