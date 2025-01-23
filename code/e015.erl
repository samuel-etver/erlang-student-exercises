% e015

-module(e015).
-export([translate/1]).
-export([testAll/0]).


translate(L) ->
    translate(L, []).


translate([], Acc) ->
    Acc;
translate([Head | Tail], Acc) ->
    Translated = int_to_atom(Head),
    translate(Tail, Acc ++ [Translated]).


int_to_atom(N) ->
    case N of
        0 -> zero;
        1 -> one;
        2 -> two;
        3 -> three;
        4 -> four;
        5 -> five;
        6 -> six;
        7 -> seven;
        8 -> eight;
        9 -> nine
    end.


test(L) -> 
    Result = translate(L),
    io:fwrite("Input: ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->        
    L1 = [0, 1, 7, 9, 5],
    test(L1),

    L2 = [1, 2, 3, 8, 5, 6, 7],
    test(L2),
    
    L3 = [1],
    test(L3).
