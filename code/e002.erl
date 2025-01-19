% e002

-module(e002).
-export([reverse/1]).
-export([testAll/0]).


reverse([]) ->
    [];
reverse([A]) ->
    [A];
reverse([Head | Tail]) ->
    reverse(Tail) ++ [Head].


test(L) ->
    io:fwrite("Input: ~w~n", [L]),
    Reversed = reverse(L),    
    io:fwrite("Reversed: ~w~n", [Reversed]),
    io:fwrite("---~n").


testAll() ->    
    L1 = [],
    test(L1),

    L2 = [one],
    test(L2),

    L3 = [1, 2, 3, 4, 5, 6, 7],
    test(L3),

    L4 = [bob, jane, david, laura],
    test(L4).
