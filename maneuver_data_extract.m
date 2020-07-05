%% maneuver data extraction
% uses all data marked only.
function maneuver_data_list = maneuver_data_extract(AllData_marked,Maneuvers_cat)
Maneuvers_cat = categorical(Maneuvers_cat);
n = length(Maneuvers_cat); %number of unique manuevers
m = length(AllData_marked(1,:))-1;
% maneuver_ss_list = cell(n,m); % initializing array with all maneuver data
GT= AllData_marked(:,end);
GT_diff = diff(GT);
max_occ = 0;
for i=1:n
ind_ss = find(abs(GT_diff) == i);
if length(ind_ss)/2 > max_occ
    max_occ = length(ind_ss)/2;
end
% maneuver_data_list = cell(n,max_occ); % initializing array with all maneuver data
for j= 1:length(ind_ss)/2
    start = ind_ss(2*j-1);
    endd = ind_ss(2*j);
    maneuver_data_list{i,j} = AllData_marked(start:endd,1:end-1);
    maneuver_data_list{i,j}(:,1) = maneuver_data_list{i,j}(:,1) - maneuver_data_list{i,j}(1,1);
%     maneuver_ss_list{i,j} = zeros(start-endd,m)
end
end

end

