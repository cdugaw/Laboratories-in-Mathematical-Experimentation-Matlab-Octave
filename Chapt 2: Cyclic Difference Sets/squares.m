function us=squares(m)
%function us=squares(m)
%
%Octave / Matlab version of Squares code from 
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Finds the unique squares mod m
%
%Inputs
% m - integer to compute squares modulo m
%Outputs
% us - vector of unique squares modulo m  
  
s=(1:(m-1)).^2;
s=mod(s,m);
us=unique(s);