%% maneuver start stop extraction 2
% uses all data marked only.
function maneuver_ss_list = maneuver_ss_extract2(AllData_marked,Maneuvers_cat)
Maneuvers_cat = categorical(Maneuvers_cat);
n=length(Maneuvers_cat); %number of unique manuevers
maneuver_ss_list = cell(1,n); % initializing array with all maneuver start stop
GT= AllData_marked(:,end);
GT_diff = diff(GT);
for i=1:7
ind_ss = find(abs(GT_diff) == i);
maneuver_ss_list{i} = zeros(length(ind_ss)/2,2);
for j= 1:length(ind_ss)/2
    maneuver_ss_list{i}(j,1)= ind_ss(2*j-1);
    maneuver_ss_list{i}(j,2)= ind_ss(2*j);
end
end
% maneuver_ss_list= maneuver_ss_list';
end

