% e047

-module(e047).
-export([pascal/1]).
-export([testAll/0]).


pascal(N) ->
    pascal(N, 0, [], []).


pascal(N, I, _, Acc) when I > N ->
    Acc;
pascal(N, 0, _, _) ->
    Row = [1],
    pascal(N, 1, Row, [Row]);
pascal(N, I, Row, Acc) ->
    NewRow = build_new_row(Row),
    pascal(N, I + 1, NewRow, Acc ++ [NewRow]).


build_new_row(Row) ->
    [1] ++ build_new_row(Row, []) ++ [1].


build_new_row([_], Acc) ->
    Acc;
build_new_row([X1, X2 | Tail], Acc) ->
    build_new_row([X2 | Tail], Acc ++ [X1 + X2]).


print_result([Row0 | Rest]) ->
    print_result("Result: ~w~n", [Row0]),
    print_result("        ~w~n", Rest).


print_result(_, []) ->
    ok;
print_result(Pattern, [Head | Tail]) ->
    io:fwrite(Pattern, [Head]),
    print_result(Pattern, Tail).


test(L) ->     
    Result = pascal(L),
    io:fwrite("Input:  ~w~n", [L]),
    print_result(Result),
    io:fwrite("---~n").


testAll() ->
    test(0),
    test(3),
    test(6),
    test(10).
