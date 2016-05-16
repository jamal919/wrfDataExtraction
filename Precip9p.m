function [ precip, ncPrecip, cPrecip ] = Precip9p( tstep, rainnc, rainc, wrflat, wrflon, latitude, longitude )
%PRECIP9P returns the 9-point average of the precipitation for given
%latitude and longitude
%   [precip, ncPrecip, cPrecip] = Precip9p( timestep, rainnc, rainc, wrflat, wrflon,
%   latitude, longitude) return the 9 point average recipitations. 
%
% Author: Jamal Uddin Khan
% 11/05/2016

%% Input checks

%% Loading values
tsRainNC = rainnc(:, :, tstep);
tsRainC = rainc(:, :, tstep);

%% Finding the nearest station index
% c for closest
[~, cLonInd] = FindClosest(wrflon, longitude);
[~, cLatInd] = FindClosest(wrflat, latitude);

% Now creating an array of nine point
pointncVals = zeros(1, 9);
pointcVals = zeros(1, 9);
pointNos = 1;
for row = cLonInd - 1 : cLonInd + 1
    for col = cLatInd - 1 : cLatInd + 1
        pointncVals(pointNos) = tsRainNC(row, col);
        pointcVals(pointNos) = tsRainC(row, col);
        pointNos = pointNos + 1;
    end
end

%% Outputs
pointPrVals = pointncVals + pointcVals;
precip = mean(pointPrVals);

ncPrecip = mean(pointncVals);
cPrecip = mean(pointcVals);
end

