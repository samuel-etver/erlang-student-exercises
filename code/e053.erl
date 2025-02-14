% e053

-module(e053).
-export([mul/2]).
-export([testAll/0]).


mul(RowVect, Matrix) ->
      VArr = array:from_list(RowVect),
      MArr = array:from_list(lists:flatten(Matrix)),
      N = length(RowVect),
      mul(VArr, MArr, N).


mul(VArr, MArr, N) ->
      mul(VArr, MArr, N, 0, []).


mul(_, _, N, N, Acc) ->
      Acc;
mul(VArr, MArr, N, I, Acc) ->
      A = mul_row_to_col(VArr, MArr, N, I),
      mul(VArr, MArr, N, I + 1, Acc ++ [A]).


mul_row_to_col(VArr, MArr, N, I) ->
      mul_row_to_col(VArr, MArr, N, I, 0, 0).


mul_row_to_col(_, _, N, _, N, Acc) ->
      Acc;
mul_row_to_col(VArr, MArr, N, I, J, Acc) ->
      E = array:get(J, VArr) *
          array:get(J * N + I, MArr),
      mul_row_to_col(VArr, MArr, N, I, J + 1, Acc + E).


print_matrix([FirstRow | Rest]) ->
      print_matrix("        M = ~w~n", [FirstRow]),
      print_matrix("            ~w~n", Rest).


print_matrix(_, []) ->
      ok;
print_matrix(Pattern, [FirstRow | Rest]) ->
      io:fwrite(Pattern, [FirstRow]),
      print_matrix(Pattern, Rest).


test(RowVect, Matrix) ->     
    Result = mul(RowVect, Matrix),
    io:fwrite("Input:  V = ~w~n", [RowVect]),
    print_matrix(Matrix),
    io:fwrite("Result: R = ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    V1 = [1, 1],
    M1 = [[1, 1],
          [1, 1]],
    test(V1, M1),
    
    V2 = [1, 2, 3, 4],
    M2 = [[1, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 1, 0],
          [0, 0, 0, 1]],          
    test(V2, M2),
    
    V3 = [3, -1,  7],
    M3 = [[2, 0,  6],
          [8, 1, -4],
          [0, 5,  7]],
    test(V3, M3).
