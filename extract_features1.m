%% feature extractor 1

function feature_matrix_1 = extract_features1(AllData_win_marked,fs,wsize,osize)

if osize~=0
% for non-overlapping windomized data
n_windows = AllData_win_marked(:,1);
n_features = ;
feature_matrix_1 = zeros(n_windows,n_features);

% confusion if it should be 1 to wsize or 1 to wsize-1
AllData_cell = cell(1,9);
AccX = AllData_win_marked(:,1:wsize);
AccY = AllData_win_marked(:,wsize+1:2*wsize);
AccZ = AllData_win_marked(:,2*wsize+1:3*wsize);
GyroX = AllData_win_marked(:,2*wsize+1:4*wsize);
GyroY = AllData_win_marked(:,2*wsize+1:5*wsize);
GyroZ = AllData_win_marked(:,2*wsize+1:6*wsize);
MagX = AllData_win_marked(:,2*wsize+1:7*wsize);
MagY = AllData_win_marked(:,2*wsize+1:8*wsize);
MagZ = AllData_win_marked(:,2*wsize+1:9*wsize);

%first mean of all DoF data
feature_matrix_1(:,1) = mean(AccX,2);
feature_matrix_1(:,2) = mean(AccY,2);
feature_matrix_1(:,3) = mean(AccZ,2);
feature_matrix_1(:,4) = mean(GyroX,2);
feature_matrix_1(:,5) = mean(GyroY,2);
feature_matrix_1(:,6) = mean(GyroZ,2);
feature_matrix_1(:,7) = mean(MagX,2);
feature_matrix_1(:,8) = mean(MagY,2);
feature_matrix_1(:,9) = mean(MagZ,2);

feature_matrix_1(:,10) = var(AccX,2);
feature_matrix_1(:,11) = var(AccY,2);
feature_matrix_1(:,12) = var(AccZ,2);
feature_matrix_1(:,13) = var(GyroX,2);
feature_matrix_1(:,14) = var(GyroY,2);
feature_matrix_1(:,15) = var(GyroZ,2);
feature_matrix_1(:,16) = var(MagX,2);
feature_matrix_1(:,17) = var(MagY,2);
feature_matrix_1(:,18) = var(MagZ,2);



for i=1:length(n_windows)
%first mean of all DoF data
feature_matrix_1(i,1) = mean(AccX(i,:));
feature_matrix_1(i,2) = mean(AccY(i,:));
feature_matrix_1(i,3) = mean(AccZ(i,:));
feature_matrix_1(i,4) = mean(GyroX(i,:));
feature_matrix_1(i,5) = mean(GyroY(i,:));
feature_matrix_1(i,6) = mean(GyroZ(i,:));
feature_matrix_1(i,7) = mean(MagX(i,:));
feature_matrix_1(i,8) = mean(MagY(i,:));
feature_matrix_1(i,9) = mean(MagZ(i,:));

%second variance of all Data
feature_matrix_1(i,10) = mean(AccX(i,:));
feature_matrix_1(i,11) = mean(AccY(i,:));
feature_matrix_1(i,12) = mean(AccZ(i,:));
feature_matrix_1(i,13) = mean(GyroX(i,:));
feature_matrix_1(i,14) = mean(GyroY(i,:));
feature_matrix_1(i,15) = mean(GyroZ(i,:));
feature_matrix_1(i,16) = mean(MagX(i,:));
feature_matrix_1(i,17) = mean(MagY(i,:));
feature_matrix_1(i,18) = mean(MagZ(i,:));

%third

end

else
% for overlapping windomized_data    
    
    
end


end

