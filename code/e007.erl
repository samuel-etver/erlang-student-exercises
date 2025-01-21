% e007

-module(e007).
-export([parity_of_list_length/1]).
-export([testAll/0]).


parity_of_list_length([]) ->
    even;
parity_of_list_length([_ | []]) ->
    odd;
parity_of_list_length([_, _ | Tail]) ->
    parity_of_list_length(Tail).


test(L) -> 
    P = parity_of_list_length(L),
    io:fwrite("Parity of ~w: ~w~n", [L, P]).


testAll() ->        
    L1 = [],
    test(L1),

    L2 = [1, 2, 3, 4, 5, 6 , 7],
    test(L2),
    
    L3 = [1],
    test(L3),
    
    L4 = [1, 2],
    test(L4),
    
    L5 = [tulip, rose, chamomile, marigold],
    test(L5).
