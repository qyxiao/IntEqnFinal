function  output = greensDd( X, Y, i, z1, z2 )

% directional derivative of green function

% assuming boundary is circle centered at origin with radius 1
% thus give normal direction = y

mag = sqrt(X.^2+Y.^2);

if(i==0)
output = -( (z1-X).*(X)./mag + (z2-Y).*Y./mag  )./(2*pi* ((X-z1).^2+(Y-z2).^2) );
    
else
x0 = X(i); y0 = Y(i);
X(i)=X(i)+1; Y(i)=Y(i)+1; % avoid singularity value
 
output = -( (x0-X).*(X)./mag + (y0-Y).*Y./mag  )./(2*pi* ((X-x0).^2+(Y-y0).^2) );
output(i) = 0;
end

end

