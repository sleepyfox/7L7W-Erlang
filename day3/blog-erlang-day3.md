# Erlang - day 3
Erlang learnings - tips and tricks

# Concurrency and actors
* recieve
* Pid ! message
* spawn(fun module:function/num_args)

If you want to type a pid at the command line (shell/REPL) then you cannot type it in directly, you need to use a BIF pid/3 like this:

> pid(0,123,0).
> <0.123.0>
> process_info(pid(0,123,0)).
> [{current_function,{erl_eval,do_apply,6}},
>  {initial_call,{erlang,apply,2}},
>  ...

# Exercises
## Find
### An OTP service that will restart a process if it dies
Simples: Supervisor, documentation [here](http://www.erlang.org/doc/design_principles/sup_princ.html). There's also a whole chapter devoted to Supervisors in Learn you some Erlang, [here](http://learnyousomeerlang.com/supervisors).

### Documentation for building a simple OTP server
There doesn't appear to be a simple answer to this, analogous to the Node.js http library. Whilst Erlang has [inets](http://ftp.sunet.se/pub/lang/erlang/doc/apps/inets/http_server.html#id59283) it is not at the same level of abstraction, and there doesn't seem to be anything quite like bottle/express/sinatra either. I'll have to keep looking...

## Do
### Monitor the translate_service and restart it should it die.
This seems like a good opportunity to use the supervisor behavioural pattern in Erlang.

> $ Monitor = spawn(fun translate_monitor:monitor/0).
> <0.40.0>
> $ Monitor ! new.
> creating a new translator worker
> new
> $ translate_monitor:translate("blanca").
> "white"

### Make the Doctor process restart itself if it should die.
Self-res? No probs. Oh, wait - how can I restart myself if I'm dead? Answer: I can't. What I can do is:
* Catch a kill signal and ignore it. This won't stop a brutal_kill however.
* Start a monitoring service that will monitor me and if I die then it will restart me. This doesn't help because it just pushes the failure question one step up the chain.

Indeed the only (sensible) answer to this is to use supervisor.

### Make a monitor for the Doctor monitor. If either monitor dies, restart it.
Who watches the watchers? In this case a Doctor-Doctor? We can certainly set up a pair of monitors that restart each other if they should die, but this becomes a bit silly. Again, use supervisor.

# Thoughts
That about wraps it up for Erlang, I've enjoyed using Erlang much more than I expected, especially considering the last time I used Erlang (many years ago) when the tooling was very C-like. It still feels a bit 'old-school', as expectations around package management and syntactic sugar have evolved, but I'm hoping Elixir will address this #7morelanguagesin7moreweeks
