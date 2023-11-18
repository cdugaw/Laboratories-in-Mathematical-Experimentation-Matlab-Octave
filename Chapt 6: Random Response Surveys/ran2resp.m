function OpCharAvg=ran2resp(GrpSize,YesInGrp,PrRealQ,PrYesDecoy,NRep,PrntFreq)
%function OpCharAvg=ran2resp(GrpSize,YesInGrp,PrRealQ,PrYesDecoy,NRep,PrntFreq)
%
%Octave / Matlab version of ran2resp code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives count of primes less or equal to given number n
%
%Inputs
%  GrpSize - group size
%  YesInGrp - number of true "yes" people in group
%  PrRealQ - probbility of real question
%  PrYesDecoy - probability of "yes" answer to the decoy question
%  NRep - number of replications of simulated survey
%  PrntFreq - how often to see results of simulation (0 = only final result)
%Output
%  OpCharAvg - Average of Operating Characteristic
%  A summary output tables will be printed to screen

OpCharAvg=0;  %Variable to track average operating characteristic
NoInGrp=GrpSize-YesInGrp; %number of True No respondents
True = YesInGrp/GrpSize; %true proportion of Yes in group

for k=1:NRep
  %compute answers for true yes respondents
  dimes=rand(1,YesInGrp)<PrRealQ;      %vector of dime flip outcomes 0 or 1
  pennies=rand(1,YesInGrp)<PrYesDecoy; %vector of penny flip outcomes 0 or 1
  NYes=sum(dimes); %all true yes answer yes to real question
  NYes=NYes+sum((1-dimes).*pennies); %got decoy and answered yes

  %compute answers for true no respondents
  dimes=rand(1,NoInGrp)<PrRealQ;      %vector of dime flip outcomes 0 or 1
  pennies=rand(1,NoInGrp)<PrYesDecoy; %vector of penny flip outcomes 0 or 1
  NYes=NYes+sum((1-dimes).*pennies); %got decoy and answered yes

  %************ SET ESTIMATE AND OPCHAR HERE ************%
  Estimate = NYes/GrpSize;
  OpChar = Estimate;
  %******************************************************%

  %Update Cumaltive Data
  OpCharAvg=OpCharAvg+OpChar;

  if PrntFreq>0 && mod(k,PrntFreq)==0 %check to print
    fprintf('Average Operating Characteristic after %u steps is %g \n\n',k,OpCharAvg/k)
  end; %if
end; %for
OpCharAvg=OpCharAvg/NRep;
