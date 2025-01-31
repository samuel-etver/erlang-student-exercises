% e034

-module(e034).
-export([qsort/1]).
-export([testAll/0]).


qsort(L) when length(L) =< 1 ->
    L;
qsort(L) ->
    {Root, SubL, SubR} = split(L),
    SortedL = qsort(SubL),
    SortedR = qsort(SubR),
    SortedL ++ [Root] ++ SortedR.


split([Head | Tail]) ->
    split(Tail, Head, [], []).


split([], Root, AccL, AccR) ->
    {Root, AccL, AccR};
split([Head | Tail], Root, AccL, AccR) ->
    if Head < Root ->
        split(Tail, Root, AccL ++ [Head], AccR);
    true ->
        split(Tail, Root, AccL, AccR ++ [Head])
    end.  


test(L) -> 
    Result = qsort(L),    
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [1, 3, 2],
    test(L1),

    L2 = [1, 2, 3],
    test(L2),

    L3 = [3, 2, 1],
    test(L3),

    L4 = [5, 7, 2, 5, 40, 2, 3, 1, 4],
    test(L4).
