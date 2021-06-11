
%% This function runs a complete "method of adjustment" trial. 
%Output: 
%   -updatedGreyLevel (collection of matches)
%   -numWhite (halftonePattern number for every trial)
%   -Table (data above organized as in the example)


function [updatedGreyLevel, numWhite, Table] = Q11_Random

%% Experiment
%Create cell arrays to store randomized numWhite values & user input
updatedGreyLevel = {};
numWhite = {}; 

%Randomize 3x8 trials
for i = 1:3 %one through three sets of trials ('repeats')
    numWhite{i} = randperm(8); %each 'repeat' has it's own randomized order of numWhite
    for j = 1:8
    [updatedGreyLevel{i}(j)] = Q10_RunTrial (numWhite{i}(j)); %categorize everything in its place
    end
end

ShowCursor();
Screen('CloseAll'); %close screen after all trials

%% DATA
%Organize data
user = cell2mat(updatedGreyLevel)';
white = cell2mat(numWhite)';
tab = [white, user];

%Cut by 'repeat' and sort (+round to 2 d.p.)
T1 = round(sortrows(tab(1:8,:), 1),2); %sort rows of table "tab" (ascending order)...
T2 = round(sortrows(tab(9:16, :),1),2); %...rows 1:8 and all columns...
T3 = round(sortrows(tab(17:24, :),1),2); %...based on elements of the first column. 

%Merge all together in a table
Table = array2table([T1, T2(:,2), T3(:,2)]); 
Table.Properties.VariableNames = {'Pattern','Repeat1','Repeat2', 'Repeat3'};
