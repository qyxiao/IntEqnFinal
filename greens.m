function output = greens(X,Y,i,z1,z2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
   %output = -log(sqrt(sum((x-y).^2)))/(2*pi);
   if(i==0)
   output = -log( sqrt((X-z1).^2 + (Y-z2).^2) )/(2*pi);
   else
   x0 = X(i); y0 = Y(i);
   X(i)=X(i)+1; Y(i)=Y(i)+1; % avoid singularity value
   output = -log( sqrt((X-x0).^2 + (Y-y0).^2) )/(2*pi);
   output(i) = 0;
   end
end

