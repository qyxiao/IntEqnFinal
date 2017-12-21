function  output = greensDerN( X, Y, i, x, y, dX, dY )
%UNTITLED3 Summary of this function goes here
%   This function calculate the derivative of greens function at points (X,Y),(x,y) and then
%   multiply the results with the unit direction vector at points (X,Y)

if(i~=0) % target point (x,y) taken to be (X(i,Y(i)))
    
x0 = X(i); y0 = Y(i);
X(i)=X(i)+1; Y(i)=Y(i)+1; % avoid singularity value
 
output = -( (x0-X).*dX + (y0-Y).*dY  )./(2*pi* ((X-x0).^2+(Y-y0).^2) );
output(i) = 0;    
    
else % target point is the input (x,y)

output = -( (x-X).*dX + (y-Y).*dY  )./(2*pi* ((X-x).^2+(Y-y).^2) );
    
    
end


end

