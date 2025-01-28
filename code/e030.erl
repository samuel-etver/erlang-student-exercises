% e030

-module(e030).
-export([get_element/2]).
-export([testAll/0]).


get_element([Head | _], 0) ->
    Head;
get_element([_ | Tail], N) when N > 0 ->
    get_element(Tail, N - 1).


test(L, N) -> 
    Result = get_element(L, N),
    io:fwrite("~wth element of list ~w: ~w~n", [N, L, Result]).


testAll() ->
    L1 = [-1, 1, 2, 3, 40], 
    N1 = 2,
    test(L1, N1),

    L2 = [23, 45, 67, 1, 4, 120, -3],
    N2 = 5,
    test(L2, N2),

    L3 = [1, 2],
    N3 = 0,
    test(L3, N3).
