
%% This script reads sample measurements and plots the ‘gamma’ curve for a sample display

%Read in csv file
GammaData = readtable('/Users/Conrad/Desktop/MATLAB_Final/AssociatedFiles/GammaData.csv'); %notice file is in AssociatedFiles folder + directory is integrated into filename

%Plot the data
plot(GammaData.requestedSignal, GammaData.measuredOutput, 'r-'); %same rationale as Q2
xlabel('Requested Signal');
ylabel('Light Output');

