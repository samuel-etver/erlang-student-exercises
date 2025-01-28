% e029

-module(e029).
-export([median/1]).
-export([testAll/0]).


median(L) -> 
    Sorted = lists:sort(L),
    N = length(Sorted),
    Index = N div 2,
    Root = lists:nth(Index + 1, Sorted),
    Even = even(N),
    if Even ->
        (lists:nth(Index, Sorted) + Root) / 2;
    true ->
        Root
    end.


even(N) ->
    N rem 2 == 0.


test(L) -> 
    Result = median(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Median: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [-1, 1, 2, 3, 40],
    test(L1),

    L2 = [23, 45, 67, 1, 4, 120, -3],
    test(L2),

    L3 = [1, 2],
    test(L3).
