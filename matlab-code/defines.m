%% Defines

% Ship
L_pp = 304.8;

% Maximums
delta_max = deg2rad(25); 
n_max     = (85 * 2 * pi) / 60; 

% Heading controller
r_inf = 6.5e-3;
T_psi = 140;
K_psi = r_inf / (-delta_max * T_psi); 

% Speed / surge controller
K_pu = 
K_iu = 