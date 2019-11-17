function n_c = speed_controller(u, u_d, K_p, K_i, n_max)
%SPEED_CONTROLLER Summary of this function goes here
%   Detailed explanation goes here
persistent e_i
if isempty(e_i)
    e_i = 0; 
end

e = u_d - u; 
n_c = K_p * e + K_i * e_i;
[n_c_norm, saturated] = saturate(n_c / n_max); 
n_c = n_c_norm * n_max; 

if ~saturated
    e_i = e_i + e; 
end

end

