% e016

-module(e016).
-export([between/2]).
-export([testAll/0]).


between(N1, N2) ->
    between(N1, N2, []).


between(N1, N2, Acc) when N1 >= N2 ->
    Acc;
between(N1, N2, Acc) ->
    between(N1 + 1, N2, Acc ++ [N1]).


test(N1, N2) -> 
    Result = between(N1, N2),
    io:fwrite("Input: N1=~w, N2=~w~n", [N1, N2]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->        
    test(1, 10),
    test(15, 20),    
    test(7,3).
