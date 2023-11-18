function []=planar2(A)
%function []=planar2(A)
%
%Octave / Matlab version Planer2 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Plots iterates of
%
%Inputs
%  A - a 2x2 matrix
%Output
%  none, produces a plot

m=17; %number of random inital vectors
n=25; %number of iterates for each random initial vector
clf; %clear figure
hold on %hold plot so all plots show on same axes
for i=1:m
x0=[2*rand-1;2*rand-1];
planar1(A,x0,n);
end; %for
hold off %turn off plot hold
