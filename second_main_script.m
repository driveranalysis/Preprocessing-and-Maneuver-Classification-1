%% binary even based classification.
% maneuver and no maneuver identification

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
AllData_owin_binary = binary_event(AllData_owin_marked);


%% training


%% testing

[Acc4 Gyro4 Mag4] = preSamplingProcessing(Acceleration4,Gyroscope4,Magnetometer4);
fs=50;
AllData4 = resampling(Acc4,Gyro4,Mag4,fs);
GT4 = maneuver_vector(AllData4(:,1),fs,GroundTruth4,Maneuvers_cat);
AllData4_marked = [AllData4 GT4];
AllData4_owin_marked = mark_owindowed(AllData4_marked,128,56);
AllData4_owin_binary = binary_event(AllData4_owin_marked);
len = length(AllData4_owin_binary(1,:))
AllData4_owin_binary_unmarked = AllData4_owin_binary(:,1:len-1)

True = AllData4_owin_binary(:,end);

ensemble_prediction = classifier_binary_ensemble.predictFcn(AllData4_owin_binary_unmarked)
svm_prediction = classifier_binary_svm.predictFcn(AllData4_owin_binary_unmarked)
naivebayes_prediction = classifier_binary_naivebayes.predictFcn(AllData4_owin_binary_unmarked)

correct_svm= zeros(length(True),1);
ind = find(True==svm_prediction);
correct_svm(ind)= 1;
correct_count_svm = length(ind)
wrong_count_svm = length(True) - length(ind)
accuracy_svm = (correct_count_svm/length(True))*100


correct_ensemble= zeros(length(True),1);
ind = find(True==ensemble_prediction);
correct_ensemble(ind)= 1;
correct_count_ensemble = length(ind)
wrong_count_ensemble = length(True) - length(ind)
accuracy_ensemble = (correct_count_ensemble/length(True))*100
% get false positive and false negatives etc , write a function for it


correct_naivebayes= zeros(length(True),1);
ind = find(True==naivebayes_prediction);
correct_naivebayes(ind)= 1;
correct_count_naivebayes = length(ind)
wrong_count_naivebayes = length(True) - length(ind)
accuracy_naivebayes = (correct_count_naivebayes/length(True))*100
% get false positive and false negatives etc , write a function for it

subplot 231
plot(True,'*');
hold on
plot(ensemble_prediction, 'o');
hold off
legend('True','Ensemble')

subplot 232
plot(True,'*');
hold on
plot(svm_prediction,'x');
hold off
legend('True','SVM')

subplot 233
plot(True,'*');
hold on
plot(naivebayes_prediction,'s');
hold off
legend('True','Naive Bayes')

subplot 234
plot(correct_ensemble,'o');
legend('Correct Ensemble')

subplot 235
plot(correct_svm,'x');
legend('Correct SVM')

subplot 236
plot(correct_naivebayes,'s');
legend('Correct Naive Bayes')

figure
plot(correct_svm,'*');


% get false positive and false negatives etc , write a function for it
false_maneuvers_svm = intersect(find(True==0),find(svm_prediction==1))
true_maneuvers_svm = intersect(find(True==1), find(svm_prediction==1))
false_nomaneuver_svm = intersect(find(True==1), find(svm_prediction==0))
true_nomaneuver_svm = intersect(find(True==0), find(svm_prediction==0))
