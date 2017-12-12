
clear all; clc

N = 180; length = 2*pi; 

theta_all = linspace(0,length,N+1);
theta = theta_all(1:N);
[X,Y] = sphere(1, theta); 
p0_x = 20; p0_y = 0;

weight1 = [1.825748 -1.325748];
weight2 = [4.967362 -1.6205015 2.585153 -2.222599 9.930104 -1.817995];
weight3 = [7.832432 -4.5651617 1.452168 -2.901348 3.870862 -3.523821 2.172421 -8.707796 2.053584 -2.166984];

h = length/N;

sample_acc = 2;
sample_weight = ones(1,N); 
sample_weight(1) = 0;
sample_weight(2:2+sample_acc-1) = sample_weight(2:2+sample_acc-1) + weight1;
sample_weight(N-sample_acc+1:N) = sample_weight(N-sample_acc+1:N) + fliplr(weight1);
sample_weight = h*sample_weight;


weight_matrix = zeros(N,N);
for i=1:N
   
   greenDD = greensDd(X, Y, i, 0, 0);
   weight_matrix(i,:) = circshift(sample_weight,i-1).*greenDD;
end
LHS =  -eye(N,N)/2 - weight_matrix ;
density = LHS\greens(X,Y,0,p0_x,p0_y)';
%density = 2*weight_matrix\ones(N,1);

a = linspace(-0.9,0.9,30); b = [];
for i = a
b = [b -sum(greensDd(X,Y,0,i,i).*density')*h];
end
figure(2);hold on; plot(a,b);title(['N=',num2str(N)]);

expected = -1/(2*pi)*log(sqrt((a-p0_x).^2+(a-p0_y).^2));
plot(a,expected);hold off;legend('solver','expected') 

%value = sum(greensDd(X,Y,0,0,0).*density')*h;

%figure(1); plot(X,Y,'r*')
