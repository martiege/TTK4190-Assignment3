u = v(:, 1);

T_u = tsamp * find(u > 0.63 * u(end), 1);
K_u = u(end)/nc_step;

%% Resulting values
%T_u = 790;
%K_u = 0.8157
