%% Plotting maneuver raw signal and histogram


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


% sel =(find(GT(start:endd) == mval))
sel = start:1:endd;
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