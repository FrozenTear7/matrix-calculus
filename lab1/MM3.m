function [C] = MM3(A,B)
  C_1 = MV3(A(:, 1), B(1, :));
  C_2 = MV3(A(:, 2), B(2, :));
  
  C = [
    C_1(1, 1) + C_2(1, 1) C_1(1, 2) + C_2(1, 2);
    C_1(2, 1) + C_2(2, 1) C_1(2, 2) + C_2(2, 2)
  ];
endfunction