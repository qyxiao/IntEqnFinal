function output = point_solver( density, test_x, test_y, X, Y, dX, dY, h)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

N = length(test_x);
b = zeros(1,N);
for i = 1:N
b(i) = -sum(greensDerN(X,Y,0,test_x(i),test_y(i),dX,dY).*density')*h;
end

output = b;


end

