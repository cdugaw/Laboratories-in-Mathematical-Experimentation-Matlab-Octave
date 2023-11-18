function [pi1,pi3]=primesmod4(n)
%function [pi1,pi3]=primesmod4(n)
%
%Octave / Matlab version of Count Primes Mod 4 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives counts of primes that are less or equal to given number n
%that are congruent to 1 mod 4, and 3 mod 4.
%
%Inputs
%  n - a positive integer
%Output
%  pi1 - count of primes less or equal to n that are congruent to
%        to 1 mod 4
%  pi3 - count of primes less or equal to n that are congruent to
%        to 3 mod 4

theprimesmod4=mod(primes(n),4);
pi1=sum(theprimesmod4==1);
pi3=sum(theprimesmod4==3);

