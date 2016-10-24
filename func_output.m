%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculates outputs (y-values [ie. R_0]), given
% inputs/parameters (x-values).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EDIT YOUR OUTPUT FUNCTION HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saurabh Biswas, Dheeraj Lokam, Anuj Mubayi
% October 24, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[output]=func_output(par_n, par_parameters)

%count_n = length(LHS_params); % get num rows/runs
%num_parameters = size(par_parameters,2); % get num cols/num params

%szy: quick and dirty for now
% szy: USER MUST EDIT ----parameter names and OUTPUT func!!!!
beta2 = par_parameters(1).data;
thetaT = par_parameters(2).data;
phi = par_parameters(3).data;
gamma = par_parameters(4).data;
thetaU = par_parameters(5).data;
psi = par_parameters(6).data;
nu = par_parameters(7).data;
mu = par_parameters(8).data;


% My application requires calculation of R_0 (our output) for each parameter 
output=[];
for i=1:par_n
    num = ( gamma(i) + thetaT(i) + mu(i) )* beta2(i) * ( psi(i) + mu(i)  );
    denom = ( thetaT(i) + mu(i) )* ( psi(i)*(thetaU(i)+gamma(i)+mu(i)+nu(i)) + mu(i)*(thetaU(i)+phi(i)+gamma(i)+mu(i)+nu(i)) );
    
    output(i) = num  / denom;
end
