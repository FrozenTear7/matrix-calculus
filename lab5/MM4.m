function MM4(A)  
  ATA = A' * A
  AAT = A * A'
  
  UeigVal = sort(eig(AAT), "descend")
  VeigVal = sort(eig(ATA), "descend")
  
  # Sigma
  
  Sigma = [
    sqrt(UeigVal(1)) 0 0;
    0 sqrt(UeigVal(2)) 0;
    0 0 sqrt(UeigVal(3))
  ]
  
  # U
  
  U1 = getVector(AAT, UeigVal(1))
  U2 = getVector(AAT, UeigVal(2))
  U3 = getVector(AAT, UeigVal(3))
  U = horzcat(U1, U2, U3)
  
  # V
  
  V1 = 1 / Sigma(1, 1) * A' * U1
  V2 = 1 / Sigma(2, 2) * A' * U2
  V3 = 1 / Sigma(3, 3) * A' * U3 
  V = horzcat(V1, V2, V3)
  
  U
  Sigma
  V
  
  U * Sigma * V'
endfunction