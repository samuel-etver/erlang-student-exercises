% e035

-module(e035).
-export([qsort2/1]).
-export([testAll/0]).


qsort2(L) when length(L) =< 1 ->
    L;
qsort2(L) ->
    {SubL, SubR} = split(L),
    SortedL = qsort2(SubL),
    SortedR = qsort2(SubR),
    merge(SortedL, SortedR).


split(L) ->
    split(L, [], []).


split(L, Acc1, Acc2) when length(L) =< 1 ->
    {Acc1 ++ L, Acc2};
split([Head1, Head2 | Tail], Acc1, Acc2) ->
    split(Tail, Acc1 ++ [Head1], Acc2 ++ [Head2]).


merge(L1, L2) ->
    merge(L1, L2, []).


merge(L1, [], Acc) ->
    Acc ++ L1;
merge([], L2, Acc) ->
    Acc ++ L2;
merge([Head1 | Tail1], [Head2 | Tail2], Acc) ->
    if Head1 < Head2 ->
        merge(Tail1, [Head2 | Tail2], Acc ++ [Head1]);
    true ->
        merge([Head1 | Tail1], Tail2, Acc ++ [Head2])
    end.


test(L) -> 
    Result = qsort2(L),    
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
