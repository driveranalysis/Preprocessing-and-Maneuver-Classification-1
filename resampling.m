%% Resampling Data to form one AllData vector with sampling freq fs

function AllData = resampling(Acc, Gyro, Mag, fs)
[Acc_rs(:,2:4),Acc_rs(:,1)] = resample(Acc(:,2:4),Acc(:,1),fs,3,1);
[Gyro_rs(:,2:4),Gyro_rs(:,1)] = resample(Gyro(:,2:4),Gyro(:,1),fs,3,1);
[Mag_rs(:,2:4),Mag_rs(:,1)] = resample(Mag(:,2:4),Mag(:,1),fs,3,1);

%trunkating based on smallest array
if length(Acc_rs(:,1))<=length(Gyro_rs(:,1))
    T=Acc_rs(:,1);
    if length(Mag_rs(:,1))<length(Acc_rs(:,1))
        T=Mag_rs(:,1);
    end
else
    T=Gyro_rs(:,1);
    if length(Mag_rs(:,1))<length(Gyro_rs(:,1))
        T=Mag_rs(:,1);
    end
end

n = length(T)
        
AllData = [T,Acc_rs(1:n,2:4),Gyro_rs(1:n,2:4),Mag_rs(1:n,2:4)]
end
