%% maneuver start stop extraction
function maneuver_ss_list = maneuver_ss_extract(GroundTruth,Maneuvers_cat,fs)
Maneuvers_cat = categorical(Maneuvers_cat);
n=length(Maneuvers_cat); %number of unique manuevers
maneuver_ss_list = cell(1,n); % initializing array with all maneuver start stop
fs=50; %sampling frequence of dataset
Maneuvers_GT = table2array(GroundTruth(:,1))
for i=1:n
ind = find(Maneuvers_GT == Maneuvers_cat(i));
maneuver_ss_list{i} = zeros(length(ind),2);
for j= 1:length(ind)
    maneuver_ss_list{i}(j,1)= ceil(table2array(GroundTruth(ind(j),2))*fs);
    maneuver_ss_list{i}(j,2)= ceil(table2array(GroundTruth(ind(j),3))*fs);
end
end
% maneuver_ss_list= maneuver_ss_list';
end

