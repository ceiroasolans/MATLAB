
%% This script generates requestedSignal and lightOutput values

%Generate array of requested values from 0 to 1 in steps of 0.05 
requestedSignal = 0:0.05:1;

%Calculate the output intensities of a display with a gamma value of 2.2
lightOutput = requestedSignal .^ 2.2; %I use “.^” as opposed to “^” because this operation involves elementwise matrix powers 