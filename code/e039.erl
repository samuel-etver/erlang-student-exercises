% e039

-module(e039).
-export([has_duplicates/1]).
-export([testAll/0]).


has_duplicates(L) ->
    Sorted = lists:sort(L),
    has_duplicated_in_sorted(Sorted).


has_duplicated_in_sorted([]) ->
    false;
has_duplicated_in_sorted([Head, Head | _]) ->
    true;
has_duplicated_in_sorted([_ | Tail]) ->
    has_duplicated_in_sorted(Tail).    


test(L) -> 
    Result = has_duplicates(L),    
    io:fwrite("List ~w has duplicates: ~w~n",  [L, Result]).


testAll() ->
    L1 = [1, 2, 3, 4, 5, 6], 
    test(L1),
    
    L2 = [1, 2, 3, 3, 4],
    test(L2),

    L3 = [1, 4, 5, 3, 1],
    test(L3).
