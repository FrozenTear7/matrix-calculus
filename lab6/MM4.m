function MM4(A)  
  x = [A(1, 1); A(2, 1)]
  
  tZnaczek = sqrt(x(1, 1)^2 + x(2, 1)^2)
  
  yZnaczek = (x(1, 1) + tZnaczek) / tZnaczek
  
  y = [-tZnaczek * x(1, 1); 0]
  
  u = 1 / (x(1, 1) + tZnaczek) * (x - y)
  
  I = [1 0; 0 1]
  
  Q = I - yZnaczek * u * u'
  
  R = Q' * A
  
  A
  Q * R
endfunction