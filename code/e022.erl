% e022

-module(e022).
-export([permutation/1]).
-export([testAll/0]).


permutation(L) ->
    Prefix = [],
    N = length(L),
    Acc = [],
    permutation(L, Prefix, N, Acc).


permutation(_, _, 0, Acc) ->
    Acc;
permutation([X], _, _, _) ->
    [[X]];
permutation([X1, X2], Prefix, _, Acc) ->
    Acc ++ [Prefix ++ [X1, X2], Prefix ++ [X2, X1]];
permutation([Head | Tail], Prefix, N, Acc) ->
    NewAcc = permutation(Tail ++ [Head], Prefix, N - 1, Acc),
    permutation(Tail, Prefix ++ [Head], length(Tail), NewAcc).


print_row(L, Num) ->
    io:fwrite("    ~w: ~w~n", [Num, L]).


print_result(L) ->
    print_result(L, 1).


print_result([], _) ->
    ok;
print_result([Head | Tail], Num) ->
    print_row(Head, Num),
    print_result(Tail, Num + 1).


test(L) -> 
    Result = permutation(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result:~n"),
    print_result(Result),
    io:fwrite("---~n").


testAll() ->
    test([a]),
    test([a, b]),
    test([a,b,c]),
    test([a,b,c,d]).
