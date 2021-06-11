
%% This function runs a complete "method of adjustment" trial. 
%Input: 
%   -numWhite (number of halftonePattern)

function [updatedGreyLevel] = Q10_RunTrial (numWhite)

%Establish basics 
possibleValues = (1:80)/90; %perfect matches = (1:8)/9;, this multiplies times 10 the resolution so the starting point can be randomized within this resolution
startingGreyLevel = possibleValues(randperm(length(possibleValues),1));  %pick value from possibleValues at random
updatedGreyLevel = startingGreyLevel; % to be updated in the while loop
ListenChar(2); %prevent input from being printed in command window

%Present initial stimulus
[windowPointer, centeredRect] = Q8_SetUp(numWhite, startingGreyLevel);

%Dynamically update
match = 0;

while match == 0
    %Collect user input
    [keyPress]= Q9_GetKeyPress; 
    
    %Determine change based on user input
    if keyPress == 'h' & updatedGreyLevel + 1/9 <= 1 %large increase 
            updatedGreyLevel = updatedGreyLevel + 1/9;
    elseif keyPress == 'b' & updatedGreyLevel - 1/9 >= 0 %large decrease 
             updatedGreyLevel = updatedGreyLevel - 1/9;
    elseif keyPress == 'j' & updatedGreyLevel + 1/90 <= 1 %small increase
              updatedGreyLevel = updatedGreyLevel + 1/90;
    elseif keyPress == 'n' & updatedGreyLevel - 1/90 >=0 %small decrease
               updatedGreyLevel = updatedGreyLevel - 1/90; 
    elseif keyPress == 'm'
            match = 1;
    else
        beep
    end

    %Update disc
    Q8_Update(windowPointer, centeredRect, updatedGreyLevel);
end

ListenChar(1); %revert to allowing input into command window


%Screen('CloseAll'); %mute to run whole experiment 