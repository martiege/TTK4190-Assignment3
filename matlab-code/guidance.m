function [U_d, chi_d] = guidance(x, y, waypoints, numeric_threshold, ...
    distance_threshold)
%GUIDANCE Summary of this function goes here
%   Detailed explanation goes here
persistent k
if isempty(k)
    k = 1; 
end

x_wp = waypoints(1, :);
size(waypoints)
y_wp = waypoints(2, :);

delta_x = x_wp(k + 1) - x_wp(k); 
delta_y = y_wp(k + 1) - y_wp(k); 

R_squared = (x - x_wp(k + 1))^2 + (y - y_wp(k + 1))^2; 
if R_squared < distance_threshold^2
    if k < size(waypoints, 2) - 1
        k = k + 1; 
    end 
end

if abs(delta_x) < numeric_threshold
    x_los = x_wp(k);
    if delta_y > 0
        y_los = y + sqrt(R_squared - (x_los - x)^2); 
    else
        y_los = y - sqrt(R_squared - (x_los - x)^2); 
    end
else
    d = delta_y / delta_x;
    a = 1 + d^2;
    g = y_wp(k) - d * x_wp(k);
    b = 2 * (d*g - d * y - x);
    c = x^2 + y^2 + g^2 - 2 * g * y - R_squared;
    if delta_x > 0
        x_los = (- b + sqrt(b^2 - 4 * a * c) ) / (2 * a); 
    else
        x_los = (- b - sqrt(b^2 - 4 * a * c) ) / (2 * a); 
    end
    
    if abs(delta_y) < numeric_threshold
        y_los = y_wp(k); 
    else
        y_los = d * (x_los - x_wp(k)) + w_wp(k); 
    end
end

chi_d = atan2(y_los - y, x_los - x); 
U_d   = 7; 

end

