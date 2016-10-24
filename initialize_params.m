%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define your parameters and their related data here.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saurabh Biswas, Dheeraj Lokam, Anuj Mubayi
% October 24, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function params = initialize_params(par_n)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% szy: using a struct to store parameters/inputs
% The following are the most common fields needed for parameters:
field1 = 'paramName';       value1 = ''; % NAME OF PARAMETER
field2 = 'distribution';    value2 = ''; % NAME OF PARAMETER'S DISTRIBUTION
field3 = 'mean';            value3 = 0.0; % PARAMETER'S MEAN (USE DEPENDS ON TYPE OF DISTRIBUTION)
field4 = 'sigma';           value4 = 0.0; % PARAMETER'S STANDARD DEVIATION (USE DEPENDS ON TYPE OF DISTRIBUTION)
field5 = 'min';             value5 = 0.0; % PARAMETER'S MINIMUM (USE DEPENDS ON TYPE OF DISTRIBUTION)
field6 = 'max';             value6 = 0.0; % PARAMETER'S MAXIMUM (USE DEPENDS ON TYPE OF DISTRIBUTION)
field7 = 'data';            value7 = []; % PARAMETER'S DATA/VALUES

% create struct
params = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EDIT THE FOLLOWING FOR YOUR OWN PARAMETERS
% NOTE: params(param_id).distribution MUST BE SET TO 'Normal' OR 'Uniform' OR 'Exponential'

param_id = 1;
params(param_id).paramName = 'beta2';
params(param_id).distribution = 'Normal'; % MUST input EXACTLY
params(param_id).mean = 5.623;
params(param_id).sigma = 0.70818;
params(param_id).data = generateLHS( par_n, params(1) );

param_id = 2;
params(param_id).paramName = 'thetaT';
params(param_id).distribution = 'Normal';
params(param_id).mean = 2.46;
params(param_id).sigma = 0.4469;
params(param_id).data = generateLHS( par_n, params(param_id) );

param_id = 3;
params(param_id).paramName = 'phi';
params(param_id).distribution = 'Normal';
params(param_id).mean = 2.813;
params(param_id).sigma = 0.4468;
params(param_id).data = generateLHS( par_n, params(param_id) );

param_id = 4;
params(param_id).paramName = 'gamma';
params(param_id).distribution = 'Normal';
params(param_id).mean = 1.6695;
params(param_id).sigma = 0.44719;
params(param_id).data = generateLHS( par_n, params(param_id) );

param_id = 5;
params(param_id).paramName = 'thetaU';
params(param_id).distribution = 'Normal';
params(param_id).mean = 2.825;
params(param_id).sigma = 0.22355;
params(param_id).data = generateLHS( par_n, params(param_id) );

param_id = 6;
params(param_id).paramName = 'psi';
params(param_id).distribution = 'Normal';
params(param_id).mean = 0.067398;
params(param_id).sigma = 0.009998;
params(param_id).data = generateLHS( par_n, params(param_id) );

param_id = 7;
params(param_id).paramName = 'nu';
params(param_id).distribution = 'Uniform';
params(param_id).min = 0.0208;
params(param_id).max = 0.0265;
params(param_id).data = generateLHS( par_n, params(param_id) );

param_id = 8;
params(param_id).paramName = 'mu';
params(param_id).distribution = 'Uniform';
params(param_id).min = 6.4*10^(-3);
params(param_id).max = 7.0*10^(-3);
params(param_id).data = generateLHS( par_n, params(param_id) );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% local function to generate samples using LHS
function sampleData = generateLHS(par_n, par_params)
    sample = lhsdesign(par_n, 1); % get LHS samples
    par_params.data = zeros(par_n,1);
    
    switch par_params.distribution
        case 'Normal'
            sampleData = icdf(par_params.distribution, sample, par_params.mean, par_params.sigma);
        case 'Uniform'
            sampleData = icdf(par_params.distribution, sample, par_params.min, par_params.max);
        case 'Exponential'
            sampleData = icdf(par_params.distribution, sample, par_params.mean);
        otherwise
           % data will remain as all zeros
    end
end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  