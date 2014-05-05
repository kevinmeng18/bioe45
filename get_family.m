%% Get glycoside hydrolase family 
% This function allows the user to enter the name of a glycoside hydrolyase
% (GH) as a string and then outputs the GH families that it is a part of. 
%
% Example: get_family('&beta;-galactosidase')
% When you want to input a 'beta' or 'alpha', the proper syntax is
% '&beta;-' or '&alpha;-'. 
% Also, due to the fact that the data was transferred from a csv file and
% would separate the enzymes by commas, I replaced the commas with periods.
% So instead of 1,4-enzyme or 1,3-enzyme, you will need to input 1.4-enzyme
% or 1.3-enzyme. 

function [spacer, output] = get_family(str);

load('GH_family.mat');

% checks if the input is a GH
check = isnumeric(str);

if check == 0
    % for loop that looks for the GH based on known activities
    for i = 1:133
        index2{i} = find(strfind(Activities{i}, str));
    end
    
    % finds the indices of the GH_family cell that contains the GHs
    nonemptyCells = find(~cellfun(@isempty,index2));
    output = GH_family(nonemptyCells);
    
    % Prints out the GH families that contain the GH
    fprintf('%s \n', output{:})
    
else
    % Prints out message if the input was not a GH found in the database.
    fprintf('%s \n', 'The glycoside hydrolase was not found.')

end
