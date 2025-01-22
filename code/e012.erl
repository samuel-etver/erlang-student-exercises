% e012

-module(e012).
-export([delete_item/2]).
-export([testAll/0]).


delete_item(X, L) ->
    delete_item(X, L, []).


delete_item(_, [], Acc) ->
    Acc;
delete_item(X, [X | Tail], Acc) ->
    Acc ++ Tail;
delete_item(X, [Head | Tail], Acc) ->
    delete_item(X, Tail, Acc ++ [Head]).


test(X, L) -> 
    Result = delete_item(X, L),
    io:fwrite("Input: X = ~w, L = ~w~n", [X, L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->        
    X1 = 1, L1 = [], 
    test(X1, L1),

    X2 = 4, L2 = [1, 2, 3, 4, 5, 6, 7],
    test(X2, L2),
    
    X3 = james, L3 = [mike, james, bob, greg, john],
    test(X3, L3),
    
    X4 = jane, L4 = [jane, ann, natasha],
    test(X4, L4).
