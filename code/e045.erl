% e045

-module(e045).
-export([oddeven_sort/1]).
-export([testAll/0]).


oddeven_sort(L) ->
    {NextList1, EvenSorted} = even_rearrange(L),
    {NextList2, OddSorted}  = odd_rearrange(NextList1),
    if EvenSorted and OddSorted ->
        NextList2;
    true ->
        oddeven_sort(NextList2)
    end.


odd_rearrange([]) ->
    {[], true};
odd_rearrange([Head | Tail]) ->
    {R, Sorted} = even_rearrange(Tail),
    {[Head] ++ R, Sorted}.


even_rearrange(L) ->
    even_rearrange(L, [], true).


even_rearrange(L, Acc, Sorted) when length(L) =< 1 ->
    {Acc ++ L, Sorted};
even_rearrange([Head1, Head2 | Tail], Acc, Sorted) ->
    if Head1 < Head2 ->
        even_rearrange(Tail, Acc ++ [Head1, Head2], Sorted);
    true->
        even_rearrange(Tail, Acc ++ [Head2, Head1], false)
    end.


test(L) ->     
    Result = oddeven_sort(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [3, 1, 4, 2],
    test(L1),
    
    L2 = [-2, -1, 0],
    test(L2),
    
    L3 = [9, 0, 4, 7, -1, 3],
    test(L3).
