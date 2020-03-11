function [C] = MM1(A,B)
  C = [
    MV1(A(1, :), B(:, 1)) MV1(A(1, :), B(:, 2));
    MV1(A(2, :), B(:, 1)) MV1(A(2, :), B(:, 2))
  ]
endfunction