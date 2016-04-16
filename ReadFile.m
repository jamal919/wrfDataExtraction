function [ inFileName, inFileLoc ] = ReadFile( dispPrompt, fileExt )
%ReadFile Returns inFileName and inFileLoc considerting the appropriate promt. 
%   Detailed Explanation TODO.
% Author: Jamal Uddin Khan
% Date: 16/04/2016

if nargin == 0
    dispPrompt = 'Select/Enter File Name';
    fileExt = '';
elseif nargin == 1
    fileExt = '';
elseif nargin == 2
    % Ok do nothing.
else
    error('Argument mismatch');
end

% For desktop graphic, otherwise text input.
if usejava('desktop')
    [fileName, fileLoc] = uigetfile(fileExt, dispPrompt);
    inFileName = fileName;
    inFileLoc = fullfile(fileLoc, fileName);
else
    fprintf('Enter file location in string format, use quote sign : ')
    tempValue = input('');
    if ischar(tempValue)
        strSp = strsplit(tempValue, filesep);
        inFileName = strSp{end};
        inFileLoc = tempValue;
    else
        error('File location input must be string. Use quote.');
    end
end

% function ends
        
end

