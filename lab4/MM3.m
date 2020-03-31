function [L, z] = MM3(A)  
  e = 0.001
  
  W_i = [1; 1; 1]
  E_i = 1
  L_i = 1
  
  while E_i > e
    Z_i = [W_i(1, 1) / L_i; W_i(2, 1) / L_i; W_i(3, 1) / L_i]
    
    W_i = [
      A(1, 1) * Z_i(1, 1) + A(1, 2) * Z_i(2, 1) + A(1, 3) * Z_i(3, 1);
      A(2, 1) * Z_i(1, 1) + A(2, 2) * Z_i(2, 1) + A(2, 3) * Z_i(3, 1);
      A(3, 1) * Z_i(1, 1) + A(3, 2) * Z_i(2, 1) + A(3, 3) * Z_i(3, 1)
    ]
    
    L_i = max(abs(W_i))
    
    E_i = sqrt((W_i(1, 1) - L_i * Z_i(1, 1))^2 + 
    (W_i(2, 1) - L_i * Z_i(2, 1))^2 + 
    (W_i(3, 1) - L_i * Z_i(3, 1))^2)
  end
  
  L = L_i
  z = Z_i
endfunction