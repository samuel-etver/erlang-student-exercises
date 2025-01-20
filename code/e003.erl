% e003

-module(e003).
-export([maximum/2]).
-export([testAll/0]).


maximum(A, B) when A > B ->
    A;
maximum(_, B) ->
    B.


test(A, B) ->
    M = maximum(A, B),
    io:fwrite("A=~w, B=~w. Maximum: ~w~n", [A, B, M]).


testAll() ->        
    A1 = 1, B1 = 2,
    test(A1, B1),

    A2 = 7, B2 = 1,
    test(A2, B2),

    A3 = 3, B3 = 3,
    test(A3, B3).
