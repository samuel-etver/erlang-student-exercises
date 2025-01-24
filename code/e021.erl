% e021

-module(e021).
-export([flatten/1]).
-export([testAll/0]).


flatten(L) ->
    flatten(L, []).


flatten([], Acc) ->
    Acc;
flatten([X], Acc) ->
    flatten(X, Acc);
flatten([Head | Tail], Acc) ->
    NewAcc = flatten(Head, Acc),
    flatten(Tail, NewAcc);
flatten(X, Acc) ->
    Acc ++ [X].


test(L) -> 
    Result = flatten(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    test([[[[]]]]),
    test([[a],b,c]),
    test([1,[2,3,4],0,[[a, [b], c]],5,6,7,8]),
    test([11,[12, 13, 14],15, 16]).
