
%% This script plots requestedSignal and lightOutput values, and saves the figure in the Output folder
% (needs to have variables created in Q1 in the workspace)

%Plot light output vs requested signal
plot(requestedSignal, lightOutput, 'r-'); %in the third argument, "r" is for red, and "-" [redundant, since it's the default], is for solid line style. I did not specify any markers. 
xlabel('Requested Signal');
ylabel('Light Output');

%Save output to a .png
Dir = '/Users/Conrad/Desktop/MATLAB_Final/Output/'; % specify directory in which to save plot (done like this for demonstration purposes, but from now on [Q4 onwards] I will integrate it into the filename directly for simplicity 
saveas(gcf,strcat(Dir,'Q2_Output.png')); %"gcg" returns the current figure handle, which is used as the object to save; strcat() to concatenate "Dir" and the rest of the filename

