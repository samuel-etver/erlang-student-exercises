% e017

-module(e017).
-export([fac/1]).
-export([testAll/0]).


fac(N) ->
    fac(N, 1).


fac(0, Acc) ->
    Acc;
fac(N, Acc) ->
    fac(N - 1, Acc * N).


test(N) -> 
    Result = fac(N),
    io:fwrite("Factorial of ~w: ~w~n", [N, Result]).


testAll() ->        
    test(5),
    test(0),    
    test(8),
    test(3).
