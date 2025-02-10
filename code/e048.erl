% e048

-module(e048).
-export([start_timer/0]).
-export([testAll/0]).


start_timer() ->
    start_timer(0).


start_timer(Count) ->
    timer:apply_after(1000, fun on_timer/1, [Count]).


on_timer(10) ->
    ok;
on_timer(Count)->
    start_timer(Count + 1),
    io:fwrite("Count: ~w~n", [Count]).


test() ->     
    start_timer().


testAll() ->
    test().
