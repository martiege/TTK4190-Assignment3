function [x, saturated] = saturate(x)
%SATURATE saturates the normalized input variable
%   saturates the input x, assuming it is normalized
%   also returns a boolean describing if the signal is 
%   saturated or not
saturated = abs(x) > 1;
if saturated
    x = sign(x);
end 
end

