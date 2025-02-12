% e052

-module(e052).
-export([mul/2]).
-export([testAll/0]).


mul(RowVect, Matrix) ->
    [A11, A12, A13] = RowVect,
    [[B11, B12, B13],
     [B21, B22, B23],
     [B31, B32, B33]] = Matrix,
    C11 = A11*B11 + A12*B21 + A13*B31,
    C12 = A11*B12 + A12*B22 + A13*B32,
    C13 = A11*B13 + A12*B23 + A13*B33,
    [C11, C12, C13].


test(RowVect, Matrix) ->     
    Result = mul(RowVect, Matrix),
    io:fwrite("Input:  V = ~w~n", [RowVect]),
    [MR1, MR2, MR3] = Matrix,
    io:fwrite("        M = ~w~n", [MR1]),
    io:fwrite("            ~w~n", [MR2]),
    io:fwrite("            ~w~n", [MR3]),
    io:fwrite("Result: R = ~w~n", [Result]),
    io:fwrite("---~n").


testAll() ->
    V1 = [1, 1, 1],
    M1 = [[1, 1, 1],
          [1, 1, 1],
          [1, 1, 1]],
    test(V1, M1),
    
    V2 = [1, 2, 3],
    M2 = [[1, 0, 0],
          [0, 1, 0],
          [0, 0, 1]],          
    test(V2, M2),
    
    V3 = [3, -1, 7],
    M3 = [[2, 0,  6],
          [8, 1, -4],
          [0, 5,  7]],
    test(V3, M3).
