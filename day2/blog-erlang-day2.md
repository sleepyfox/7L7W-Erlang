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
### Consider a list of keyword-value tuples, such as [{erlang, "a functional language"}, {ruby, "an OO language"}] - write a function that accepts the list and a keyword and returns the associated value for the keyword

This seems simple enough:
```erlang

```

### Consider a shopping list that looks like: [{item quantity price}, ...] - Write a list comprehension that builds a list of items of the form [{item total_price}, ...] where total_price is quantity times price

## Bonus problem
### Write a program that reads a tic-tac-toe board presented as a list or a tuple of size nine. Return the winner ( x or o ) if a winner has been determined, cat if there are no more possible moves, or no_winner if no player has won yet