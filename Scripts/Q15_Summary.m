
%% This function creates summary statistics from sample participant files
%Output: 
%   -GammaData (table containing summary statistics from sample files)

function [GammaData] = Q15_Summary

%Get Started
addpath '/Users/Conrad/Desktop/MATLAB_Final/Output'; %get access to the files from this directory
files = dir(fullfile('/Users/Conrad/Desktop/MATLAB_Final/Output/PerceptualGamma_*')); %get name directory of all randomly generated PerceptualGamma files
full_data = []; %create empty dataframe to append data

%Calculate within participant means onto full_data dataframe
for i = 1:length(files)
    file = files(i).name;
    
       if strcmp(file,'PerceptualGamma_CES.csv')   %as in Q14, skip my file (has the same format as sample files)
        continue
       end
    
    data = readtable(file);
    full_data(:,i) = (data.Repeat1 + data.Repeat2 + data.Repeat3)/3; %create within participant means
end

%Calculate overall mean, SD & SE
full_data( :, all(~full_data,1) ) = []; %erase my column (the one that is empty; "all" returns false for zeroes, and "1"= by columns  
Summary = [((1:8)/9)', mean(full_data,2), std(full_data, 0, 2), ((std(full_data, 0, 2)) / sqrt(20)) ]; %mean(x,2), where 2 = by rows (1=by cols). In sd, 0= normalizing by n-1(Bessel's correction; unbiased)
            %%I divide the halftone pattern number (first column of Summary) by 9 to transform it into the light-value that it represents (see Q14)

%Plot brightness vs responses (with SE)
plot(Summary(:,1), Summary(:,2)); 
    errorbar(Summary(:,1), Summary(:,2), Summary(:,4)); %fun(x, y, error) --> x=pattern(col1), y=mean(col2), error=SE(col4) 
    xlabel('Halftone Pattern');
    ylabel('Brigthness match');
    title('Average data');
    
GammaData = array2table(Summary);
GammaData.Properties.VariableNames = {'Pattern' 'Mean' 'SD' 'SE'}; 
writetable(GammaData, '/Users/Conrad/Desktop/MATLAB_Final/Output/Q15_Summary.csv');

