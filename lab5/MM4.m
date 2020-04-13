function x = MM4(A)
  AAT = A * A'
  
  eigVal = sort(round(eig(AAT)), "descend")
  
  Sigma = [
    sqrt(eigVal(1)) 0 0;
    0 sqrt(eigVal(2)) 0;
    0 0 sqrt(eigVal(3))
  ]
  
  tmpA = [
    AAT(1, 1) - eigVal(1) AAT(1, 2) AAT(1, 3);
    AAT(2, 1) AAT(2, 2) - eigVal(1) AAT(2, 3);
    AAT(3, 1) AAT(3, 2) AAT(3, 3) - eigVal(1);
  ]
  
  U1 = sym.solve(tmpA, [0; 0; 0])
  
  tmpA = [
    AAT(1, 1) - eigVal(2) AAT(1, 3) AAT(1, 3);
    AAT(2, 1) AAT(2, 2) - eigVal(2) AAT(2, 3);
    AAT(3, 1) AAT(3, 2) AAT(3, 3) - eigVal(2);
  ]
  
  U2 = linsolve(tmpA, [0; 0; 0])
  
  tmpA = [
    AAT(1, 1) - eigVal(3) AAT(1, 3) AAT(1, 3);
    AAT(2, 1) AAT(2, 2) - eigVal(3) AAT(2, 3);
    AAT(3, 1) AAT(3, 2) AAT(3, 3) - eigVal(3);
  ]
  
  U3 = linsolve(tmpA, [0; 0; 0])
endfunction