% e024

-module(e024).
-export([subset/2]).
-export([testAll/0]).


subset(S, L) ->
    subset(S, L, []).


subset(S, L, []) when length(S) > length(L) ->
    false;
subset([], _, _) ->
    true;
subset([Head], [Head | _], _) ->
    true;
subset([Head | S_Tail], [Head | L_Tail], Acc) ->
    subset(S_Tail, Acc ++ L_Tail, []);
subset(_, [], _) ->
    false;
subset(S, [L_Head | L_Tail], Acc) ->
    subset(S, L_Tail, Acc ++ [L_Head]).


test(S, L) -> 
    Result = subset(S, L),
    io:fwrite("List ~w is subset of ~w: ~w~n", [S, L, Result]).


testAll() ->
    S1 = [],
    L1 = [1, 2, 3],
    test(S1, L1),

    S2 = [7, 8],
    L2 = [1, 9, 8, 7],
    test(S2, L2),

    S3 = [b, e],
    L3 = [a, b, d, c],
    test(S3, L3),

    S4 = [1, 2, 3],
    L4 = [1, 5, 8, 3, 6, 9],
    test(S4, L4),

    S5 = [a, b, c],
    L5 = [a, b, b, c, e, d],
    test(S5, L5).
