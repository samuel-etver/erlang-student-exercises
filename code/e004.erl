% e004

-module(e004).
-export([maximum_in_list/1]).
-export([testAll/0]).


maximum(A, B) when A > B ->
    A;
maximum(_, B) ->
    B.


maximum_in_list([A]) ->
    A;
maximum_in_list([Head | Tail]) ->
    FoundMax = Head,
    maximum_in_list(Tail, FoundMax).


maximum_in_list([], FoundMax) ->
    FoundMax;
maximum_in_list([Head | Tail], FoundMax) ->
    NewMax = maximum(Head, FoundMax),
    maximum_in_list(Tail, NewMax).


test(L) ->
    io:fwrite("Input: ~w~n", [L]),
    M = maximum_in_list(L),
    io:fwrite("Maximum: ~w~n", [M]),
    io:fwrite("---~n").


testAll() ->        
    L1 = [4],
    test(L1),

    L2 = [1, 7, 2, -3, 5, 0],
    test(L2),

    L3 = [-1, -9, -4],
    test(L3).
