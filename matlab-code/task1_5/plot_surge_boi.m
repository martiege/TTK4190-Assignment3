figure(1);
plot(t, u); hold on;
plot(t, u_model);
grid on;
legend('u', 'u_{model}');
xlabel('time [s]');
ylabel('surge');
title('Ship surge vs first order model');
