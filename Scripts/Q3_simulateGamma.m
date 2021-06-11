
%% This function simulates the effect of displaying an image with different gammas.
%Requires 2 arguments: 
%   -filename (can use the one in line 23)
%   -GammaValue (e.g. 0.5, 1.0 or 2.0)

function Q3_simulateGamma(filename, gValue)

%Read in the image
image = imread(filename); %read in numerical matrix depicting image

%Rescale 256 unit8 values to integers ranging from 0-1 (to use gamma formula I = R^Y; otherwise imread() error)
scaled = im2double(image);  

%Transform image to different gamma values (as inputed)
gTransformed = scaled .^ gValue;

%View image
imshow(gTransformed);

end


%Note: the sample image lives in the following directory:
%'/Users/Conrad/Desktop/MATLAB_Final/AssociatedFiles/Bodleian_WTCollection.png'

%To demo, use this code before running the function directly from the command window: 
% filename = '/Users/Conrad/Desktop/MATLAB_Final/AssociatedFiles/Bodleian_WTCollection.png';
% gValue = 0.5;
