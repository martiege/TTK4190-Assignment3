%% Defines

% Ship
L_pp = 304.8;

% Maximums
delta_max = deg2rad(25); 
n_max     = (85 * 2 * pi) / 60; 
numeric_threshold = 1e-5; 

% Heading controller
r_inf = 6.5e-3;
T_psi = 140;
K_psi = r_inf / (-delta_max * T_psi); 

% Speed / surge controller
T_u = 790;
K_u = 0.8157;
e_max = 1; 
K_pu = n_max / e_max; 
K_iu = K_pu / T_u; 