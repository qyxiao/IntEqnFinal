


clear all; clc

nums = [ 15, 20, 25, 30, 40, 50];
maxSet = zeros(1,length(nums));

for j = 0:1
for i = 1:length(nums)

N = nums(i); %% number of points taken on boundary 


%%% get coordinate and directional vector on the boundary
%%% boundary set to be circle centered at origin with radius 1
[X, Y, dX, dY, h] = sphereN(1,N);  

%%% boundary condition imposes is Newtonian potential from (p0_x,p0_y)
p0_x = 20; p0_y = 0;

%%% solving the density equation on boundary points 
density = density_solver(j,N,X,Y,dX,dY,h,greens(X,Y,0,p0_x,p0_y)');


%%% points used for accuracy test
a = linspace(-0.5,0.5,30); 
%%% calculate value on test points
b = point_solver( density, a, a, X, Y, dX, dY, h);

expected = -1/(2*pi)*log(sqrt((a-p0_x).^2+(a-p0_y).^2));

maxSet(i) = max(abs(b-expected));

end

figure(1);hold on; loglog(nums,maxSet);
end
legend('curvature limit','KR quadrature rule')
ylabel('error');xlabel('number of boundary points')
saveas(figure(1),'accuracy.png')

%%% code below plot the solution
n = 60; 
[i,j] = meshgrid(-n:n,-n:n);
test_x = i/(1.2*n); test_y = j/(1.1*n);
values = point_solver( density, test_x(:), test_y(:), X, Y, dX, dY, h);
expected = -1/(2*pi)*log(sqrt((test_x(:)-p0_x).^2+(test_y(:)-p0_y).^2));
diff = vec2mat(log(abs(values-expected')),size(test_x,1));
figure(2);pcolor(test_x,test_y,diff);shading flat;colorbar;
title('log error plot for KR quadrature rule solution')
saveas(figure(2),'solution.png')