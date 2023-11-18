function []=euclid5(a,b)
%function []=euclid5(a,b)
%
%Octave / Matlab version of Euclid5 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Applies Euclidean algorithm to integers a and b to solve equation
%        a x + b y = gcd(a,b)
%
%Inputs
%  a - integer to apply Eucliden Algorithm to
%  b - other integer to apply Eucliden Algorithm to
%      Algorithm assumes a>b, if not code will swap a and b
%Output
%  none - output is print to screen

if b>a %if b>a, swap a and b
   c=b;
   b=a;
   a=c;
end; %if
a1=a; %save value of "a" input
b1=b; %save value of "b" input

%initalize variables for x,y.

%xold, yold represent x,y values from previous step
xold=1; %x_{-1} = 1
yold=0; %y_{-1} = 0

%x,y represent current x,y values
x=0;  %x_0 = 0
y=1;  %y_0 = 1

%initalize remainder
r=1;

while r!=0 %loop while remainder nonzero
  q=floor(a/b); %quotient
  r=rem(a,b);   %remainder
  if r==0 %done when remainder is 0
    fprintf('GCD = %d = %d*%d + %d*%d\n',b,a1,x,b1,y) %output equation
  end; %if
  xnew=xold-q*x;  %iterate x
  ynew=yold-q*y;  %iterate y
  %shift current values to old values
  xold=x;
  yold=y;
  %shift new values to current values
  x=xnew;
  y=ynew;
  a=b; %update a
  b=r; %update b
end; %while

