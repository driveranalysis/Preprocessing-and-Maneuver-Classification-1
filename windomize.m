%% Windomizing data (no overlap)
% Data is the N x 1 vector to be windomized
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