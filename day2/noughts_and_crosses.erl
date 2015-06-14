% Write a program that reads a Noughts and Crosses board,
% presented as a list or a tuple of size nine. 
% Return the winner ( 'x' or 'o' ) if a winner has been determined, 
% 'cat' if there are no more possible moves, 
% or no_winner if no player has won yet.

-module(noughts_and_crosses).
-include_lib("eunit/include/eunit.hrl").

evaluate_board(Board) -> 
    case lists:any(fun(X) -> X == 0 end, Board) of
        true -> no_winner;
        false -> cat
    end.

empty_board_returns_no_winner_test() ->
    ?assertEqual(no_winner, evaluate_board([0,0,0,0,0,0,0,0,0])).

full_board_returns_cat_test() ->
    ?assertEqual(cat, evaluate_board([x,x,x,x,x,x,x,x,x])).

full_mixed_board_returns_cat_test() ->
    ?assertEqual(cat, evaluate_board([x,o,x,o,x,o,x,o,x])).