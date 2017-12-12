

clear all; 

N = 200; length = 2*pi; h = length/N;

theta_raw = linspace(0,length,N+1);
theta = theta_raw(1:N);
[X,Y] = sphere(1, theta);

p0_x = exp(2); p0_y = 1;

p1_x = 0.5;p1_y = -0.5;

% value = h*(greens(X,Y,0,p1_x,p1_y)*greensDd( X, Y, 0, p0_x, p0_y )') -
% h*(greens(X,Y,0,p0_x,p0_y)*greensDd( X, Y, 0, p1_x, p1_y )') %%% used h
% instead of length/N
 
% expected_value = log(sqrt((p0_x-p1_x)^2+(p0_y-p1_y)^2))/(2*pi)



weight1 = [1.825748 -1.325748];
weight2 = [4.967362 -1.6205015 2.585153 -2.222599 9.930104 -1.817995];
weight3 = [7.832432 -4.5651617 1.452168 -2.901348 3.870862 -3.523821 2.172421 -8.707796 2.053584 -2.166984];

num = 11;


sample_acc = 2;
sample_weight = ones(1,N); 
sample_weight(1) = 0;
sample_weight(2:2+sample_acc-1) = sample_weight(2:2+sample_acc-1) + weight1;
sample_weight(N-sample_acc+1:N) = sample_weight(N-sample_acc+1:N) + fliplr(weight1);
sample_weight = h*sample_weight;

value = (greens(X,Y,num,p1_x,p1_y).*greensDd( X, Y, 0, p0_x, p0_y ))*sample_weight' - (greens(X,Y,0,p0_x,p0_y).*greensDd( X, Y, num, p1_x, p1_y ))*sample_weight'

expected_value = log(sqrt((p0_x-X(num))^2+(p0_y-Y(num))^2))/(2*pi*2)