function output = greens(X,Y,z1,z2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
   %output = -log(sqrt(sum((x-y).^2)))/(2*pi);
   
   output = -log( sqrt((X-z1).^2 + (Y-z2).^2) )/(2*pi);
end

