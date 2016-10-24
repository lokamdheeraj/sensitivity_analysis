%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modified the original code to display 'bottom' OR 'top'
% PRCC values, based on sign of value.
% MOST EDIT LEGEND TO MATCH YOUR MODEL IN THIS FUNCTION.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saurabh Biswas, Dheeraj Lokam, Anuj Mubayi
% October 24, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_PRCC(par_PRCC, par_numParams)

% UPDATE\EDIT lgnd
lgnd={'\beta_2'; '\theta_T'; '\phi'; '\gamma'; '\theta_U'; '\psi'; '\nu'; '\mu'};

PRCC = par_PRCC;

[PRCC_ordered IX1]=sort(PRCC); % szy: IX1 stores original order of each PRCC value with respect to raw sort
[absPRCC IX2]=sort(abs(PRCC)); % szy: IX2 stores original order of each PRCC value with respect absolute value sort




%x1=linspace(1,13,13);
x1=linspace(1,par_numParams,par_numParams); %szy: updated to match logic of original code

figure
h=bar(PRCC(IX2));
colormap;

set(gca,'XTickLabel','');

ylim([-1.2 1.2]); %szy: need more room for value labels

for i=1:x1(end)
    if (PRCC(i) < 0) % szy: if neg val, then 'VerticalAlignment','top'
        pos = find(IX2==i);
        text(x1(pos),PRCC(i),strcat('(',lgnd(i),',',num2str(PRCC(i),2),')'),...
            'VerticalAlignment','top',...
            'HorizontalAlignment','center',...
            'fontsize', 12);
    else % szy: if neg val, then 'VerticalAlignment','bottom'
        pos = find(IX2==i);
        text(x1(pos),PRCC(i),strcat('(',lgnd(i),',',num2str(PRCC(i),2),')'),...
            'VerticalAlignment','bottom',...
            'HorizontalAlignment','center',...
            'fontsize', 12);
    end
end

strLabel{1} = 'Sensitivity Indexes of R_0';
strLabel{2} = 'Controlling for Each Parameter';
ylabel( strLabel, 'fontsize', 14);



hold on

% plot([min(x1), max(x1)],[0.5, 0.5],'r-.');
hline(0.5,'r-.','Critical value of Statistical Significant')
hline(-0.5,'r-.','Critical value of Statistical Significant')

hold off



end    
    