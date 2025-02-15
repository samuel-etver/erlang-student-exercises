% e054

-module(e054).
-export([move/3,
         rotate/2,
         vertex/2]).
-export([testAll/0]).

-record(rect, {center = {0, 0},
               size = {0, 0},
               angle = 0}).


move(R, DX, DY) ->
      {X, Y} = R#rect.center,
      R#rect {center = {X + DX, Y + DY}}.


rotate(R, DAlpha) ->
      Angle = R#rect.angle,
      R#rect {angle = Angle + DAlpha}.


vertex(T, R) ->
      {W, H} = R#rect.size,
      case T of
            lt ->
                  X = -W / 2,
                  Y =  H / 2;
            rt ->
                  X =  W / 2,
                  Y =  H / 2;
            lb ->
                  X = -W / 2,
                  Y = -H / 2;
            rb ->
                  X =  W / 2,
                  Y = -H / 2
      end,
      Angle = math:pi() / 180 * R#rect.angle,      
      CosA = math:cos(Angle),
      SinA = math:sin(Angle),
      RotationMatrix = [[ CosA, SinA],
                        [-SinA, CosA]],
      [NewX, NewY] = mul_vect_to_matrix([X, Y], RotationMatrix),
      {CenterX, CenterY} = R#rect.center,
      [CenterX + NewX, CenterY + NewY].


mul_vect_to_matrix(V, M) ->
    [A11, A12] = V,
    [[B11, B12], [B21, B22]] = M,
    C11 = A11*B11 + A12*B21,
    C12 = A11*B12 + A12*B22,
    [C11, C12].


test(R) ->     
    io:fwrite("Input:  ~w~n", [R]),
    [Lt, Rt, Lb, Rb] = [
      vertex(lt, R),
      vertex(rt, R),
      vertex(rb, R),
      vertex(lb, R)],
    io:fwrite("Result: LT = ~w~n", [Lt]),
    io:fwrite("        RT = ~w~n", [Rt]),
    io:fwrite("        RB = ~w~n", [Rb]),
    io:fwrite("        LB = ~w~n", [Lb]),
    io:fwrite("---~n").


testAll() ->
    R1 = #rect {size = {100, 120}},
    R1_1 = rotate(R1, -90),
    test(R1_1),
    
    R2 = #rect {size = {10, 10}, angle = -45},
    R2_1 = move(R2, 10, 10),
    test(R2_1),
    
    R3 = #rect {size = {100, 200}},
    test(R3).
