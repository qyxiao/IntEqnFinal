function output = greens(X,Y,i,z1,z2)
%UNTITLED4 Summary of this function goes here
%   the function calculate the greens function value between (X,Y) and (x,y)
   
   if(i~=0) % target point (x,y) taken to be (X(i,Y(i)))
   x0 = X(i); y0 = Y(i);
   X(i)=X(i)+1; Y(i)=Y(i)+1; % avoid singularity value
   output = -log( sqrt((X-x0).^2 + (Y-y0).^2) )/(2*pi);
   output(i) = 0;    
         
   else % % target point is the input (x,y)
   output = -log( sqrt((X-z1).^2 + (Y-z2).^2) )/(2*pi);
   end
end

