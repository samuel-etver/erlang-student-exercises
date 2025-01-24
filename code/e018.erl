% e018

-module(e018).
-export([move_zeroes/1]).
-export([testAll/0]).


move_zeroes(L) ->
    move_zeroes(L, [], []).


move_zeroes([], AccNumbers, AccZeroes) ->
    AccNumbers ++ AccZeroes;
move_zeroes([Head | Tail], AccNumbers, AccZeroes) ->
    if Head == 0 ->
        move_zeroes(Tail, AccNumbers, AccZeroes ++ [Head]);
    true ->
        move_zeroes(Tail, AccNumbers ++ [Head], AccZeroes)
    end.


test(L) -> 
    Result = move_zeroes(L),
    io:fwrite("Input: ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite('---~n').


testAll() ->        
    L1 = [0, 2, 0, 0, 5, 6, 0, 5],
    test(L1),

    L2 = [0, 0, 1, 2, 3, 0],
    test(L2),    

    L3 = [0, 9],
    test(L3),

    L4 = [5, 6, 7],
    test(L4).
