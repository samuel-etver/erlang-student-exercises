% e023

-module(e023).
-export([sublist/2]).
-export([testAll/0]).


sublist(S, L) when length(S) > length(L) ->
    false;
sublist(S, L) ->
    F = start_with(S, L),
    if F ->
        true;
    true ->
        [_ | L_Tail] = L,
        sublist(S, L_Tail)
    end.


start_with([], _) ->
    true;
start_with([Head | S_Tail], [Head | L_Tail]) ->
    start_with(S_Tail, L_Tail);
start_with(_, _) ->
    false.


test(S, L) -> 
    Result = sublist(S, L),
    io:fwrite("List ~w is sublist of ~w: ~w~n", [S, L, Result]).


testAll() ->
    test([2], [1, 2, 3]),
    test([b, c], [a, b, d, c]),
    test([b, a], [a, b, b, a, c]),
    test([a, b, c], [a, b, b, c, e, d]).
