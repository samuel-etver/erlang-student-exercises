% e005

-module(e005).
-export([member/2]).
-export([testAll/0]).


member(_, []) ->
    false;
member(X, [X | _]) ->
    true;
member(X, [_ | Tail]) ->
    member(X, Tail).


test(X, L) -> 
    F = member(X, L),
    io:fwrite("~w is member of ~w: ~w~n", [X, L, F]).


testAll() ->        
    X1 = 4, L1 = [],
    test(X1, L1),

    X2 = 3, L2 = [1, 7, 2, -3, 5, 0],
    test(X2, L2),

    X3 = -3, L3 = L2,
    test(X3, L3),

    X4 = oak, L4 = [fur, pine, oak, ash, willow, maple],
    test(X4, L4),
    
    X5 = elm, L5 = L4,
    test(X5, L5).
