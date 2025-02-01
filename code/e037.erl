% e036

-module(e037).
-export([palindrom/1]).
-export([testAll/0]).


palindrom(L) ->
    Reversed = reverse(L),
    equal(L, Reversed).


reverse(L) ->
    reverse(L, []).


reverse([], Acc) ->
    Acc;
reverse([Head | Tail], Acc) ->
    reverse(Tail, [Head] ++ Acc).


equal([], []) ->
    true;
equal(L1, L2) when length(L1) =/= length(L2) ->
    false;
equal([Head | Tail1], [Head | Tail2]) ->
    equal(Tail1, Tail2);
equal(_, _) ->
    false.


test(L) -> 
    Result = palindrom(L),    
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [m, a, d, a, m],
    test(L1),

    L2 = [d, a, d],
    test(L2),

    L3 = [c, a, t],
    test(L3),
    
    L4 = [t, a, c, o],
    test(L4).
