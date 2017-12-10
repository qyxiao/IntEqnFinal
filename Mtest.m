

clear all; 

N = 50; length = 2*pi;

theta_raw = linspace(0,length,N+1);
theta = theta_raw(1:N);
[X,Y] = sphere(1, theta);

p0_x = exp(2); p0_y = 1;

p1_x = 0.5; p1_y = 0.5;

value = length/N*(greens(X,Y,p1_x,p1_y)*greensDd( X, Y, 0, p0_x, p0_y )') - length/N*(greens(X,Y,p0_x,p0_y)*greensDd( X, Y, 0, p1_x, p1_y )') 

expected_value = log(sqrt((p0_x-p1_x)^2+(p0_y-p1_y)^2))/(2*pi)