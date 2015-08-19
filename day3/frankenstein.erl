-module(frankenstein).
-behaviour(supervisor).
-export([ start_link/0, init/1]).

start_link() ->
    supervisor:start_link(?MODULE, []).

init(_Args) ->
    {ok, {{one_for_one, 3, 60},
        [{roulette,
            {roulette, start, []},
                permanent, 1000, worker, [roulette]}]}}.

% init(_Args) ->
%     SupFlags = #{strategy => one_for_one, intensity => 3, period => 60},
%     ChildSpecs = [#{id => frankenstein,
%                     start => {frankenstein, start_link, []},
%                     restart => permanent,
%                     shutdown => brutal_kill,
%                     type => worker,
%                     modules => [frankenstein]}],
%     {ok, {SupFlags, ChildSpecs}}.