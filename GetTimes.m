function [ times, nTimeStep, minElapsed ] = GetTimes( wrfOutFile )
%GetTimes Returns the time steps reading the wrfOutFile in native MATLAB format.
%   GetTimes read the wrfOutFile as input and return the Times variable as
%   output, and nTimeStep is the number of time step.
%   Variable Name: Times
% Author: Jamal Uddin Khan
% Created: 16/04/2016

% TODO
% Check the file
% TODO

% Constants
TIMEVARNAME = 'Times';
TIMESTEPVARNAME = 'XTIME';

% Loading value
tempValue = ncread(wrfOutFile, TIMEVARNAME);

% Aggreggated data, Reading row-col size
% nRow is single day size
% nCol is number of time step
[nRow, nCol] = size(tempValue);

% Initializing output as a cell of nCol
times = cell(nCol, 1);

% Reshaping and setting values
for i = 1 : nCol
    times{i} = reshape(tempValue(:, i), [1, nRow]);
end

% Changing to matrix format [year month day hour minute second]
% TODO Check matlab operator
times = cellfun(@(x)datevec(x), times, 'UniformOut', false);

% Number of time srep
nTimeStep = size(times);

% Min elapsed from times{1}
minElapsed = ncread(wrfOutFile, TIMESTEPVARNAME);
% Function completed.
end

