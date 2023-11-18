function []=ran1resp(GrpSize,YesInGrp,PrRealQ,PrYesDecoy,NRep,PrntFreq)
%function []=ran1resp(GrpSize,YesInGrp,PrRealQ,PrYesDecoy,NRep,PrntFreq)
%
%Octave / Matlab version of Prime Count code from
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
%  PrntFreq - how often to see results of simulation (0 gives only summary)
%Output
%  None, summary output tables will be printed to screen

TrueYes = 1;  %row for true yes respondents
TrueNo = 2;   %row for true no respondents
Real = 1;  %column for real question
Decoy = 2; %column for decoy question
Total = 3; %column or row for totals
NoInGrp = GrpSize - YesInGrp; %number of true no respondents
YesAnsCum = zeros(3); %matrix for cumlative yes answer data across simulations
NoAnsCum = zeros(3);  %matrix for cumlative no answer data across simulations
AllAnsCum = zeros(3);  %matrix for cumlative data across simulations

for k=1:NRep
  YesAns = zeros(3); %matrix for yes answer data
  NoAns = zeros(3);  %matrix for no answer data

  %compute answers for true yes respondents
  dimes=rand(1,YesInGrp)<PrRealQ;      %vector of dime flip outcomes 0 or 1
  pennies=rand(1,YesInGrp)<PrYesDecoy; %vector of penny flip outcomes 0 or 1
  YesAns(TrueYes,Real)=sum(dimes); %all true yes answer yes to real question
  YesAns(TrueYes,Decoy)=sum((1-dimes).*pennies); %got decoy and answered yes
  NoAns(TrueYes,Decoy)=sum((1-dimes).*(1-pennies)); %got decoy and answered no

  %compute answers for true no respondents
  dimes=rand(1,NoInGrp)<PrRealQ;      %vector of dime flip outcomes 0 or 1
  pennies=rand(1,NoInGrp)<PrYesDecoy; %vector of penny flip outcomes 0 or 1
  YesAns(TrueNo,Decoy)=sum((1-dimes).*pennies); %got decoy and answered yes
  NoAns(TrueNo,Real)=sum(dimes);    %all true no answer no to real question
  NoAns(TrueNo,Decoy)=sum((1-dimes).*(1-pennies)); %got decoy and answered no

  %compute totals
  YesAns(TrueYes,Total)=YesAns(TrueYes,Real)+YesAns(TrueYes,Decoy);
  YesAns(TrueNo,Total)=YesAns(TrueNo,Real)+YesAns(TrueNo,Decoy);
  %total row sum of other rows
  YesAns(Total,:)=YesAns(TrueYes,:)+YesAns(TrueNo,:);

  NoAns(TrueYes,Total)=NoAns(TrueYes,Real)+NoAns(TrueYes,Decoy);
  NoAns(TrueNo,Total)=NoAns(TrueNo,Real)+NoAns(TrueNo,Decoy);
  %total row sum of other rows
  NoAns(Total,:)=NoAns(TrueYes,:)+NoAns(TrueNo,:);

  AllAns = YesAns+NoAns; %Summary for all respondents

  %Update Cumaltive Data
  YesAnsCum=YesAnsCum+YesAns;
  NoAnsCum=NoAnsCum+NoAns;
  AllAnsCum=AllAnsCum+AllAns;

  if PrntFreq>0 && mod(k,PrntFreq)==0 %check to print
    fprintf('===============================================\n')
    fprintf('\t     Simulation Number %u \n',k)
    fprintf('===============================================\n')

    fprintf('\nYES ANSWERS\n')
    fprintf('\n\t \t Real  \t   Decoy  \t Total \n')
    fprintf('True Yes  %10u  %10u %12u \n',YesAns(1,1),YesAns(1,2),YesAns(1,3))
    fprintf('True No   %10u  %10u %12u \n',YesAns(2,1),YesAns(2,2),YesAns(2,3))
    fprintf('Total     %10u  %10u %12u \n',YesAns(3,1),YesAns(3,2),YesAns(3,3))
    fprintf('-----------------------------------------------\n\n')


    fprintf('NO ANSWERS\n')
    fprintf('\n\t \t Real  \t   Decoy  \t Total \n')
    fprintf('True Yes  %10u  %10u %12u \n',NoAns(1,1),NoAns(1,2),NoAns(1,3))
    fprintf('True No   %10u  %10u %12u \n',NoAns(2,1),NoAns(2,2),NoAns(2,3))
    fprintf('Total     %10u  %10u %12u \n',NoAns(3,1),NoAns(3,2),NoAns(3,3))
    fprintf('-----------------------------------------------\n\n')

    fprintf('ALL ANSWERS\n')
    fprintf('\n\t \t Real  \t   Decoy  \t Total \n')
    fprintf('True Yes  %10u  %10u %12u \n',AllAns(1,1),AllAns(1,2),AllAns(1,3))
    fprintf('True No   %10u  %10u %12u \n',AllAns(2,1),AllAns(2,2),AllAns(2,3))
    fprintf('Total     %10u  %10u %12u \n',AllAns(3,1),AllAns(3,2),AllAns(3,3))
    fprintf('-----------------------------------------------\n\n')

    fprintf('AVERAGES BASED ON %u SIMULATIONS\n',k)
    fprintf('-----------------------------------\n')

    printf('\nAVERAGE YES ANSWERS\n')
    fprintf('\n\t \tReal  \t   Decoy  \tTotal \n')
    fprintf('True Yes  %10.2f  %10.2f %12.2f \n',YesAnsCum(1,1)/k,YesAnsCum(1,2)/k,YesAnsCum(1,3)/k)
    fprintf('True No   %10.2f  %10.2f %12.2f \n',YesAnsCum(2,1)/k,YesAnsCum(2,2)/k,YesAnsCum(2,3)/k)
    fprintf('Total     %10.2f  %10.2f %12.2f \n',YesAnsCum(3,1)/k,YesAnsCum(3,2)/k,YesAnsCum(3,3)/k)
    fprintf('-----------------------------------------------\n\n')


    fprintf('AVERAGE NO ANSWERS\n')
    fprintf('\n\t \tReal  \t   Decoy  \tTotal \n')
    fprintf('True Yes  %10.2f  %10.2f %12.2f \n',NoAnsCum(1,1)/k,NoAnsCum(1,2)/k,NoAnsCum(1,3)/k)
    fprintf('True No   %10.2f  %10.2f %12.2f \n',NoAnsCum(2,1)/k,NoAnsCum(2,2)/k,NoAnsCum(2,3)/k)
    fprintf('Total     %10.2f  %10.2f %12.2f \n',NoAnsCum(3,1)/k,NoAnsCum(3,2)/k,NoAnsCum(3,3)/k)
    fprintf('-----------------------------------------------\n\n')

    fprintf('AVERAGE ALL ANSWERS\n')
    fprintf('\n\t \tReal  \t   Decoy  \tTotal \n')
    fprintf('True Yes  %10.2f  %10.2f %12.2f \n',AllAnsCum(1,1)/k,AllAnsCum(1,2)/k,AllAnsCum(1,3)/k)
    fprintf('True No   %10.2f  %10.2f %12.2f \n',AllAnsCum(2,1)/k,AllAnsCum(2,2)/k,AllAnsCum(2,3)/k)
    fprintf('Total     %10.2f  %10.2f %12.2f \n\n',AllAnsCum(3,1)/k,AllAnsCum(3,2)/k,AllAnsCum(3,3)/k)
  end; %if
end; %for

if PrntFreq=0 | mod(k,PrntFreq)>0 %if final result not printed, print it
  fprintf('\n-----------------------------------\n')
  fprintf('AVERAGES BASED ON %u SIMULATIONS\n',k)
  fprintf('-----------------------------------\n')

  fprintf('\nAVERAGE YES ANSWERS\n')
  fprintf('\n\t \tReal  \t   Decoy  \tTotal \n')
  fprintf('True Yes  %10.2f  %10.2f %12.2f \n',YesAnsCum(1,1)/k,YesAnsCum(1,2)/k,YesAnsCum(1,3)/k)
  fprintf('True No   %10.2f  %10.2f %12.2f \n',YesAnsCum(2,1)/k,YesAnsCum(2,2)/k,YesAnsCum(2,3)/k)
  fprintf('Total     %10.2f  %10.2f %12.2f \n',YesAnsCum(3,1)/k,YesAnsCum(3,2)/k,YesAnsCum(3,3)/k)
  fprintf('-----------------------------------------------\n\n')


  fprintf('AVERAGE NO ANSWERS\n')
  fprintf('\n\t \tReal  \t   Decoy  \tTotal \n')
  fprintf('True Yes  %10.2f  %10.2f %12.2f \n',NoAnsCum(1,1)/k,NoAnsCum(1,2)/k,NoAnsCum(1,3)/k)
  fprintf('True No   %10.2f  %10.2f %12.2f \n',NoAnsCum(2,1)/k,NoAnsCum(2,2)/k,NoAnsCum(2,3)/k)
  fprintf('Total     %10.2f  %10.2f %12.2f \n',NoAnsCum(3,1)/k,NoAnsCum(3,2)/k,NoAnsCum(3,3)/k)
  fprintf('-----------------------------------------------\n\n')

  fprintf('AVERAGE ALL ANSWERS\n')
  fprintf('\n\t \tReal  \t   Decoy  \tTotal \n')
  fprintf('True Yes  %10.2f  %10.2f %12.2f \n',AllAnsCum(1,1)/k,AllAnsCum(1,2)/k,AllAnsCum(1,3)/k)
  fprintf('True No   %10.2f  %10.2f %12.2f \n',AllAnsCum(2,1)/k,AllAnsCum(2,2)/k,AllAnsCum(2,3)/k)
  fprintf('Total     %10.2f  %10.2f %12.2f \n',AllAnsCum(3,1)/k,AllAnsCum(3,2)/k,AllAnsCum(3,3)/k)
  fprintf('-----------------------------------------------\n\n')
end; %if
