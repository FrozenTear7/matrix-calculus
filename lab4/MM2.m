function x = MM2(A)  
  e = 0.1
  
  W_i = [1; 1]
  E_i = 1
  L_i = 1
  
  while E_i > e
    Z_i = [W_i(1, 1) / L_i; W_i(2, 1)]
    
    W_i = [
      A(1, 1) * Z_i(1, 1) + A(1, 2) * Z_i(2, 1);
      A(2, 1) * Z_i(1, 1) + A(2, 2) * Z_i(2, 1)
    ]
    
    L_i = max(abs(W_i))
    
    E_i = sqrt((W_i(1, 1) - L_i * Z_i(1, 1))^2 + (W_i(2, 1) - L_i * Z_i(2, 1))^2)
  end
  
  x = L_i
endfunction