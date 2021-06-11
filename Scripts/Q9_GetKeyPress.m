%% This function collects user input 
%Output: 
%   -keyPress (which key, out of allowed input, was selected)


function  [keyPress] = Q9_GetKeyPress

ListenChar(2); %prevent input from being printed in command window

WaitSecs(0.25); %so that if this function is run from the command window, pressing enter is not counted as the key the while-loop expects. 
press = 0; %to be updated in the While loop once a key has been pressed, breaking the while loop
keyPress = {}; %create empty cell array to later store the key pressed
targetKeyLabel = {'h', 'b', 'j', 'n', 'm'}; %allowable keys  

while press == 0 
    [keyIsDown, secs, keyCode, deltaSecs] = KbCheck;
    for i = 1:length(targetKeyLabel);
        if strcmp(KbName(keyCode), targetKeyLabel{i}) %KbName translates 256bit code to what it represents
           disp(['The ' KbName(keyCode) ' key was pressed.']); 
           keyPress = KbName(keyCode);
           press = 1; 
        end
    end
end

ListenChar(1); %revert to allowing input into command window

 
