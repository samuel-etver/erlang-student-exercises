% e051

-module(e051).
-export([mul/2]).
-export([testAll/0]).


mul(RowVect, Matrix) ->
    [A11, A12] = RowVect,
    [[B11, B12], [B21, B22]] = Matrix,
    C11 = A11*B11 + A12*B21,
    C12 = A11*B12 + A12*B22,
    [C11, C12].


test(RowVect, Matrix) ->     
    Result = mul(RowVect, Matrix),
    io:fwrite("Input:  V = ~w~n", [RowVect]),
    [MR1, MR2] = Matrix,
    io:fwrite("        M = ~w~n", [MR1]),
    io:fwrite("            ~w~n", [MR2]),
    io:fwrite("Result: R = ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    V1 = [1, 1],
    M1 = [[1, 1],
          [1, 1]],
    test(V1, M1),
    
    V2 = [1, 2],
    M2 = [[1, 0],
          [0, 1]],          
    test(V2, M2),
    
    V3 = [1, 5],
    M3 = [[3, 7],
          [8, 4]],
    test(V3, M3).
