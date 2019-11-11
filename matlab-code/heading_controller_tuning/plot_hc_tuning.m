% measure
r_inf = r(end); 
delta_max = deg2rad(25); 
T = 140; % read from figure

K = r_inf / (-delta_max * T); 

% plot with 63% of converge
figure(1);
line = ones(size(t)) * (1 - exp(-1)) * r_inf;
nom = r_inf * (1 - exp(-t/T)); 
plot(t(1:150), r(1:150), t(1:150), line(1:150), t(1:150), nom(1:150)); 
legend('yaw rate step response', '63 percent of convergence', 'nomoto step response'); 
xlabel('time [s]');
ylabel('yaw rate [rad/s]');
title('Tuning of heading controller')