
%% This script estimates the gamma of my display

%Load my data
GammaData = readtable('/Users/Conrad/Desktop/MATLAB_Final/Output/PerceptualGamma_CES.csv');
GammaData.Mean = (GammaData.Repeat1 + GammaData.Repeat2 + GammaData.Repeat3) / 3; %calculate inter-cycle means
GammaData(:,2:4) = []; %erase data from individual cycles
GammaData.Pattern = GammaData.Pattern/9; %to transform pattern numbers (e.g. HalfTonePattern 1) into what they represent (i.e. 1/9ths of whiteness). 
GammaData.Properties.VariableNames = {'measuredOutput' 'requestedSignal'}; %match names to those used by Q5 function 
                                     %halftonePattern    brightness match

%Estimate the gamma of the display
[f] = Q5_PowerLawFit(GammaData) %Results: I = R ^ 2.026 (2.03 to 2.d.p; with sample data, I = R ^ 2.19).

