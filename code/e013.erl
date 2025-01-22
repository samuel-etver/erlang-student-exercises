% e013

-module(e013).
-export([ordered/1]).
-export([testAll/0]).


ordered([Head | Tail]) ->
    LastNumber = Head,
    ordered(Tail, LastNumber).


ordered([Head | _], LastNumber) when Head < LastNumber ->
    false;
ordered([], _) ->
    true;
ordered([Head | Tail], _) ->
    ordered(Tail, Head).


test(L) -> 
    Result = ordered(L),
    io:fwrite("Is list ~w ordered? ~w~n", [L, Result]).


testAll() ->        
    L1 = [0, 1, 7, 9, 50],
    test(L1),

    L2 = [1, 2, 3, 8, 5, 6, 7],
    test(L2),
    
    L3 = [10],
    test(L3),
    
    L4 = [7, 6, 9],
    test(L4).
