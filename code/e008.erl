% e008

-module(e008).
-export([even_length/1,
         odd_length/1]).
-export([testAll/0]).


parity_of_list_length(L) ->
    if length(L) rem 2 == 0 ->
        even;
    true ->
        odd
    end.


even_length(L) -> 
    parity_of_list_length(L) == even.


odd_length(L) -> 
    not even_length(L).


test(L, even) -> 
    F = even_length(L),
    io:fwrite("Is length of list ~w even? ~w~n", [L, F]);
test(L, odd) ->
    F = odd_length(L),
    io:fwrite("Is length of list ~w odd? ~w~n", [L, F]).


testAll() ->        
    L1 = [],
    test(L1, even),
    test(L1, odd),

    L2 = [1, 2, 3, 4, 5, 6, 7],
    test(L2, even),
    test(L2, odd),
    
    L3 = [tulip, rose, chamomile, marigold],
    test(L3, even),
    test(L3, odd).
