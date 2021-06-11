
%% This function PRESENTS the experimental stimuli using PsychToolBox(PTB). 
%Input: 
%   -numWhite (halftonePattern number [i.e. 1:8])
%   -startingGreyLevel (starting oval shade. [i.e. 0:1])
% Output: 
%   -windowPointer (reference to the screen and halftonePattern)
%   -centeredRect (used to center the oval in this and next function)

function [windowPointer, centeredRect] = Q8_SetUp(numWhite, startingGreyLevel)

%% Error management
if ~ismember(numWhite, 1:8)
    error('Input argument numWhite is out of range - allowable values are integers 1-8')
end
if startingGreyLevel < 0.0 || startingGreyLevel > 1.0
    error('Input argument startingGreyLevel is out of range - 0 to 1')
end

%% Set up PsychToolBox
Screen('Preference','VisualDebugLevel', 0); % skip purple screen (aesthetic purposes)
Screen('Preference', 'SkipSyncTests', 1); %0 = skips, 1 = doesn't (no skip gives synchronization errors)
Screen('OpenWindow', 0, [0 0 0]); %scales the next window opened correctly in my mac
[screen, windowRect] = Screen('OpenWindow', 0, [0 0 0]); % 0 = screen 0 (native); [0 0 0] for black
HideCursor; %not needed in this experiment

%% Create image & handler 

%Load background image and make texture (quicker than 'putimage')
halftonePattern = imread(['/Users/Conrad/Desktop/MATLAB_Final/Output/Pattern' int2str(numWhite) '.png']); 
imageTexture = Screen('MakeTexture', screen, halftonePattern);
Screen('DrawTexture', screen, imageTexture);

%Create image handler for next function
windowPointer = cell(2,1);
pointer = Screen('GetImage', imageTexture);
windowPointer{1} = screen;
windowPointer{2} = pointer;

%Get the centre coordinate of the window and put rectangle on screen center
[xCenter, yCenter] = RectCenter(windowRect); 
baseRect = [0 0 200 200]; %dimensions of the oval
centeredRect = CenterRectOnPointd(baseRect, xCenter, yCenter); %centered coordinates for oval

%Draw circle
ovColor = repmat(startingGreyLevel,1,3)*256; %transform input to 256 RGB color system used by FillOval
Screen(screen, 'FillOval', ovColor, centeredRect); %topLeftX, topLeftY, lowRightX,lowRightY

%% Flip screen
Screen(screen, 'Flip');
%KbWait(); %mute for all experiment

end