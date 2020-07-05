%% windomized data marking
% Creates M x(wsize*9+1) vector with windomized data and marked occurence
% (even if one value contains maneuver the window contains maneuever)

%sample
% AllData_win_marked = mark_windowed(AllData_marked,128)

function AllData_win_marked = mark_windowed(AllData_marked,wsize)

AccX_win = windomize(AllData_marked(:,2),wsize)
AccY_win = windomize(AllData_marked(:,3),wsize)
AccZ_win = windomize(AllData_marked(:,4),wsize)
GyroX_win = windomize(AllData_marked(:,5),wsize)
GyroY_win = windomize(AllData_marked(:,6),wsize)
GyroZ_win = windomize(AllData_marked(:,7),wsize)
MagX_win = windomize(AllData_marked(:,8),wsize)
MagY_win = windomize(AllData_marked(:,9),wsize)
MagZ_win = windomize(AllData_marked(:,10),wsize)
GT_win = windomize(AllData_marked(:,11),wsize)
GT_f = zeros(length(GT_win(:,1)),1)
for i=1:length(GT_win(:,1))
    GT_f(i) = max(GT_win(i,:))
end
AllData_win_marked = [AccX_win AccY_win AccZ_win GyroX_win GyroY_win GyroZ_win MagX_win MagY_win MagZ_win GT_f]


end