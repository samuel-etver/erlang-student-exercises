% e036

-module(e036).
-export([isort/1]).
-export([testAll/0]).


isort(L) ->
    isort(L, []).


isort([], Acc) ->
    Acc;
isort([Head | Tail], Acc) ->
    NewAcc = insert(Head, Acc),
    isort(Tail, NewAcc).


insert(X, []) ->
    [X];
insert(X, L) ->
    insert(X, L, []).


insert(X, [], Acc) ->
    Acc ++ [X];
insert(X, [Head | Tail], Acc) ->
    if X < Head ->
        Acc ++ [X, Head | Tail];
    true ->
        insert(X, Tail, Acc ++ [Head])
    end.


test(L) -> 
    Result = isort(L),    
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [1, 3, 2],
    test(L1),

    L2 = [1, 2, 3],
    test(L2),

    L3 = [3, 2, 1],
    test(L3),

    L4 = [5, 7, 2, 5, 40, 2, 3, 1, 4],
    test(L4).
