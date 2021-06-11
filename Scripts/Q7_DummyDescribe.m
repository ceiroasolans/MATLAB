
%% DummySetupInitialStimulus
% This function first checks to make sure the input variables (numWhite & 
% startingGreyLevel) do not exceed the dimensions to which each is coded. 
% In the case of numWhite, we created 8 different pattern arrays in Q6, so
% the input variable must be between 1:8. StartingGrayLevel needs to be
% between 0:1 because the patch() function in the custom DrawDisc function
% requires a three-element vector of values between 0 and 1. 

% Second, the function reads the png-stored pattern produced in Q6 that
% aligns with the value provided in numWhite. Then its size is stored to be
% used later (should be 600x600 pixels, as specified in Q6), the pattern is
% displayed, and the DrawDisc function produces a disk half the size of the
% size stored (see line 12 in the DrawDisc .m file), and with a grey level
% specified in the input variable "startingGreyLevel" is created. 

% The result is that Pattern 1 with a disk of darkness 0.1 on top of it 
% are displayed. The function produces 3 output variables: a figWindowHandle
% (to be used later), and the width and height of the pattern.

%% DummyUpdateStimulus
% This function takes the the outputs produced by DummySetupInitialStimulus
% and an updated greyLevel value, and after making sure the value is within
% the accepted parameters (again, between 0:1), it draws a new disk with
% the updated color. 


%% When the following functions are called...

[figWindowHandle, wPattern, hPattern] = DummySetupInitialStimulus(1, 0.2); pause
DummyUpdateStimulus(figWindowHandle, wPattern, hPattern, 0.5)

%... Pattern 1 is displayed with a disk of color 0.2 (dark), and after a
%pause, the disk is updated to a medium gray (0.5). 


%% The benefit of having a DrawDisc function is: 
% That it can be called from both scripts (DummySetupInitialStimulus and
% DummyUpdateStimulus) without having to write the whole drawing of the
% Disk (as shown in DrawDisc.m) every time that it is called. It avoids
% redundancy, and it makes the code more readable and efficient.