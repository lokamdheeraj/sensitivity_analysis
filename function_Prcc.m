%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Corrected code so that PM is ranked.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saurabh Biswas, Dheeraj Lokam, Anuj Mubayi
% October 24, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[PRCC]=function_Prcc(Y,PM) 
% Y:response variable     % PM: parametric matrix output PRCC and PRCC ranked


  Y_ranked=rankingN(Y);             % call the rankingN function from previous work
  
  % szy: %%%%%%%%%%%%%%%%%%%%%%%%%%%%
  for i=1:size(PM,2)
      tmp_data = PM(:,i);
      PM(:,i) = rankingN(tmp_data);
  end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ParMetre=PM;                      % parametre matrix
  PRCC=[];
  
  for j=1:size(PM,2)                   
      PM_ranked=PM(:,j);
      PM(:,j)=[];                   % exclude the jth column
      whichstats={'r'};             % Use commond regstat we specify we need residual
      stats1=regstats(Y_ranked,PM,'linear',whichstats);
      Y_Residual=stats1.r;
      stats2=regstats(PM_ranked,PM,'linear',whichstats);
      PM_Residual=stats2.r;
      PRCC=[PRCC corr(Y_Residual,PM_Residual)];  % PRCC is the correlation coeff between the residuals
      PM=ParMetre;        
  end
  
