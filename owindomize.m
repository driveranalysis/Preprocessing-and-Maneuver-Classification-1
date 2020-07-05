%% overlapping windowing
% Data is a N x 1 vector with the data to window.
function WData = owindomize(Data,wsize,osize)
newsize = ceil((length(Data)/osize));

WData = zeros(newsize,wsize);
for i= 1:newsize
    if ((1+(i-1)*osize)+wsize) <= length(Data)
        WData(i,:) = (Data(1+(i-1)*osize:(1+(i-1)*osize)+wsize-1))';
    else
        WData(i,:) = [(Data(1+(i-1)*osize:end))' zeros(1,wsize-length(Data(1+(i-1)*osize:end)))];
    end

end

end