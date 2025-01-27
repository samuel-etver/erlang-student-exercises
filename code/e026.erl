% e026

-module(e026).
-export([split/1]).
-export([testAll/0]).


split(L) ->
    split(L, [], []).


split([], AtomsAcc, NumsAcc) ->
    [{atoms,   AtomsAcc},
     {numbers, NumsAcc}];
split([Head | Tail], AtomsAcc, NumsAcc) ->
    if is_integer(Head) ->
        split(Tail, AtomsAcc, NumsAcc ++ [Head]);
    true ->
        split(Tail, AtomsAcc ++ [Head], NumsAcc)
    end.


test(L) -> 
    [{atoms,   A},
     {numbers, N}] = split(L),
    io:fwrite("Input: ~w~n", [L]),
    io:fwrite("Atoms: ~w~n",   [A]),
    io:fwrite("Numbers: ~w~n", [N]),
    io:fwrite("---~n").


testAll() ->
    L1 = [1, tree, flower, -2, box, 3, -4, 5, man],
    test(L1),

    L2 = [1, hello, -9, world, -8, -7],
    test(L2),

    L3 = [1, 5, ok,  6, 9],
    test(L3).
