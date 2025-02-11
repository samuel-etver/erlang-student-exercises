% e050

-module(e050).
-export([start_timer/0]).
-export([testAll/0]).


start_timer() ->
    Pid = spawn(fun on_notify/0),
    start_timer(0, Pid).


start_timer(Count, OnNotifyPid) ->
    timer:apply_after(1000, fun on_timer/2, [Count, OnNotifyPid]).


on_timer(10, OnNotifyPid) ->
    OnNotifyPid ! {done};
on_timer(Count, OnNotifyPid)->
    start_timer(Count + 1, OnNotifyPid),    
    OnNotifyPid ! {print, Count}.


on_notify() ->
    receive
        {print, Count} ->
            io:fwrite("Count: ~w~n", [Count]),
            on_notify();
        {done} ->
            io:fwrite("Done!~n")
    end.


test() ->     
    start_timer().


testAll() ->
    test().
