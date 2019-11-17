function psi = chi2psi(chi, u, v)
%CHI2PSI Summary of this function goes here
%   Detailed explanation goes here

beta = asin(v / sqrt(u^2 + v^2)); 
psi = chi - beta; 

end

