psi_bar = psi - psi_d;
r_bar = r - r_d; 

figure(1); 
plot(t, rad2deg(psi), t, rad2deg(psi_d), t, rad2deg(psi_bar)); 
legend('psi', 'psi_d', 'psi_bar'); 
xlabel('time [s]'); 
ylabel('heading [degrees]'); 
title('Heading'); 

figure(2); 
plot(t, rad2deg(r), t, rad2deg(r_d), t, rad2deg(r_bar)); 
legend('r', 'r_d', 'r_bar'); 
xlabel('time [s]'); 
ylabel('heading rate [degrees/s]'); 
title('Heading rate'); 

figure(3); 
saturation_line = ones(size(t)) * rad2deg(delta_max); 
plot(t, rad2deg(delta_c), t, saturation_line, t, -saturation_line); 
ylim([-rad2deg(delta_max), rad2deg(delta_max)]);
legend('delta_c', 'positive saturation limit', 'negative saturation limit');
xlabel('time [s]'); 
ylabel('delta_c [degrees]'); 
title('Commanded rudder'); 
