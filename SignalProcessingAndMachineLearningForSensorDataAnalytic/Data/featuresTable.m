
function featTable = featuresTable(feat, featlabels, actid)
% FEATURESTABLE converts the numeric features dataset into a single table
% that includes all the info
%
% Copyright 2015 The MathWorks, Inc.

% Features/predictors and metadata
load('BufferFeatures')

featT = array2table(feat,'VariableNames',featlabels);
actidT = table(categorical(actid),'VariableNames',{'ActivityID'});
featTable = [featT, actidT];
