% e019

-module(e019).
-export([fib_seq/1]).
-export([fib/1]).
-export([testAll/0]).


fib_seq(0) ->
    [fib(0)];
fib_seq(N) ->
    fib_seq(N - 1) ++ [fib(N)].


fib(0) ->
    {_, N2} = fib_pair(1),
    N2;
fib(N) ->
    {N1, _} = fib_pair(N),
    N1.


fib_pair(1) ->
    {1, 0};
fib_pair(N) -> 
    {N1, N2} = fib_pair(N - 1),
    {N1 + N2, N1}.


test(N) -> 
    Result = fib_seq(N),
    io:fwrite("Fibonacci sequence of ~w: ~w~n", [N, Result]).


testAll() ->        
    test(0),
    test(1),    
    test(5),
    test(8),
    test(11).
