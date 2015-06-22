# Erlang - day 2
Erlang learnings - tips and tricks

## Syntax
Remember:
* atoms are lower-case
* _ matches anything
* Variables start with an Upper-case letter
* All statements end with a period.
* Multiple-clauses are separated; with semi-colons
* Lines in a function definition are seperated by commas
* Anonymous functions are defined with fun
* List literals are defined with [...] 
* List comprehensions take the form [ X * 2 || X <- stuff ]
* Lists have a Head | Tail
* Tuples are defined with {...}
* Namespace:function

## Pattern matching vs. Guards
Pattern matching is like a case statement, where if a thing matches an expression a clause is evaluated. A guard very similar, but instead of matching a value to an expression, a predicate is evaluated and the clause evaluated only if the predicate is true.

## Exercises
### Lookup in tuple-list by key
Consider a list of keyword-value tuples, such as [{erlang, "a functional language"}, {ruby, "an OO language"}] - write a function that accepts the list and a keyword and returns the associated value for the keyword

This seems simple enough:
```erlang
lookup([], _) -> false;
lookup(List, Word) ->
    element(2, hd(lists:filter(fun({X,_}) -> X == Word end, List))).
```

As it happens there is a function in the lists library that looks up keys from tuple-lists (obviously this is a very common thing) called 'keyfind':

```erlang
lookup([], _) -> false;
lookup(List, Word) ->
    element(2, lists:keyfind(Word, 1, List)).
```

### Shopping list
Consider a shopping list that looks like: [{item, quantity, price}, ...] - Write a list comprehension that builds a list of items of the form [{item, total_price}, ...] where total_price is quantity times price.

Again, this seemed a pretty simple solution:
```erlang
total([]) -> [];
total(List) -> [ {Item, Quantity * Price} || {Item, Quantity, Price} <- List].
```

## Bonus problem
### Write a program that reads a tic-tac-toe board 
The board is presented as a list or a tuple of size nine. Return the winner ( 'x' or 'o' ) if a winner has been determined, 'cat' if there are no more possible moves, or 'no_winner' if no player has won yet.

From (much) past experience, this is a longer peice of work.
The TDD versions of the above with tests can be found on Github [here](https://github.com/sleepyfox/7L7W-Erlang/tree/master/day2). 


