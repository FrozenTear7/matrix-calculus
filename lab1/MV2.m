function C = MV2(A,B)
  C = [
    MV1(A(1, :), B);
    MV1(A(2, :), B)
  ];
endfunction