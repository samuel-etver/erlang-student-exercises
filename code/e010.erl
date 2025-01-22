% e010

-module(e010).
-export([delete_last_three_elements/1]).
-export([testAll/0]).


delete_last_three_elements(L) ->
    delete_last_three_elements(L, []).


delete_last_three_elements(L, Acc) when length(L) =< 3 ->
    Acc;
delete_last_three_elements([Head | Tail], Acc) ->
    delete_last_three_elements(Tail, Acc ++ [Head]).


test(L) -> 
    Result = delete_last_three_elements(L),
    io:fwrite("Input: ~w~n", [L]),
    io:fwrite("Output: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->        
    L1 = [1, 2],
    test(L1),

    L2 = [1, 2, 3, 4, 5, 6, 7],
    test(L2),
    
    L3 = [mike, james, bob, greg, john],
    test(L3),
    
    L4 = [jane],
    test(L4).
