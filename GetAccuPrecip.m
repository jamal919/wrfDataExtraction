function [ precip, ncPrecip, cPrecip ] = GetAccuPrecip( wrfOutFile, timeStep )
%GetPrecip Return the amount of total accumulated precipitaiton, non-convective rain
%and convective rain from wrfOutFile.
%   [ precip, ncPrecip, cPrecip ] = GetPrecip( wrfOutFile ) read wrfOutFile
%   and reads the precipitations for the number of timeStep specified.
% Author: Jamal Uddin Khan
% Created: 16/04/2016

% TODO
% Check the file
% TODO

% Constant
HAIL = 'HAILNC'; % Accumulated total grid scale hail, mm
GRAUPELNC = 'GRAUPELNC'; % Accumulated total grauphel, mm
SNOW = 'SNOWNC'; % Accumulated total grid scale snow, mm
RAINNC = 'RAINNC'; % Accumulated non-convective rain, mm
RAINC = 'RAINC'; % Accumulated convective rain, mm
RAINSH = 'RAINSH'; % Accumulated shallow cumulus precipitation, mm

% Reading values
hailFull = ncread(wrfOutFile, HAIL);
graupelncFull = ncread(wrfOutFile, GRAUPELNC);
snowFull = ncread(wrfOutFile, SNOW);
rainncFull = ncread(wrfOutFile, RAINNC);
raincFull = ncread(wrfOutFile, RAINC);
rainshFull = ncread(wrfOutFile, RAINSH);

% Reading time step
if nargin == 2
    hail = hailFull(:, :, timeStep);
    graupelnc = graupelncFull(:, :, timeStep);
    snow = snowFull(:, :, timeStep);
    rainnc = rainncFull(:, :, timeStep);
    rainc = raincFull(:, :, timeStep);
    rainsh = rainshFull(:, :, timeStep);

    % Returning the output values
    % Total precipitation is taken as the sum of all kind of percipitation
    precip = hail + graupelnc + snow + rainnc + rainc + rainsh;

    % NC and C rain.
    ncPrecip = rainnc;
    cPrecip = rainc;
elseif nargin == 1
    hail = hailFull(:, :, :);
    graupelnc = graupelncFull(:, :, :);
    snow = snowFull(:, :, :);
    rainnc = rainncFull(:, :, :);
    rainc = raincFull(:, :, :);
    rainsh = rainshFull(:, :, :);

    % Returning the output values
    % Total precipitation is taken as the sum of all kind of percipitation
    precip = hail + graupelnc + snow + rainnc + rainc + rainsh;

    % NC and C rain.
    ncPrecip = rainnc;
    cPrecip = rainc; 
else
    error('ERROR: Argument mismatch.')
end
end