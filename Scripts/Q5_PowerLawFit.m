
%% This function uses "fit()" to fit a power-law curve, and plots the result. 
%Input: optional. ONLY provide input argument if running this file as part of Q16! 
%Output: "f", the model of the fit of the curve. 

%NOTE: if running as part of Q5, run from the editor as is, or run from the
%command window without specifying the input variable (i.e. [f] =
%Q5_PowerLawFit)

function [f] = Q5_PowerLawFit (GammaData) 

%Read in csv file 
if nargin < 1, %if there are fewer than one input arguments provided, then read file 
    GammaData = readtable('/Users/Conrad/Desktop/MATLAB_Final/AssociatedFiles/GammaData.csv');
end 

%Determine options for the fit (method and starting value for exponent)
options = fitoptions('Method', 'NonlinearLeastSquares');
targetExponent = 2; %Starting value for exponent to get reliable fit; gama displays usually = 2 
options.StartPoint = targetExponent; % provide a starting value based on the expected power-law

%Fit and plot data
f = fit(GammaData.requestedSignal, GammaData.measuredOutput, 'x^m', options); %x^m refers to the formula used to fit (x to the exponent of m)
plot(GammaData.requestedSignal, GammaData.measuredOutput, 'rx'); 
hold on;
plot(f, 'g'); legend('hide'); %the g stands for "green" (color of the fitted line)
xlabel('Brigthness Match');
ylabel('Halftone Pattern');
text(0.1, 0.9, ['I = R ^{' num2str(f.m, '%3.2f') '}'], 'fontsize', 14); %3.2f = 3 numbers. 2 decimal places (taking the "m" value within the fit ("f") object parameters)
hold off
end