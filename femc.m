close all;
clear;
clc;
%% Import data from text file
% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 5);
% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
% Specify column names and types
opts.VariableNames = ["timestamp", "uptimeNanos", "x", "y", "z"];
opts.VariableTypes = ["datetime", "double", "double", "double", "double"];
opts = setvaropts(opts, 1, "InputFormat", "dd/MM/yyyy HH:mm:ss");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
Magnetometer = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\16\campoMagnetico_terra.csv", opts);
Gyroscope = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\16\giroscopio_terra.csv", opts);
Acceleration = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\16\acelerometro_terra.csv", opts);

Magnetometer2 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\17\campoMagnetico_terra.csv", opts);
Gyroscope2 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\17\giroscopio_terra.csv", opts);
Acceleration2 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\17\acelerometro_terra.csv", opts);

Magnetometer3 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\20\campoMagnetico_terra.csv", opts);
Gyroscope3 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\20\giroscopio_terra.csv", opts);
Acceleration3 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\20\acelerometro_terra.csv", opts);

Magnetometer4 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\21\campoMagnetico_terra.csv", opts);
Gyroscope4 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\21\giroscopio_terra.csv", opts);
Acceleration4 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\21\acelerometro_terra.csv", opts);



% Clear temporary variables
clear opts
%% Importing Ground Truth
opts = delimitedTextImportOptions("NumVariables", 4);
% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
% Specify column names and types
opts.VariableNames = ["VarName1", "Event", "Start", "End"];
opts.SelectedVariableNames = ["Event", "Start", "End"];
opts.VariableTypes = ["string", "categorical", "double", "double"];
opts = setvaropts(opts, 1, "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 2], "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
GroundTruth = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\16\Truth_eng.csv", opts);
GroundTruth2 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\17\Truth_eng.csv", opts);
GroundTruth3 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\20\Truth_eng.csv", opts);
GroundTruth4 = readtable("C:\Users\danya\Documents\GitHub\Manuever-Classification\Datasets\Jain Jr Dataset\21\Truth_eng.csv", opts);
% Clear temporary variables
clear opts

%% Acquiring data in matrices
% DESCRIPTIVE TEXT

AccX = Acceleration(:,3);
AccY = Acceleration(:,4);
AccZ = Acceleration(:,5);
AccT = Acceleration(:,2);

AccX = table2array(AccX);
AccY = table2array(AccY);
AccZ = table2array(AccZ);
AccT = table2array(AccT);

AccT= AccT*(10^-9);
AccT = AccT - AccT(1);

GyroX = Gyroscope(:,3);
GyroY = Gyroscope(:,4);
GyroZ = Gyroscope(:,5);
GyroT = Gyroscope(:,2);

GyroX = table2array(GyroX);
GyroY = table2array(GyroY);
GyroZ = table2array(GyroZ);
GyroT = table2array(GyroT);

GyroT = GyroT*(10^-9);
GyroT = GyroT - GyroT(1);

MagX = Magnetometer(:,3);
MagY = Magnetometer(:,4);
MagZ = Magnetometer(:,5);
MagT = Magnetometer(:,2);

MagX = table2array(MagX);
MagY = table2array(MagY);
MagZ = table2array(MagZ);
MagT = table2array(MagT);

MagT = MagT*(10^-9);
MagT = MagT - MagT(1);

%new test data

% AllData_times2 = importdatafromtable(Acceleration2, Gyroscope2, Magnetometer2);

% AccT2 = AllData_times2(1);
% AccX2 = AllData_times2(2);
% AccY2 = AllData_times2(3);
% AccZ2 = AllData_times2(4);
% 
% GyroT2 = AllData_times2(5);
% GyroX2 = AllData_times2(6);
% GyroY2 = AllData_times2(7);
% GyroZ2 = AllData_times2(8);
% 
% MagT2 = AllData_times2(9);
% MagX2 = AllData_times2(10);
% MagY2 = AllData_times2(11);
% MagZ2 = AllData_times2(12);


AccX2 = Acceleration2(:,3);
AccY2 = Acceleration2(:,4);
AccZ2 = Acceleration2(:,5);
AccT2 = Acceleration2(:,2);

AccX2 = table2array(AccX2);
AccY2 = table2array(AccY2);
AccZ2 = table2array(AccZ2);
AccT2 = table2array(AccT2);

AccT2= AccT2*(10^-9);
AccT2 = AccT2 - AccT2(1);

GyroX2 = Gyroscope2(:,3);
GyroY2 = Gyroscope2(:,4);
GyroZ2 = Gyroscope2(:,5);
GyroT2 = Gyroscope2(:,2);

GyroX2 = table2array(GyroX2);
GyroY2 = table2array(GyroY2);
GyroZ2 = table2array(GyroZ2);
GyroT2 = table2array(GyroT2);

GyroT2 = GyroT2*(10^-9);
GyroT2 = GyroT2 - GyroT2(1);

MagX2 = Magnetometer2(:,3);
MagY2 = Magnetometer2(:,4);
MagZ2 = Magnetometer2(:,5);
MagT2 = Magnetometer2(:,2);

MagX2 = table2array(MagX2);
MagY2 = table2array(MagY2);
MagZ2 = table2array(MagZ2);
MagT2 = table2array(MagT2);

MagT2 = MagT2*(10^-9);
MagT2 = MagT2 - MagT2(1);

AccX2 = Acceleration2(:,3);
AccY2 = Acceleration2(:,4);
AccZ2 = Acceleration2(:,5);
AccT2 = Acceleration2(:,2);

AccX2 = table2array(AccX2);
AccY2 = table2array(AccY2);
AccZ2 = table2array(AccZ2);
AccT2 = table2array(AccT2);

AccT2= AccT2*(10^-9);
AccT2 = AccT2 - AccT2(1);

GyroX2 = Gyroscope2(:,3);
GyroY2 = Gyroscope2(:,4);
GyroZ2 = Gyroscope2(:,5);
GyroT2 = Gyroscope2(:,2);

GyroX2 = table2array(GyroX2);
GyroY2 = table2array(GyroY2);
GyroZ2 = table2array(GyroZ2);
GyroT2 = table2array(GyroT2);

GyroT2 = GyroT2*(10^-9);
GyroT2 = GyroT2 - GyroT2(1);

MagX2 = Magnetometer2(:,3);
MagY2 = Magnetometer2(:,4);
MagZ2 = Magnetometer2(:,5);
MagT2 = Magnetometer2(:,2);

MagX2 = table2array(MagX2);
MagY2 = table2array(MagY2);
MagZ2 = table2array(MagZ2);
MagT2 = table2array(MagT2);

MagT2 = MagT2*(10^-9);
MagT2 = MagT2 - MagT2(1);

%% Plotting Data
% DESCRIPTIVE TEXT

subplot 131
plot(GyroT,GyroX);
title('Gyroscope X')
subplot 132
plot(GyroT,GyroY);
title('Gyroscope Y');
subplot 133
plot(GyroT,GyroZ);
title('Gyroscope Z');

figure
subplot 131
plot(AccT,AccX);
title('Accelerometer X');
subplot 132
plot(AccT,AccY);
title('Accelerometer Y');
subplot 133
plot(AccT,AccZ);
title('Accelerometer Z');

figure
subplot 131
plot(MagT,MagX);
title('Magnetometer X');
subplot 132
plot(MagT,MagY);
title('Magnetoometer Y');
subplot 133
plot(MagT,MagZ);
title('Magnetometer Z');


% plotdataraw(AllData_times2):


%% Resampling nonuniformly sampled data
% DESCRIPTIVE TEXT

fs=256;

[AccX_rs,AccT_rs] = resample(AccX,AccT,fs,3,1);
[AccY_rs,AccT_rs] = resample(AccY,AccT,fs,3,1);
[AccZ_rs,AccT_rs] = resample(AccZ,AccT,fs,3,1);

[GyroX_rs,GyroT_rs] = resample(GyroX,GyroT,fs,3,1);
[GyroY_rs,GyroT_rs] = resample(GyroY,GyroT,fs,3,1);
[GyroZ_rs,GyroT_rs] = resample(GyroZ,GyroT,fs,3,1);


[MagX_rs,MagT_rs] = resample(MagX,MagT,fs,3,1);
[MagY_rs,MagT_rs] = resample(MagY,MagT,fs,3,1);
[MagZ_rs,MagT_rs] = resample(MagZ,MagT,fs,3,1);

T=AccT_rs; %Common Timesamples now


AllData = [T AccX_rs(1:length(T)) AccY_rs(1:length(T)) AccZ_rs(1:length(T)) GyroX_rs(1:length(T)) GyroY_rs(1:length(T)) GyroZ_rs(1:length(T)) MagX_rs(1:length(T)) MagY_rs(1:length(T)) MagZ_rs(1:length(T))];
exp = array2table(AllData);
filename = 'patientdata.xlsx';
writetable(exp,filename,'Sheet',1,'Range','D1')
AllData2 = resampling(AccT2, AccX2, AccY2, AccZ2, GyroT2, GyroX2, GyroY2, GyroZ2, MagT2, MagX2, MagY2, MagZ2,50);

%% Plotting resampled data
% DESCRIPTIVE TEXT


figure
subplot 131
plot(GyroT_rs,GyroX_rs);
title('Gyroscope X Resampled')
subplot 132
plot(GyroT_rs,GyroY_rs);
title('Gyroscope Y Resampled');
subplot 133
plot(GyroT_rs,GyroZ_rs);
title('Gyroscop Z Resampled');

figure
subplot 131
plot(AccT_rs,AccX_rs);
title('Accelerometer X Resampled');
subplot 132
plot(AccT_rs,AccY_rs);
title('Accelerometer Y Resampled');
subplot 133
plot(AccT_rs,AccZ_rs);
title('Accelerometer Z Resampled');

figure
subplot 131
plot(MagT_rs,MagX_rs);
title('Magnetometer X Resampled');
subplot 132
plot(MagT_rs,MagY_rs);
title('Magnetoometer Y Resampled');
subplot 133
plot(MagT_rs,MagZ_rs);
title('Magnetometer Z Resampled');


%% Creating event vector
% DESCRIPTIVE TEXT


Maneuvers_cat = ["Non-aggressive event" "Aggressive left lane change" "Aggressive acceleration" "Aggressive breaking" "Aggressive left turn" "Aggressive right turn" "Aggressive right lane change"];
Maneuvers_cat = categorical(Maneuvers_cat);

GT = zeros(length(AccT_rs),1);

GT_list = table2array(GroundTruth(:,1));
Maneuvers = categorical(GT_list);

for i= 1:length(GT_list)
    start= table2array(GroundTruth(i,2))*50;
    endd = table2array(GroundTruth(i,3))*50;
    
    ind=find(Maneuvers_cat == Maneuvers(i));
    index{i} = ind;
    
    for j= round(start):round(endd)

        GT(j)= ind;
    end
end

figure;
plot(GT);

%%change name to All Data marked
AllData_marked = [AllData GT];


fs=50;
T2 = AllData2(:,1);
GT2 = maneuver_vector(T2,fs,GroundTruth2)
figure;
plot(GT2);

AllData2_marked = [AllData2 GT2]
%% Storing Maneuvers with Corresponding Data

%plotting instances of manuevers and histograms

% finding all start and end of a maneuver
man = 1;
maneuver_ss = [];
ind = find(Maneuvers == Maneuvers_cat(man))
maneuver_ss = zeros(length(ind),2);
for i= 1:length(ind)
    maneuver_ss(i,1)= ceil(table2array(GroundTruth(ind(i),2))*50);
    maneuver_ss(i,2)= ceil(table2array(GroundTruth(ind(i),3))*50) ;
end


plotManeuverDataHist(AllData_marked, maneuver_ss(1,1),maneuver_ss(1,2), man, Maneuvers_cat);
plotManeuverDataHist(AllData_marked, maneuver_ss(2,1),maneuver_ss(2,2), man, Maneuvers_cat);
plotManeuverDataHist(AllData_marked, maneuver_ss(3,1),maneuver_ss(3,2), man, Maneuvers_cat);

distFig('Rows',2,'Columns',3)

Maneuver_Data = cell(length(Maneuvers_cat),9);

for i = 1:length(Maneuvers)
    start = table2array(GroundTruth(i,2))*50
    endd = table2array(GroundTruth(i,3))*50
end


%% Windowing Data
% DESCRIPTIVE TEXT

wsize = 128;
Data = AccX_rs;

%Non Overlapping Windowing
AccX_wd = windomize(AccX_rs,wsize);
AccY_wd = windomize(AccY_rs,wsize);
AccZ_wd = windomize(AccZ_rs,wsize);


GyroX_wd = windomize(GyroX_rs,wsize);
GyroY_wd = windomize(GyroY_rs,wsize);
GyroZ_wd = windomize(GyroZ_rs,wsize);

MagX_wd = windomize(MagX_rs,wsize);
MagY_wd = windomize(MagY_rs,wsize);
MagZ_wd = windomize(MagZ_rs,wsize);

GT_wd = windomize(GT, wsize);

%Overlapping Windowing
osize=0.5;
AccX_wdo = owindomize(AccX_rs,wsize,osize);
AccY_wdo = owindomize(AccY_rs,wsize,osize);
AccZ_wdo = owindomize(AccZ_rs,wsize,osize);

GyroX_wdo = owindomize(GyroX_rs,wsize,osize);
GyroY_wdo = owindomize(GyroY_rs,wsize,osize);
GyroZ_wdo = owindomize(GyroZ_rs,wsize,osize);

MagX_wdo = owindomize(MagX_rs,wsize,osize);
MagY_wdo = owindomize(MagY_rs,wsize,osize);
MagZ_wdo = owindomize(MagZ_rs,wsize,osize);

GT_wdo = owindomize(GT, wsize,osize);


%% Playing with features

% Power spectral density
figure
pwelch(AccX_rs(1:400));
figure
pwelch(AccX_rs(1:400),128,64);

nfeatures = 66;
nwindows = 10; %sample 
features_1 = zeros(nwindows,nfeatures);

%make a cell with windowed features for all 9 sensor readings. (do with acc
%only first)

Acc_wdo{:,1} = AccX_wdo;
Acc_wdo{:,2} = AccY_wdo;
Acc_wdo{:,3} = AccZ_wdo;

% function features = feature_extraction(DataCell)
DataCell = Acc_wdo
ncels = length(DataCell);
nwindows = length(DataMat(:,1));
    for w= 1:nwindows
            feat_1 =  mean(DataMat(w));
%             features_1(w,f) = 
    end
%     end

%% Plotting Readings color coded for maneuvers
% DESCRIPTIVE TEXT

stream = [AccX_rs AccY_rs AccZ_rs];

T = AccT_rs;


n_maneuvers = max(length(Maneuver_cat),1); %Number of Maneuvers

%number of plots
% nplots = size(stream,2);
% nplots = length(stream(1,:));

%color
colorcode = colormap(lines(n_maneuvers));
% colorcodes = [cat2array(p_maneuvers) colorcode]

% colorCode = ['r', 'g', 'b', 'c', 'y']

% close all;
% for p = 1:nplots
%     subplot(nplots,1,p);
%     
%     ind = find(GT == 0);
%     plotV = stream(ind,p);
%     plotT = T(ind);
%     plot(plotT, plotV)
%     for m = 1:n_maneuvers
%         maneuver_id = p_maneuvers(m);
%         ind = find(GT == m);
%         plotV = stream(ind,p);
%         plotT = T(ind);
%         plot(plotT, plotV, 'Color',colorcode(maneuver_id,:),'LineWidth',1.5);
%         % and keep axis on hold to overlay next plot 
%         hold on
%     end
%     plot(T,GT);
%     hold off
%     grid on
%     xlabel('time (s)')
%     ylabel('a_z (m s^{-2})')
% %     legend(colorcode)
% end

       
% m_data
% 
% A = [1 2 3 0 0 0 0 0 2 3 4 0 0 0 0 0 4 5 6 7 0 0 0 0 1 1 1];
% ne0 = find(A~=0);                                   % Nonzero Elements
% ix0 = unique([ne0(1) ne0(diff([0 ne0])>1)]);        % Segment Start Indices
% ix1 = ne0([find(diff([0 ne0])>1)-1 length(ne0)]);   % Segment End Indices
% for k1 = 1:length(ix0)
%     section{k1} = A(ix0(k1):ix1(k1));
% end
% celldisp(section) 

figure
m_seg = find(GT == 0);
plot(AccT_rs(m_seg),AccX_rs(m_seg));
hold on
for i= 1:5
    m_seg = find(GT == i);
    a = AccX_rs(m_seg)
    b = highpass(a,5,50)
    
    plot(AccT_rs(m_seg),b);
    hold on
end

m_seg = find(GT == 0);
plot(AccT_rs(m_seg),AccX_rs(m_seg));

%% Test Classifier


yfit = trainedModel1.predictFcn(AllData2)


%% Functions


%function to import data from table

function AllData_times = importdatafromtable(Acceleration,Gyroscope,Magnetometer)

AccX = Acceleration(:,3);
AccY = Acceleration(:,4);
AccZ = Acceleration(:,5);
AccT = Acceleration(:,2);

AccX = table2array(AccX);
AccY = table2array(AccY);
AccZ = table2array(AccZ);
AccT = table2array(AccT);

AccT= AccT*(10^-9);
AccT = AccT - AccT(1);

GyroX = Gyroscope(:,3);
GyroY = Gyroscope(:,4);
GyroZ = Gyroscope(:,5);
GyroT = Gyroscope(:,2);

GyroX = table2array(GyroX);
GyroY = table2array(GyroY);
GyroZ = table2array(GyroZ);
GyroT = table2array(GyroT);

GyroT = GyroT*(10^-9);
GyroT = GyroT - GyroT(1);

MagX = Magnetometer(:,3);
MagY = Magnetometer(:,4);
MagZ = Magnetometer(:,5);
MagT = Magnetometer(:,2);

MagX = table2array(MagX);
MagY = table2array(MagY);
MagZ = table2array(MagZ);
MagT = table2array(MagT);

MagT = MagT*(10^-9);
MagT = MagT - MagT(1);


AllData_times = {AccT AccX AccY AccZ GyroT GyroX GyroY GyroZ MagT MagX MagY MagZ}
end


% Resampling nonuniformly sampled data


function AllData = resampling(AccT, AccX, AccY, AccZ, GyroT, GyroX, GyroY, GyroZ, MagT, MagX, MagY, MagZ, fs)

% AccT = AllData_time(:,1)
% AccX = AllData_time(:,2)
% AccY = AllData_time(:,3)
% AccZ = AllData_time(:,4)
% 
% GyroT = AllData_time(:,5)
% GyroX = AllData_time(:,6)
% GyroY = AllData_time(:,7)
% GyroZ = AllData_time(:,8)
% 
% MagT = AllData_time(:,9)
% MagX = AllData_time(:,10)
% MagY = AllData_time(:,11)
% MagZ = AllData_time(:,12)


[AccX_rs,AccT_rs] = resample(AccX,AccT,fs,3,1)
[AccY_rs,AccT_rs] = resample(AccY,AccT,fs,3,1)
[AccZ_rs,AccT_rs] = resample(AccZ,AccT,fs,3,1)

[GyroX_rs,GyroT_rs] = resample(GyroX,GyroT,fs,3,1)
[GyroY_rs,GyroT_rs] = resample(GyroY,GyroT,fs,3,1)
[GyroZ_rs,GyroT_rs] = resample(GyroZ,GyroT,fs,3,1)

[MagX_rs,MagT_rs] = resample(MagX,MagT,fs,3,1)
[MagY_rs,MagT_rs] = resample(MagY,MagT,fs,3,1)
[MagZ_rs,MagT_rs] = resample(MagZ,MagT,fs,3,1)

%trunkating based on smallest array

if length(AccT_rs)<=length(GyroT_rs)
    T=AccT_rs;
    if length(MagT_rs)<length(AccT_rs)
        T=MagT_rs;
    end
else
    T=GyroT_rs
    if length(MagT_rs)<length(GyroT_rs)
        T=MagT_rs;
    end
end

n = length(T)
        
AllData = [T,AccX_rs(1:n),AccY_rs(1:n),AccZ_rs(1:n),GyroX_rs(1:n),GyroY_rs(1:n),GyroZ_rs(1:n),MagX_rs(1:n),MagY_rs(1:n),MagZ_rs(1:n)]
end

%Plotting Data

function [] = plotdataraw(AllData_times)

AccT = AllData_times(1);
AccX = AllData_times(2);
AccY = AllData_times(3);
AccZ = AllData_times(4);

GyroT = AllData_times(5);
GyroX = AllData_times(6);
GyroY = AllData_times(7);
GyroZ = AllData_times(8);

MagT = AllData_times(9);
MagX = AllData_times(10);
MagY = AllData_times(11);
MagZ = AllData_times(12);

subplot 131
plot(GyroT,GyroX);
title('Gyroscope X')
subplot 132
plot(GyroT,GyroY);
title('Gyroscope Y');
subplot 133
plot(GyroT,GyroZ);
title('Gyroscope Z');

figure
subplot 131
plot(AccT,AccX);
title('Accelerometer X');
subplot 132
plot(AccT,AccY);
title('Accelerometer Y');
subplot 133
plot(AccT,AccZ);
title('Accelerometer Z');

figure
subplot 131
plot(MagT,MagX);
title('Magnetometer X');
subplot 132
plot(MagT,MagY);
title('Magnetoometer Y');
subplot 133
plot(MagT,MagZ);
title('Magnetometer Z');

end

%plotting resampled data

function [] = plotdataresampled(AllData)

T = AllData(1);

AccX_rs = AllData(2);
AccY_rs = AllData(3);
AccZ_rs = AllData(4);

GyroX_rs = AllData(5);
GyroY_rs = AllData(6);
GyroZ_rs = AllData(7);

MagX_rs = AllData(8);
MagY_rs = AllData(9);
MagZ_rs = AllData(10);

figure
subplot 131
plot(T,GyroX_rs);
title('Gyroscope X Resampled')
subplot 132
plot(T,GyroY_rs);
title('Gyroscope Y Resampled');
subplot 133
plot(T,GyroZ_rs);
title('Gyroscop Z Resampled');

figure
subplot 131
plot(T,AccX_rs);
title('Accelerometer X Resampled');
subplot 132
plot(T,AccY_rs);
title('Accelerometer Y Resampled');
subplot 133
plot(T,AccZ_rs);
title('Accelerometer Z Resampled');

figure
subplot 131
plot(T,MagX_rs);
title('Magnetometer X Resampled');
subplot 132
plot(T,MagY_rs);
title('Magnetoometer Y Resampled');
subplot 133
plot(T,MagZ_rs);
title('Magnetometer Z Resampled');
end

%Creting Ground Truth vector

function GT = maneuver_vector(T,fs,GroundTruth)

GT = zeros(length(T),1);
m_array = GroundTruth(:,1);
m_array = table2array(m_array);
Maneuver_list = unique(m_array);
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


%Non Overlapping Windowing Function
function WData = windomize(Data,wsize)

newsize = ceil(length(Data)/wsize);
WData = zeros(newsize,wsize);
    for i= 1: newsize
        if i*wsize <= length(Data)
            WData(i,:) = (Data(1+(i-1)*wsize:i*wsize))';
        else
            WData(i,:) = [(Data(1+(i-1)*wsize:end))' zeros(1,wsize-length(Data(1+(i-1)*wsize:end)))];
        end
    end
end

function WData = owindomize(Data,wsize,osize)
shift = wsize*osize;
newsize = ceil((length(Data)/shift));

WData = zeros(newsize,wsize);
for i= 1:newsize
    if ((1+(i-1)*shift)+wsize) <= length(Data)
        WData(i,:) = (Data(1+(i-1)*shift:(1+(i-1)*shift)+wsize-1))';
    else
        WData(i,:) = [(Data(1+(i-1)*shift:end))' zeros(1,wsize-length(Data(1+(i-1)*shift:end)))];
    end

end

end

function [] = plotManeuverDataHist(SensorStream, start, endd, mval, mlist)
T = SensorStream(:,1);
AccX_rs = SensorStream(:,2);
AccY_rs = SensorStream(:,3);
AccZ_rs = SensorStream(:,4);
GyroX_rs = SensorStream(:,5);
GyroY_rs = SensorStream(:,6);
GyroZ_rs = SensorStream(:,7);
MagX_rs = SensorStream(:,8);
MagY_rs = SensorStream(:,9);
MagZ_rs = SensorStream(:,10);
GT = SensorStream(:,11);


sel =(find(GT(start:endd) == mval))
if sel>0
figure
subplot 321;
plot(T(sel),AccX_rs(sel));
title(['Acceleration X for', mlist(mval)]);
subplot 323;
plot(T(sel),AccY_rs(sel));
title(['Acceleration Y for', mlist(mval)]);
subplot 325;
plot(T(sel),AccZ_rs(sel));
title(['Acceleration Z for', mlist(mval)]);
subplot 322;
plot(T(sel),GyroX_rs(sel));
title(['Gyroscope X for', mlist(mval)]);
subplot 324;
plot(T(sel),GyroY_rs(sel));
title(['Gyroscope Y for', mlist(mval)]);
subplot 326;
plot(T(sel),GyroZ_rs(sel));
title(['Gyroscope Z for', mlist(mval)]);

figure
subplot 321;
histogram(AccX_rs(sel));
title(['Acceleration X for', mlist(mval)]);
subplot 323;
histogram(AccY_rs(sel));
title(['Acceleration Y for', mlist(mval)]);
subplot 325;
histogram(AccZ_rs(sel));
title(['Acceleration Z for', mlist(mval)]);
subplot 322;
histogram(GyroX_rs(sel));
title(['Gyroscope X for', mlist(mval)]);
subplot 324;
histogram(GyroY_rs(sel));
title(['Gyroscope Y for', mlist(mval)]);
subplot 326;
histogram(GyroZ_rs(sel));
title(['Gyroscope Z for', mlist(mval)]);
else
    "maneuver doesnt exist"
end
end



%feature extraction

% function feat = extractSignalFeatures(at, fs)
% % featuresFromBuffer Extract vector of features from raw data buffer
% % 
% % Copyright 2014-2015 The MathWorks, Inc.
% 
% % Initialize feature vector
% feat = zeros(1,66);
% 
% % Average value in signal buffer for all three acceleration components (1 each)
% feat(1:3) = mean(at,1);
% 
% % Initialize digital filter
% fhp = hpfilter;
% 
% % Remove gravitational contributions with digital filter
% ab = filter(fhp,at);
% 
% % RMS value in signal buffer for all three acceleration components (1 each)
% feat(4:6) = rms(ab,1);
% 
% % Spectral peak features (12 each): height and position of first 6 peaks
% feat(16:51) = spectralPeaksFeatures(ab, fs);
% 
% % Autocorrelation features for all three acceleration components (3 each): 
% % height of main peak; height and position of second peak
% feat(7:15) = autocorrFeatures(ab, fs);
% 
% % Spectral power features (5 each): total power in 5 adjacent
% % and pre-defined frequency bands
% feat(52:66) = spectralPowerFeatures(ab, fs);
% 
% 
% % --- Helper functions
% function feats = spectralPeaksFeatures(x, fs)
% 
% feats = zeros(1,3*12);
% N = 4096;
% 
% mindist_xunits = 0.3;
% minpkdist = floor(mindist_xunits/(fs/N));
% 
% % Cycle through number of channels
% nfinalpeaks = 6;
% for k = 1:3
%     [xpsd, f] = pwelch(x(:,k),rectwin(length(x)),[],N,fs);
%     [pks,locs] = findpeaks(xpsd,'npeaks',20,'minpeakdistance',minpkdist);
%     opks = zeros(nfinalpeaks,1);
%     if(~isempty(pks))
%         mx = min(6,length(pks));
%         [spks, idx] = sort(pks,'descend');
%         slocs = locs(idx);
% 
%         pkssel = spks(1:mx);
%         locssel = slocs(1:mx);
% 
%         [olocs, idx] = sort(locssel,'ascend');
%         opks = pkssel(idx);
%     end
%     ofpk = f(olocs);
% 
%     % Features 1-6 positions of highest 6 peaks
%     feats(12*(k-1)+(1:length(opks))) = ofpk;
%     % Features 7-12 power levels of highest 6 peaks
%     feats(12*(k-1)+(7:7+length(opks)-1)) = opks;
% end
% 
% function feats = autocorrFeatures(x, fs)
% 
% feats = zeros(1,3);
% 
% minprom = 0.0005;
% mindist_xunits = 0.3;
% minpkdist = floor(mindist_xunits/(1/fs));
% 
% % Separate peak analysis for 3 different channels
% for k = 1:3
%     [c, lags] = xcorr(x(:,k));
% 
%     [pks,locs] = findpeaks(c,...
%         'minpeakprominence',minprom,...
%         'minpeakdistance',minpkdist);
% 
%     tc = (1/fs)*lags;
%     tcl = tc(locs);
% 
%     % Feature 1 - peak height at 0
%     if(~isempty(tcl))   % else f1 already 0
%         feats(3*(k-1)+1) = pks((end+1)/2);
%     end
%     % Features 2 and 3 - position and height of first peak 
%     if(length(tcl) >= 3)   % else f2,f3 already 0
%         feats(3*(k-1)+2) = tcl((end+1)/2+1);
%         feats(3*(k-1)+3) = pks((end+1)/2+1);
%     end
% end
% 
% function feats = spectralPowerFeatures(x, fs)
% 
% edges = [0.5, 1.5, 5, 10, 15, 20];
% 
% [xpsd, f] = periodogram(x,[],4096,fs);
% 
% featstmp = zeros(5,3);
% 
% for kband = 1:length(edges)-1
%     featstmp(kband,:) = sum(xpsd( (f>=edges(kband)) & (f<edges(kband+1)), :),1);
% end
% feats = featstmp(:);