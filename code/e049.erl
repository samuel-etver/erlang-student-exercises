% e049

-module(e049).
-export([start_timer/0]).
-export([testAll/0]).


start_timer() ->
    Pid = spawn(fun on_notify/0),
    start_timer(0, Pid).


start_timer(Count, OnNotifyPid) ->
    timer:apply_after(1000, fun on_timer/2, [Count, OnNotifyPid]).


on_timer(10, OnNotifyPid) ->
    OnNotifyPid ! done;
on_timer(Count, OnNotifyPid)->
    start_timer(Count + 1, OnNotifyPid),
    io:fwrite("Count: ~w~n", [Count]).


on_notify() ->
    receive done ->
        io:fwrite("Done!~n")
    end.


test() ->     
    start_timer().


testAll() ->
    test().
