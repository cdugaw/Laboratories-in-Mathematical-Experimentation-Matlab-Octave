function [thegcd,numsteps,x]=euclid2(N)
%function [thegcd,numsteps,x]=euclid2(N)
%      or
%         [thegcd,numsteps]=euclid2(N)
%
%Octave / Matlab version of Euclid2 code from 
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%  
%Applies Euclidean algorithm to two random integers between 1 and N
%
%Input
%  N - a positive integer 
%Outputs
% thegcd - the gcd of the two random integers between 1 and N
% numsteps - the number of steps of the Euclidean algorithm required
% x - the two random integers selected (this output is optional)

x=floor(1+rand(2,1)*N); %creates a 2x1 vector of random integers 
[as,bs]=euclid1(x(1),x(2)); %applies euclidean algorithm
numsteps=length(as)-1; %number of steps is the number of entries in "as" minus 1
thegcd=as(end); %the last entry of "as" is the gcd
