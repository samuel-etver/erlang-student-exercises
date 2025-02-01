% e038

-module(e038).
-export([subsum/2]).
-export([testAll/0]).


subsum(L, S) ->
    subsum(L, S, []).


subsum(_, 0, Acc) ->
    Acc;
subsum([], _, _) ->
    [];
subsum([Head | Tail], S, Acc) ->
    Result = subsum(Tail, S - Head, Acc ++ [Head]),
    if Result == [] ->
        subsum(Tail, S, Acc);
    true ->
        Result
    end.


test(L, S) -> 
    Result = subsum(L, S),    
    io:fwrite("Input:  L=~w, SubSum=~w~n",  [L, S]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [1, 2, 3, 4, 5, 6], S1 = 9,
    test(L1, S1),
    
    L2 = L1, S2 = 21,
    test(L2, S2),

    L3 = L1, S3 = 40,
    test(L3, S3).
