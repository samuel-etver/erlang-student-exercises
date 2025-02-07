% e044

-module(e044).
-export([heap_sort/1]).
-export([testAll/0]).


heap_sort(L) ->
    heap_sort(L, []).


heap_sort([], TopAcc) ->
    TopAcc;
heap_sort([X], TopAcc) ->
    [X] ++ TopAcc;
heap_sort([Head | Tail], TopAcc) ->
    {Max, NewTail} = top(Tail, Head, []),
    heap_sort(NewTail, [Max] ++ TopAcc).


top([], Max, Acc) ->
    {Max, Acc};
top([Head | Tail], Max, Acc) when Head > Max ->
    top(Tail, Head, Acc ++ [Max]);
top([Head | Tail], Max, Acc) ->
    top(Tail, Max, Acc ++ [Head]).


test(L) ->     
    Result = heap_sort(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").



testAll() ->
    L1 = [3, 1, 4, 2],
    test(L1),
    
    L2 = [-2, -1, 0],
    test(L2),
    
    L3 = [9, 0, 4, 7, -1, 3],
    test(L3).
