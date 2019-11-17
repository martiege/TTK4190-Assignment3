function delta_c = heading_controller(psi_d, psi, psi_dot, u, v, ...
        L_pp, T_psi, K_psi, delta_max)
%UNTITLED3 Summary of this function goes here 
%   Detailed explanation goes here

U = sqrt(u^2 + v^2); 
T_prime = T_psi * U / L_pp; 
K_prime = K_psi * L_pp / U; 
squigglyboi = 1; 

w_n = sqrt((U / L_pp) * (1 / T_psi)); 

K_p = (L_pp / U)^2 * (T_prime / K_prime);
K_d = (2 * squigglyboi * w_n - 1) / ((U / L_pp) * K_prime); 

delta_c = - K_p * (psi_d - psi) - K_d * psi_dot; 
[delta_c, ~] = saturate(delta_c / delta_max); 
delta_c = -delta_c * delta_max;
end

