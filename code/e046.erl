% e046

-module(e046).
-export([counting_sort/1]).
-export([testAll/0]).

-define(N, 100).


counting_sort(L) ->
    Arr = array:new(?N, {default, 0}),
    CountArr = count_numbers(L, Arr),
    build_list(CountArr).


count_numbers([], Arr) ->
    Arr;
count_numbers([Head | Tail], Arr) ->
    Count = array:get(Head, Arr) + 1,
    NewArr = array:set(Head, Count, Arr),
    count_numbers(Tail, NewArr).


build_list(Arr) ->
    build_list(Arr, 0, []).


build_list(_, Index, Acc) when Index == ?N ->
    Acc;
build_list(Arr, Index, Acc) ->
    Count = array:get(Index, Arr),
    if Count == 0 ->
        build_list(Arr, Index + 1, Acc);
    true ->
        NewArr = array:set(Index, Count - 1, Arr),
        build_list(NewArr, Index, Acc ++ [Index])
    end.


test(L) ->     
    Result = counting_sort(L),
    io:fwrite("Input:  ~w~n", [L]),
    io:fwrite("Result: ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    L1 = [3, 1, 4, 2],
    test(L1),
    
    L2 = [2, 1, 0],
    test(L2),
    
    L3 = [9, 0, 83, 4, 7, 3, 50, 4],
    test(L3).
