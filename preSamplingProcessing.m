%% Creating inputs for resampling
% specific for our dataset. should also include any unit changes etc.

%sample
% [Acc Gyro Mag] = preSamplingProcessing(Acceleration,Gyroscope,Magnetometer)

function [Acc Gyro Mag] = preSamplingProcessing(Acceleration,Gyroscope,Magnetometer)

Acc = table2array(Acceleration(:,2:5));
Acc(:,1)= Acc(:,1)*(10^-9);
Acc(:,1) = Acc(:,1) - Acc(1,1);

Gyro = table2array(Gyroscope(:,2:5));
Gyro(:,1)= Gyro(:,1)*(10^-9);
Gyro(:,1) = Gyro(:,1) - Gyro(1,1);

Mag = table2array(Magnetometer(:,2:5));
Mag(:,1)= Mag(:,1)*(10^-9);
Mag(:,1) = Mag(:,1) - Mag(1,1);

end
