%% SCRIPTWRFPRECIP A script to find the precipitation from wrfout file
% SCRIPTWRFPRECIP interactivly take the wrfout file as input and output the
% precipitation as csv file.
%
% Author: Md. Jamal Uddin Khan
% Created: 04/05/2016

%% Loading data
[inFileName, inFileLoc] =  ReadFile('Select the nc file', '*.nc');
[lon, lat, meshLon, meshLat] = GetLatLonGrid(inFileLoc);

% Display bounds
fprintf('Model domain is bounded by %f to %f longitude.\n', min(lon), max(lon));
fprintf('\t\t\tAnd %f to %f in latitude.\n', min(lat), max(lat));

% Get time
[times, nTimeStep, minuteElapsed] = GetTimes(inFileLoc);

% Saveing outputfile
outFileName = [inFileName, '.csv'];
%% Creating output grids

%% Interpolation to output grids

%% Writing data to file
