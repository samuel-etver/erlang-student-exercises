% e028

-module(e028).
-export([mean/1]).
-export([testAll/0]).


mean(L) -> 
    {Sum, N} = sum(L, 0, 0),
    Sum / N.


sum([], Sum, N) ->
    {Sum, N};
sum([Head | Tail], Sum, N) ->
    sum(Tail, Sum + Head, N + 1).


test(L) -> 
    Result = mean(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [1, 2, 3, 4, 5],
    test(L1),

    L2 = [7, 7, 7, 7, 7],
    test(L2),

    L3 = [1, 2],
    test(L3).
