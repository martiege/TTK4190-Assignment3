
defines;            % defines for the system

tstart=0;           % Sim start time
tstop=10000;        % Sim stop time
tsamp=10;           % Sampling time for how often states are stored. (NOT ODE solver time step)
                
p0=zeros(2,1);      % Initial position (NED)
v0=[3 0]';       % Initial velocity (body)
psi0=0;             % Inital yaw angle
r0=0;               % Inital yaw rate
c=1;                % Current on (1)/off (0)

%% Sim
sim MSFartoystyringSCtuning % The measurements from the simulink model are automatically written to the workspace.

%% Plot
figure(1);
u_d = surge_step;
u = v(:, 1);
plot(t, u_d, t, u, t, u_d - u);
grid on;
legend("u_d", "u", "u_{error}");
title("Surge speed");
xlabel('time [s]'); 
ylabel("speed [m/s]");

figure(2);
plot(t, psi, t, r);
legend("\psi", "r");
grid on;
title("Heading and heading rate");
xlabel('time [s]');

figure(3); 
saturation_line = ones(size(t)) * rad2deg(delta_max); 
saturation_line_n = ones(size(t)) * n_max; 
plot(t, rad2deg(delta_c), t, saturation_line, t, -saturation_line, t, saturation_line_n); hold on;
plot(t, n_c, "LineWidth", 2);
legend('delta_c', 'positive saturation limit', 'negative saturation limit', 'n_c saturation limit', 'n_c');
ylim([-rad2deg(delta_max), rad2deg(delta_max)]);
xlabel('time [s]'); 
title('Commanded rudder and shaft speed');

figure(4);
u = v(:, 1);
plot(t, u_d, t, u, t, u_model);
grid on;
legend("u_d", "u", "u_{model}");
title("Ship surge speed vs first order model");
xlabel('time [s]'); 
ylabel("speed [m/s]");