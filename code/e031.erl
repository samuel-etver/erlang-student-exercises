% e031

-module(e031).
-export([bubble_sort/1]).
-export([testAll/0]).


bubble_sort(L) ->
    bubble_sort(L, []).


bubble_sort([], Acc) ->
    Acc;
bubble_sort(L, Acc) ->
    {Rest, Max} = swap(L),
    bubble_sort(Rest, [Max] ++ Acc).


swap([Head | Tail]) ->
    swap(Tail, [], Head).


swap([], Acc, Max) ->
    {Acc, Max};
swap([Head | Tail], Acc, Max) ->
    if Head > Max ->
        swap(Tail, Acc ++ [Max], Head);
    true ->
        swap(Tail, Acc ++ [Head], Max)
    end.


test(L) -> 
    Result = bubble_sort(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [50, -1, 1, -5, 2, 3, 40], 
    test(L1),

    L2 = [23, 45, 67, 1, 4, 120, -3],
    test(L2),

    L3 = [3, 2, 1],
    test(L3).
