function output_density = density_solver(mode,N,X,Y,dX,dY,h,BoundaryCondition)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


% weight for KR quadrature rule
weight1 = [1.825748 -1.325748];
weight2 = [4.967362 -1.6205015 2.585153 -2.222599 9.930104 -1.817995];
weight3 = [7.832432 -4.5651617 1.452168 -2.901348 3.870862 -3.523821 2.172421 -8.707796 2.053584 -2.166984];



if(mode==0) % using curvature as limit of singularity
sample_weight = ones(1,N)*h;

weight_matrix = zeros(N,N);
for i=1:N
   %greenDD = greensDd(X, Y, i, 0, 0);
   greenDD = greensDerN(X, Y, i,0,0, dX, dY);
   greenDD(i) = 1/(4*pi);
   weight_matrix(i,:) = circshift(sample_weight,i-1).*greenDD;
end
    
else    
if(mode==1)
sample_acc = 2;
weight_corrected = weight1;
end
if(mode==2)
sample_acc = 6;
weight_corrected = weight2;
end
if(mode==3)
sample_acc = 10;
weight_corrected = weight3;
end

sample_weight = ones(1,N); 
sample_weight(1) = 0;
sample_weight(2:2+sample_acc-1) = sample_weight(2:2+sample_acc-1) + weight_corrected;
sample_weight(N-sample_acc+1:N) = sample_weight(N-sample_acc+1:N) + fliplr(weight_corrected);
sample_weight = h*sample_weight;


weight_matrix = zeros(N,N);
for i=1:N   
   greenDD = greensDerN(X, Y, i,0,0, dX, dY);
   weight_matrix(i,:) = circshift(sample_weight,i-1).*greenDD;
end


end

LHS =  -eye(N,N)/2 - weight_matrix ;
output_density = LHS\BoundaryCondition;

