function vec = getVector(A, eigval)  
  tmp = cat(1, A - eye(3) * eigval, [1, 1, 1])
  newVector = tmp \ [0; 0; 0; 1]
  vec = newVector / norm(newVector)
endfunction