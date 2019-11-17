function [U_d, chi_d] = guidance(x, y, waypoints, ...
    numeric_threshold, distance_threshold)
%GUIDANCE Summary of this function goes here
%   Detailed explanation goes here
persistent k
if isempty(k)
    k = 1; 
end

x_wp = waypoints(1, :);
y_wp = waypoints(2, :);

delta_x = x_wp(k + 1) - x_wp(k); 
delta_y = y_wp(k + 1) - y_wp(k); 

R_squared = distance_threshold^2; 

alpha = atan2(delta_y, delta_x); 
e = - (x - x_wp(k)) * sin(alpha) + (y - y_wp(k)) * cos(alpha); 
R_squared = max([R_squared, e^2]); 
DELTA = sqrt(R_squared - e^2); 

chi_r = atan(-e / DELTA); % atan2?
chi_p = alpha; 
chi_d = chi_p + chi_r; 
if chi_d < 0
    chi_d = chi_d + 2 * pi; 
end
U_d = 7; 

if (x - x_wp(k + 1))^2 + (y - y_wp(k + 1))^2 < R_squared
    if k < size(waypoints, 2) - 1
        k = k + 1; 
    end 
end



% 
% if abs(delta_x) < numeric_threshold
%     x_los = x_wp(k);
%     if delta_y > 0
%         y_los = y + sqrt(R_squared - (x_los - x)^2); 
%     else
%         y_los = y - sqrt(R_squared - (x_los - x)^2); 
%     end
% else
%     d = delta_y / delta_x;
%     e = x_wp(k); 
%     f = y_wp(k); 
%     g = f - d * e; 
%     a = 1 + d^2; 
%     b = 2 * (d * g - d * y - x); 
%     c = x^2 + y^2 + g^2 - 2 * g * y - R_squared; 
% %     a = 1 + d^2;
% %     g = y_wp(k) - d * x_wp(k);
% %     b = 2 * (d*g - d * y - x);
% %     c = x^2 + y^2 + g^2 - 2 * g * y - R_squared;
%     b^2 - 4 * a * c
%     if delta_x > 0
%         x_los = (- b + sqrt(b^2 - 4 * a * c) ) / (2 * a); 
%     else
%         x_los = (- b - sqrt(b^2 - 4 * a * c) ) / (2 * a); 
%     end
%     
%     if abs(delta_y) < numeric_threshold
%         y_los = y_wp(k); 
%     else
%         y_los = d * (x_los - x_wp(k)) + y_wp(k); 
%     end
% end
% 
% if (x - x_wp(k + 1))^2 + (y - y_wp(k + 1))^2 < R_squared
%     if k < size(waypoints, 2) - 1
%         k = k + 1; 
%     end 
% end
% 
% U_d   = 7; 

end

