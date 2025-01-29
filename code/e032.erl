% e032

-module(e032).
-export([merge_sorted/2]).
-export([testAll/0]).


merge_sorted(L1, L2) ->
    merge_sorted(L1, L2, []).


merge_sorted(L1, [], Acc) ->
    Acc ++ L1;
merge_sorted([], L2, Acc) ->
    Acc ++ L2;
merge_sorted([Head1 | Tail1], [Head2 | Tail2], Acc) ->
    if Head1 < Head2 ->
        merge_sorted(Tail1, [Head2 | Tail2], Acc ++ [Head1]);
    true ->
        merge_sorted([Head1 | Tail1], Tail2, Acc ++ [Head2])
    end.


test(L1, L2) -> 
    Result = merge_sorted(L1, L2),    
    io:fwrite("Input:  L1=~w~n", [L1]),
    io:fwrite("        L2=~w~n", [L2]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1_1 = [1, 3, 5, 7, 9], 
    L1_2 = [0, 2, 4, 6, 8],
    test(L1_1, L1_2),

    L2_1 = [-3, 4, 12, 45, 67, 89, 120],
    L2_2 = [7, 100],
    test(L2_1, L2_2),

    L3_1 = [0],
    L3_2 = [-1, 1],
    test(L3_1, L3_2).
