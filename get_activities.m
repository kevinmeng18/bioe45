%% Get glycoside hydrolase information 
% This function allows the user to enter the the number of the glycoside 
% hydrolase (GH) family s/he is interested in and then outputs the known
% activities, the mechanism, and any notes of that GH family. 

% Example: get_activites(133)
% The input should be self-explanatory. Just input a number between 1 and
% 133. 

function [spacer, known_activities, mechanism, note] = get_activities(int);

load('GH_family.mat');


% checks if the input is a number between 1 and 133. 
check = ischar(int);

if check == 0 & int >= 1 & int <= 133
    % finds the known activities, mechanism, and note of that GH family
    known_activities = Activities{int};
    mechanism = Mechanism{int};
    note = Note{int};
    
    % prints out the GH information to the command window
    fprintf('%s \n %s \n %s \n', known_activities, mechanism, note);
    
else
    % prints out a message if the input was not a number between 1 and 133.
    fprintf('%s \n','You did not enter a number from  1 to 133.');
end

end
