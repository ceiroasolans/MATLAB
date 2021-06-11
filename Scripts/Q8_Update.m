
%% This function UPDATES the experimental stimuli using PsychToolBox(PTB). 
%Input: 
%   -windowPointer (reference to the screen and halftonePattern)
%   -centeredRect (used to center the oval)
%   -updatedGreyLevel (updated oval shade [i.e. 0:1])

function Q8_Update(windowPointer, centeredRect, updatedGreyLevel)

% Do some error checking on the input parameters
if updatedGreyLevel < 0.0 || updatedGreyLevel > 1.0
    error('Input argument updatedGreyLevel is out of range - 0 to 1')
end

%Unpack windowPointer (inputted from Q8_SetUp
screen = windowPointer{1};
pointer = windowPointer{2};

%Load windowPointer
Screen('PutImage', screen, pointer); 

%Draw Circle
ovColor = repmat(updatedGreyLevel,1,3)*256; 
Screen(screen, 'FillOval', ovColor, centeredRect);

%Flip Screen
Screen(screen,'Flip');

%Wait for keystroke and close  ---Mute from here until end if running all--
% WaitSecs(0.25); %so it doesn't get confused with the previous key stroke
% KbWait(); %mute when running the whole experiment
% Screen('CloseAll'); %mute when running the whole experiment
end




% [windowPointer, centeredRect] = Q8_SetUp(1, 0.2);
% Q8_Update(windowPointer, centeredRect, 0.5)


