% e009

-module(e009).
-export([sum/1]).
-export([testAll/0]).


sum(L) ->
    sum(L, 0).


sum([], Sum) ->
    Sum;
sum([Head | Tail], Sum) ->
    sum(Tail, Sum + Head).


test(L) -> 
    Result = sum(L),
    io:fwrite("Sum of list elements ~w: ~w~n", [L, Result]).


testAll() ->        
    L1 = [],
    test(L1),

    L2 = [1, 2, 3, 4, 5, 6, 7],
    test(L2),
    
    L3 = [1.3, 2.8, -7.1, 5.6],
    test(L3),
    
    L4 = [12],
    test(L4).
