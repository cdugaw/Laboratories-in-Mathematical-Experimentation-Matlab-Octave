function []=eulerc(N)
%function []=eulerc(N)
%
%Octave / Matlab version of Euclid3 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Produces a table of outputs for the harmonic series for
%A row for each value of n (1<=n<=N) contains the value
%of n, s_n (the nth partial sum), ln(n+1), and s_n-ln(n+1)
%
%Inputs
%  N - number of rows
%Output
%  none, a table is printed

f = @(x) 1/x; %function for term

[ak,sk]=seqser(f,N,0); %get sequence of partial sums
k=1:N; %vector of k values
lnk=log(k+1); %vector of ln of k+1 values
diffk=sk-lnk; %difference

%loop through and print results
for n=1:N
  if mod(n,20)==1 %every 20 terms print column labels
    fprintf('\n n \t \t  s_n \t \t ln(n+1) \t s_n-ln(n+1) \n')
  end; %if
  fprintf('%6g  \t %9g  \t  %9g  \t %12.12g \n',k(n),sk(n),lnk(n),diffk(n))
end

