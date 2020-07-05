%% Marked Segmentation Based on Maneuvers-
% AllData_segmented = markedsegmentation(AllData_marked)

function AllData_segmented = markedsegmentation(AllData_marked)
ind = find(AllData_marked(:,end) > 0);
AllData_segmented = AllData_marked(ind,:);
end



