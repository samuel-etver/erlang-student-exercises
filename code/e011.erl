% e011

-module(e011).
-export([last/1]).
-export([testAll/0]).


last([X]) ->
    X;
last([_ | Tail]) ->
    last(Tail).


test(L) -> 
    Result = last(L),
    io:fwrite("Last Element of List ~w: ~w~n", [L, Result]).


testAll() ->        
    L1 = [1, 2],
    test(L1),

    L2 = [1, 2, 3, 4, 5, 6, 7],
    test(L2),
    
    L3 = [mike, james, bob, greg, john],
    test(L3),
    
    L4 = [jane],
    test(L4).
