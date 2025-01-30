% e033

-module(e033).
-export([generate_matrix/1]).
-export([testAll/0]).


generate_matrix(N) ->
    generate_matrix(N, N, []).


generate_matrix(_, 0, Acc) ->
    Acc;
generate_matrix(N, Count, Acc) ->
    Row = generate_row(N),
    generate_matrix(N, Count - 1, Acc ++ [Row]).


generate_row(N) ->
    generate_row(N, []).


generate_row(0, Acc) ->
    Acc;
generate_row(N, Acc) ->
    Val = rand:uniform(10) - 1,
    generate_row(N - 1, Acc ++ [Val]).


print_result([Row0 | Rest]) ->
    print_result("Result: ~w~n", [Row0]),
    print_result("        ~w~n", Rest).


print_result(_, []) ->
    ok;
print_result(Pattern, [Head | Tail]) ->
    io:fwrite(Pattern, [Head]),
    print_result(Pattern, Tail).


test(N) -> 
    Result = generate_matrix(N),    
    io:fwrite("Input:  N=~w~n", [N]),
    print_result(Result),
    io:fwrite("---~n").


testAll() ->
    test(2),
    test(3),
    test(4).
