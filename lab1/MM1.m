function [C] = MM2(A,B)
  C_1 = MV2(A, B(:, 1));
  C_2 = MV2(A, B(:, 2));
  
  C = [
    C_1(1) C_2(1);
    C_1(2) C_2(2);
  ];
endfunction