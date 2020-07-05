%% Post Binary event maneuver classification using only overlapping windomized data as features

%% Preproccessing
[Acc1 Gyro1 Mag1] = preSamplingProcessing(Acceleration,Gyroscope,Magnetometer);
[Acc2 Gyro2 Mag2] = preSamplingProcessing(Acceleration2,Gyroscope2,Magnetometer2);
[Acc3 Gyro3 Mag3] = preSamplingProcessing(Acceleration3,Gyroscope3,Magnetometer3);


fs=50;
AllData1 = resampling(Acc1,Gyro1,Mag1,fs);
AllData2 = resampling(Acc2,Gyro2,Mag2,fs);
AllData3 = resampling(Acc3,Gyro3,Mag3,fs);

Maneuvers_cat = ["Non-aggressive event" "Aggressive left lane change" "Aggressive acceleration" "Aggressive breaking" "Aggressive left turn" "Aggressive right turn" "Aggressive right lane change"];
Maneuvers_cat = categorical(Maneuvers_cat);

GT1 = maneuver_vector(AllData1(:,1),fs,GroundTruth,Maneuvers_cat);
GT2 = maneuver_vector(AllData2(:,1),fs,GroundTruth2,Maneuvers_cat);
GT3 = maneuver_vector(AllData3(:,1),fs,GroundTruth3,Maneuvers_cat);

AllData1_marked = [AllData1 GT1];
AllData2_marked = [AllData2 GT2];
AllData3_marked = [AllData3 GT3];

AllData_marked = [AllData1_marked; AllData2_marked; AllData3_marked]; %accidentally left all as AllData1
AllData_owin_marked = mark_owindowed(AllData_marked,128,56);
AllData_owin_segmented = markedsegmentation(AllData_owin_marked);
%% test

maneuver_ss_list  = maneuver_ss_extract2(AllData_marked,Maneuvers_cat);
maneuver_plots(AllData_marked,maneuver_ss_list,Maneuvers_cat,2);


%% Training
%% Testing

[Acc4 Gyro4 Mag4] = preSamplingProcessing(Acceleration4,Gyroscope4,Magnetometer4);
fs=50;
AllData4 = resampling(Acc4,Gyro4,Mag4,fs);
GT4 = maneuver_vector(AllData4(:,1),fs,GroundTruth4,Maneuvers_cat);
AllData4_marked = [AllData4 GT4];
AllData4_owin_marked = mark_owindowed(AllData4_marked,128,56);
AllData4_owin_segmented = markedsegmentation(AllData4_owin_marked);
len = length(AllData4_owin_segmented(1,:))
AllData4_owin_segmented_unmarked = AllData4_owin_segmented(:,1:len-1)


yfit = classifier_3_knn.predictFcn(AllData4_owin_segmented_unmarked)

True = AllData4_owin_segmented(:,end);


plot(yfit);
hold on
plot(True);
legend('Predicted','Actual');

correct= zeros(length(True),1);
ind = find(True==yfit);
correct(ind)= 1;
figure
plot(correct,'-o')

