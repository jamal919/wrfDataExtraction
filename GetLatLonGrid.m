function [ lon, lat, meshLon, meshLat ] = GetLatLonGrid( wrfOutFile )
%GetLatLonGrid Return the latitude and longitude points form the
%wrfoutFile.
%   [lat, lon, meshLat, meshLon] = GetLatLonGrid( wrfOutFile) reads the
%   latitude, longitude from the wrfOutFile and returns the vector lat, lon
%   and meshgrid of meshLat, meshLon.
% Author: Jamal Uddin Khan
% Created: 16/04/2016

% TODO
% Check the file
% TODO

% Constant
LATVARNAME = 'XLAT';
LONVARNAME = 'XLONG';
CLATVARNAME = 'CLAT';

% Loading values
% Loading lat at all time steps
tempLat = ncread(wrfOutFile, LATVARNAME);
% Check if the value is same at all time steps
if sum(~find(tempLat(:, :, 1) == tempLat(:, :, end)))
    fprint('WARNING: latitude grid is not equal at all time steps.\n');
end
% Reading step 0
meshLat = tempLat(:, :, 1);

% Loading computational grid lat at all time step
tempCLat = ncread(wrfOutFile, CLATVARNAME);
% Check step values
if sum(~find(tempCLat(:, :, 1) == tempCLat(:, :, end)))
    fprint('WARNING: latitude grid is not equal at all time steps.\n');
end
meshCLat = tempCLat(:, :, 1);
% Check normal and computational lat grid
if sum(~find(meshCLat(:, :, 1) == meshLat(:, :, end)))
    fprint('WARNING: latitude grid is not equal at normal and computational grid.\nUsing normal grid anyway.\n');
end

% Loading lon at all time steps
tempLon = ncread(wrfOutFile, LONVARNAME);
% Check if the value is same at all time steps
if sum(~find(tempLon(:, :, 1) == tempLon(:, :, end)))
    fprint('WARNING: longitude grid is not equal at all time steps.\n');
end
% Reading step 0
meshLon = tempLon(:, :, 1);

% value of lat lon
% meshLat is latitude value meshed over x, ie lon, taking first row
lat = meshLat(1, :);
% meshLon is longitude value meshed over y, ie lat, taking first column and
% transposing it.
lon = meshLon(:, 1);
lon = lon';

% TODO
% Check rotated meshing
% Normal meshing is not working
% [Y X] = meshgrid(lat, lon) works.
% TODO

% End of function
end

