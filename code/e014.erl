% e014

-module(e014).
-export([shift/1]).
-export([testAll/0]).


shift([]) ->
    [];
shift([Head | Tail]) ->
    Tail ++ [Head].


test(L) -> 
    Result = shift(L),
    io:fwrite("Input: ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->        
    L1 = [0, 1, 7, 9, 50],
    test(L1),

    L2 = [1, 2, 3, 8, 5, 6, 7],
    test(L2),
    
    L3 = [10],
    test(L3),
    
    L4 = [ben, julia, antony],
    test(L4).
