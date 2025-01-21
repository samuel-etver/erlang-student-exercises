% e006

-module(e006).
-export([parity/1]).
-export([testAll/0]).


parity(N) ->
    if N rem 2 == 0 ->
        even;
    true ->
        odd
    end.


test(N) -> 
    P = parity(N),
    io:fwrite("Parity of ~w: ~w~n", [N, P]).


testAll() ->        
    test(12),
    test(41),
    test(8),
    test(5).
