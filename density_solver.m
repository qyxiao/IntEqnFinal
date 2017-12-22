function output_density = density_solver(mode,N,X,Y,dX,dY,h,BoundaryCondition)
%UNTITLED2 Summary of this function goes here
%  this function return density function values on points (X,Y)

if(mode==0) % use curvature as limit of singularity
sample_weight = ones(1,N)*h;

weight_matrix = zeros(N,N);
for i=1:N
   %greenDD = greensDd(X, Y, i, 0, 0);
   greenDD = greensDerN(X, Y, i,0,0, dX, dY);
   greenDD(i) = 1/(4*pi);
   weight_matrix(i,:) = circshift(sample_weight,i-1).*greenDD;
end
    
else   %% use KR quadrature rule 
sample_acc = 2;
weight_corrected =  [1.825748 -1.325748];

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

