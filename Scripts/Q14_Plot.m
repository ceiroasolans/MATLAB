
%% This script creates and saves a plot from sample participant data

addpath '/Users/Conrad/Desktop/MATLAB_Final/Output'; %to get access to the files
files = dir(fullfile('/Users/Conrad/Desktop/MATLAB_Final/Output/PerceptualGamma_*')); %get name directory of all randomly generated PerceptualGamma files

t= tiledlayout(5,4); %create tiled layout for all the graphs
  xlabel(t, 'HalftonePattern'); %superordinate labels for the collage
  ylabel(t,'Brightness match');

for i = 1:length(files)
    file = files(i).name; 
    
    if strcmp(file,'PerceptualGamma_CES.csv') %if this file is NOT mine, continue
        continue
    end
    
    id = file(17:19);%take P identifier from file name. Could also use extract before & after functions for more dynamic, but takes two lines of code and assumes I know the filename anyways
    
    data = readtable(file);
    data.pattern = data.pattern/9; %to transform pattern numbers (e.g. HalfTonePattern 1) into what they represent (i.e. 1/9ths of whiteness). 
    
    nexttile; %goes here and not in the end because it needs a 'nexttile' before getting started with the *first*. 
    
    plot(data.pattern,[data.Repeat1 data.Repeat2 data.Repeat3],'marker', '.'); %plot (3 'repeats' on the same axes)
    title(id);
end

saveas(gcf,'/Users/Conrad/Desktop/MATLAB_Final/Output/Q14_Output.png'); %gcf = current figure handle

