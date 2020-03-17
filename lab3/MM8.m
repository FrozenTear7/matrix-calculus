function x = MM8(A)  
  det = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1)
  
  Ainv = [
    1/det * A(2, 2)   1/det * -A(1, 2);
    1/det * -A(2, 1)  1/det * A(1, 1)
  ]
  
  condInfA = max(abs(A(1, 1)) + abs(A(1, 2)), abs(A(2, 1)) + abs(A(2, 2)))
  condInfAinv = max(abs(A(1, 1)) + abs(A(1, 2)), abs(A(2, 1)) + abs(A(2, 2)))
  
  x = condInfA * condInfAinv
endfunction
