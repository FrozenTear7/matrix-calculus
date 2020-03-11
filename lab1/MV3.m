function [C] = MV3(A,B)
  C = [
    A(1) * B(1) A(1) * B(2);
    A(2) * B(1) A(2) * B(2)
  ]
endfunction