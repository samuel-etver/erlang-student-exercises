% e001

-module(e001).
-export([length_of_list/1]).
-export([testAll/0]).


length_of_list(L) ->
    length_of_list(L, 0).


length_of_list([], Count) -> 
    Count;
length_of_list([_ | Tail], Count) -> 
    length_of_list(Tail, Count + 1).


test(L) ->
    N = length_of_list(L),
    io:fwrite("The Length of ~w: ~w~n", [L, N]).

testAll() ->    
    L1 = [],
    test(L1),

    L2 = [1, 2, 3, 5, 6, 7],
    test(L2),

    L3 = [bob, jane, david, laura],
    test(L3).
