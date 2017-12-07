function  output = greensDd( X, Y, i, z1, z2 )

% directional derivative of green function

% assuming boundary is circle centered at origin with radius 1
% thus give normal direction = y
if(i==0)
output = ( (X-z1).*X + (Y-z2).*Y  )./(2*pi* ((X-z1).^2+(Y-z2).^2) );
    
else
x0 = X(i); y0 = Y(i);
X(i)=X(i)+1; Y(i)=Y(i)+1; % avoid singularity value

%output = sum((x-y).*y)/(2*pi*sum((x-y).^2));
output =   ( (X-x0).*X + (Y-y0).*Y  )./(2*pi* ((X-x0).^2+(Y-y0).^2) );
output(i) = 0;
end

end

