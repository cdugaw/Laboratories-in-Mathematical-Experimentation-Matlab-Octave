function PP=mersennechk(p)
%function PP=mersennechk(p)
%
%Octave / Matlab version of Mersenne Check code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Determines if 2^p-1 is prime for a given a positive integer p
%
%Inputs
%  p - a positive integer less than 65
%Output
%  PP - indicates if 2^p-1 is prime
%       PP=1 if 2^p-1 is prime, PP=0 if 2^p-1 is not prime

if p>64
  error('Input p must be less than 65')
end; %if

PP=isprime(2^p-1);
