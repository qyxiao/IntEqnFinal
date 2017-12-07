function output = greens(x,y)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
   output = ln(sqrt(sum((x-y).^2)))/(2*pi);

end

