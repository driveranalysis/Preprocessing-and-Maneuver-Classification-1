%% Maneuver Plots
% plotting all instances of a maneuver and its histogram
 
function [] = maneuver_plots(AllData_marked,maneuver_ss, Maneuver_cat,man)
if length(maneuver_ss{man}(:,1))>=1
    
n=length(maneuver_ss{man}(:,1));
for i=1:n
    start = maneuver_ss{man}(i,1);
    endd = maneuver_ss{man}(i,2);
plotManeuverDataHist(AllData_marked,start,endd, man, Maneuver_cat);
end
distFig('Rows',2,'Columns',n)
else
    'Maneuver Doesnt exist'
end
end
