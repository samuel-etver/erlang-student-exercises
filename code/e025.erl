% e025

-module(e025).
-export([split/1]).
-export([testAll/0]).


split(L) ->
    split(L, [], []).


split([], PosAcc, NegAcc) ->
    [{positive, PosAcc},
     {negative, NegAcc}];
split([Head | Tail], PosAcc, NegAcc) ->
    if Head >= 0 ->
        split(Tail, PosAcc ++ [Head], NegAcc);
    true ->
        split(Tail, PosAcc, NegAcc ++ [Head])
    end.


test(L) -> 
    [{positive, P},
     {negative, N}] = split(L),
    io:fwrite("Input: ~w~n", [L]),
    io:fwrite("Positive: ~w~n", [P]),
    io:fwrite("Negative: ~w~n", [N]),
    io:fwrite("---~n").


testAll() ->
    L1 = [1, -2, 3, -4, 5],
    test(L1),

    L2 = [1, -9, -8, -7],
    test(L2),

    L3 = [1, 5, -8, 3, 6, 9],
    test(L3),
    
    L4 = [1, 2, 3],
    test(L4).
