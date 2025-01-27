% e027

-module(e027).
-export([double/1]).
-export([testAll/0]).


double(L) ->
    Double = fun(X) -> 2 * X end,
    map(L, Double).


map(L, Func) ->
    map(L, Func, []).


map([], _, Acc) ->
    Acc;
map([Head | Tail], Func, Acc) ->
    New = Func(Head),
    map(Tail, Func, Acc ++ [New]).


test(L) -> 
    Result = double(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [1, 2, 3],
    test(L1),

    L2 = [10, 20, 30, 40, 50],
    test(L2),

    L3 = [],
    test(L3).
