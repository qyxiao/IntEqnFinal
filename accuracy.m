


clear all; clc

nums = [20, 40, 80, 160];
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

figure(1);hold on; loglog(2*pi./nums,maxSet);
end
legend('curvature limit','KR quadrature rule')



