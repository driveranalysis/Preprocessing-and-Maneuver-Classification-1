%% Maneuver Start Stop Marking on AllData
% agnostic to maneuvers
% Strategy 1: using GroundTruth
% Strategy 2: using marked Data

%Strategy 1 used: using only marked Data
% Note: doesnt account for windowed data and marking windows, only 1 start
% and stop
function AllData_mss_marked = maneuver_ss_mark(AllData_marked)

GT = AllData_marked(:,end)';
GT_diff = diff(GT);
% start_ind = GT_diff>0;
% stop_ind = GT_diff<0;
% GT_ss(start_ind) = 1;
% GT_ss(stop_ind) = -1;
% GT_ss(GT_diff>0) =1;
% GT_ss(GT_diff<0) =-1;
GT_mss = GT_diff;
AllData_mss_marked = [AllData_marked(:,1:end-1) GT_mss];
end
