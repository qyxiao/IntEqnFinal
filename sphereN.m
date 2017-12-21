function [ X, Y, dX, dY, h] = sphereN( r,n )
%UNTITLED4 Summary of this function goes here
%   seperate the sphere centered at origin with radius r equally into n parts, 
%   return the coordinate (X,Y) of the seperate points as well as the inward unit vector (dX, dY)   
theta = linspace(0,2*pi,n+1);
theta = theta(1:n);
X = r*cos(theta);
Y = r*sin(theta);
%%% should change sign later
dX = cos(theta);  
dY = sin(theta);
h = 2*pi/n;
end

