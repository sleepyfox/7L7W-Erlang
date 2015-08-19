-module(translate_monitor).
-export([monitor/0, loop/0, translate/1]).

loop() ->
    receive
        {From, "casa"} -> 
            From ! "house", 
            loop();
        
        
        {From, "blanca"} -> 
            From ! "white", 
            loop();
        
        {From, _} -> 
            From ! "I don't understand.", 
            exit({translate_monitor,die,at,erlang:time()})
    end.

translate(Word) ->
    whereis(worker) ! {self(), Word}, 
    receive
        Translation -> Translation
    end.

monitor() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("creating a new translator worker~n"),
            register(worker, spawn_link(fun translate_monitor:loop/0)),
            monitor();
        {'EXIT', From, Reason} ->
            io:format("Translator worker ~p died because of ~p~n", [From, Reason]),
            self() ! new,
            monitor()
        end.
