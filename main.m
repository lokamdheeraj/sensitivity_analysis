% This is the main file used to perform Uncertainty
% and Sensitivity Analysis (specifically, LHS & PRCC methods).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saurabh Biswas, Dheeraj Lokam, Anuj Mubayi
% October 24, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all

n = 1000; % size of sample (n); number of simulations/runs

LHS_params = initialize_params(n);

R_0 = func_output(n, LHS_params);
R_0 = R_0';


% szy: need to get data from each params to use func_prcc()
numberParams = size(LHS_params, 2); % get number of params
LHS_matrix = [];
for i=1:numberParams
    LHS_matrix = [LHS_matrix LHS_params(i).data];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Sensitivity Analysis Results:

% PRCC (sensitivity indexes of R_0 with respect to each parameter):
PRCC_R0 = function_Prcc(R_0, LHS_matrix);

% plots:
plot_hist_paramsAndOutput(LHS_params, R_0);
plot_PRCC(PRCC_R0, numberParams);
