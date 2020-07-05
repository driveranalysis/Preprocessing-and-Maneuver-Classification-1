%% Overlapping windomized data marking
% Creates M x(wsize*9+1) vector with windomized data and marked occurence
% (even if one value contains maneuver the window contains maneuever)

%sample
% AccX_owin = owindomize(AllData_marked(:,2),128,56)
% AllData_owin_marked = mark_owindowed(AllData_marked,128,56)


function AllData_owin_marked = mark_owindowed(AllData_marked,wsize,osize)

AccX_owin = owindomize(AllData_marked(:,2),wsize,osize)
AccY_owin = owindomize(AllData_marked(:,3),wsize,osize)
AccZ_owin = owindomize(AllData_marked(:,4),wsize,osize)
GyroX_owin = owindomize(AllData_marked(:,5),wsize,osize)
GyroY_owin = owindomize(AllData_marked(:,6),wsize,osize)
GyroZ_owin = owindomize(AllData_marked(:,7),wsize,osize)
MagX_owin = owindomize(AllData_marked(:,8),wsize,osize)
MagY_owin = owindomize(AllData_marked(:,9),wsize,osize)
MagZ_owin = owindomize(AllData_marked(:,10),wsize,osize)
GT_owin = owindomize(AllData_marked(:,11),wsize,osize)
GT_f = zeros(length(GT_owin(:,1)),1)
for i=1:length(GT_owin(:,1))
    GT_f(i) = max(GT_owin(i,:))
end
AllData_owin_marked = [AccX_owin AccY_owin AccZ_owin GyroX_owin GyroY_owin GyroZ_owin MagX_owin MagY_owin MagZ_owin GT_f]


end