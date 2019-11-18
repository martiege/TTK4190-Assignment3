%%
defines;            % defines for the system

tstart=0;           % Sim start time
tstop=6500;        % Sim stop time
tsamp=10;           % Sampling time for how often states are stored. (NOT ODE solver time step)
                
p0=[1000, 700];      % Initial position (NED)
v0=[6.63 0]';       % Initial velocity (body)
psi0=deg2rad(60);             % Inital yaw angle
r0=0;               % Inital yaw rate
c=1;                % Current on (1)/off (0)

load('WP.mat'); 
sim plotting % The measurements from the simulink model are automatically written to the workspace.

pathplotter(p(:, 1), p(:, 2), psi, tsamp, 20, tstart, tstop, 0, WP); 

figure(3); 
beta_c =  atan2(v(:, 2), v(:, 1)); % asin(v(:, 2) ./ sqrt(v(:, 1).^2 + v(:, 2).^2)); 
chi = psi - beta_c; 
plot(t, rad2deg(chi), t, rad2deg(psi), t, rad2deg(psi_d), t, rad2deg(beta_c)); 
legend('Course chi', 'Heading psi', 'Desired course chi_d', 'Crab angle beta'); 
xlabel('Degrees'); 
ylabel('Time'); 


