clear all; close all;
%%
defines;            % defines for the system

tstart=0;           % Sim start time
tstop=10000;        % Sim stop time
tsamp=10;           % Sampling time for how often states are stored. (NOT ODE solver time step)
t = tstart:tsamp:tstop;
                
p0=zeros(2,1);      % Initial position (NED)
v0=[0.00000001 0]'; % Initial velocity (body): u0 cannot be zero for some reason? 0.00000001 ok however lol
psi0=0;             % Inital yaw angle
r0=0;               % Inital yaw rate
c=0;                % Current on (1)/off (0)

nc_step = 4;        % Value to step nc with
%%
sim MSFartoystyringSurgeBoi % The measurements from the simulink model are automatically written to the workspace.

%% Estimate
estimate_model % Calculate T_u and K_u

%% Compare with model
sim MSFartoystyringSurgeBoiVSModel;

%% Plot
plot_surge_boi
