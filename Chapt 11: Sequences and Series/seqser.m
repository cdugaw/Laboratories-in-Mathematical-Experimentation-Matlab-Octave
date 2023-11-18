function [ak,sk]=seqser(f,n,ploton)
%function [ak,sk]=seqser(f,n,ploton)
%
%Octave / Matlab version of Sequence and Series code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Computes sequence of terms and partial sums for a series and
%plots the result
%
%Inputs
%  f - a function f that gives the terms (f(k)=a_k)
%  n - number of terms to use
%  ploton - option input: if 1 then plots, if 0 no plot produced
%           plot produced by default
%Output
%  ak - a vector of terms of the series
%  sk - a vector of partial sums

if nargin < 3
  ploton=1; %if ploton input not used plot
end; %if

ak=zeros(1,n); %initialize vector of terms
pk=zeros(1,n); %initialize vector of partial sums
ak(1)=f(1);    %first term
sk(1)=ak(1);   %first partial sum
for k = 2:n
  ak(k)=f(k);
  sk(k)=sk(k-1)+ak(k);
end; %for

%generate plots
if ploton
   ks=1:n;
   subplot(2,1,1)
   plot(ks,ak,'k.')
   ylabel('a_k')
   xlabel('k')
   set(gca,'FontSize',20)

   subplot(2,1,2)
   plot(ks,sk,'k.')
   ylabel('s_k')
   xlabel('k')
   set(gca,'FontSize',20)
end; %if
