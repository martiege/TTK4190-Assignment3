function psi = chi2psi(chi, u, v)
%CHI2PSI Summary of this function goes here
%   Detailed explanation goes here

beta_c = atan2(v, u); 
psi = chi - beta_c; 

end

