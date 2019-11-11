function delta_c = heading_controller(psi_d, psi, psi_dot, u, v)
%UNTITLED3 Summary of this function goes here 
%   Detailed explanation goes here
L_pp = 304.8;
T = 140;
delta_max = deg2rad(25); 
r_inf = 6.5e-3;
K = r_inf / (-delta_max * T); 

U = sqrt(u^2 + v^2); 
T_prime = T * U / L_pp; 
K_prime = K * L_pp / U; 
curlyboi = 1; % squigglyboi?

w_n = sqrt((U / L_pp) * (1 / T)); 

K_p = (L_pp / U)^2 * (T_prime / K_prime);
K_d = (2 * curlyboi * w_n - 1) / ((U / L_pp) * K_prime); 

delta_c = - K_p * (psi_d - psi) - K_d * psi_dot; 
[delta_c, ~] = saturate(delta_c / delta_max); 
delta_c = -delta_c * delta_max;
end

