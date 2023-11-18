function mlist=eulerchk(k)
%function mlist=eulerchk(p)
%
%Octave / Matlab version of Euler Check code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives list of integers m for which m^2+m+41 is prime
%for m up to a given number k
%
%Inputs
%  k - a positive integer
%Output
%  mlist - list of integers m for which m^2+m+41 is prime

ms=0:k;
mlist=ms(isprime(ms.^2+2*ms+41));
