%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saurabh Biswas, Dheeraj Lokam, Anuj Mubayi
% October 24, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_hist_paramsAndOutput(par_params, par_output)


numberParams = size(par_params, 2); % get number of params
% NOTE: I'm assuming only 1 output
totalNum = numberParams + 1;

numCols = 3; % szy: forcing number of columns to be 3
numRows = ceil( totalNum / numCols ); % szy: quick and dirty way to calculate the max number of rows I could have

fontSize = 10;

figure
for i=1:numberParams % for params only
    subplot(numRows, numCols, i);
    hist( par_params(i).data );
    title([ par_params(i).paramName sprintf(' Mean=%4.3f, Std=%4.3f', mean(par_params(i).data), std(par_params(i).data))],'fontsize',fontSize);
end

subplot(numRows, numCols, totalNum); % for output only
hist( par_output );
title([ 'R_0' sprintf(' Mean=%4.3f, Std=%4.3f', mean(par_output), std(par_output))],'fontsize',fontSize);
   
end
