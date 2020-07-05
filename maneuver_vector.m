%% Generate Maneuver vector 
% Getting a N x 1 vector corresponding to sensor data marked with maneuver values
function GT = maneuver_vector(T,fs,GroundTruth,Maneuvers_cat) %add x maneuver list so that it does only work with extracted maneuvers 

GT = zeros(length(T),1);
m_array = GroundTruth(:,1);
m_array = table2array(m_array);
Maneuver_list = Maneuvers_cat;
Maneuvers = categorical(m_array);

for i= 1:length(m_array)
    start= table2array(GroundTruth(i,2))*fs;
    endd = table2array(GroundTruth(i,3))*fs;
    
    ind=find(Maneuver_list == Maneuvers(i));
    index{i} = ind;
    
    for j= round(start):round(endd)

        GT(j)= ind;
    end
end

end