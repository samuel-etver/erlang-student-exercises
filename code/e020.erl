% e020

-module(e020).
-export([divide_list/1]).
-export([testAll/0]).


divide_list(L) ->
    divide_list(L, [], []).


divide_list([], Acc1, Acc2) ->
    {Acc1, Acc2};
divide_list([Head1], Acc1, Acc2) ->
    {Acc1 ++ [Head1], Acc2};
divide_list([Head1, Head2 | Tail], Acc1, Acc2) ->
    divide_list(Tail, Acc1 ++ [Head1], Acc2 ++ [Head2]).


test(L) -> 
    {L1, L2} = divide_list(L),
    io:fwrite("Input:  L =~w~n", [L]),
    io:fwrite("Result: L1=~w~n", [L1]),
    io:fwrite("        L2=~w~n", [L2]),
    io:fwrite("---~n").


testAll() ->        
    test([0]),
    test([1,2,3,4,5,6,7,8]),
    test([11,12,13,14,15]).
