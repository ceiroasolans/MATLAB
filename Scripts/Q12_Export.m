
%% This script saves results from Experiment to csv file with 3-letter P identifier 
% (it requires that the "Table" variable from the previous question is
% still in the workspace. To demo, see end of the script). 

 pName = input('Please write down your first, middle, and last name: ', 's'); %input, accept string ('s')
 
while length(strsplit(pName)) ~= 3
   if length(strsplit(pName)) < 3
        pName = input('If you do not have a middle name, write two last names: ', 's');
   elseif length(strsplit(pName)) > 3
       pName = input('Please limit your answer to three words: ', 's'); 
    end
end

pInitials = cellfun(@(x) x(1),strsplit(pName)); %function that applies anonymous function (@(x) that takes the first letter of x (x(1)), for every individual cell in pName
writetable(Table,strcat('/Users/Conrad/Desktop/MATLAB_Final/Output/PerceptualGamma_',pInitials, '.csv'))


%To demo, you can use any table in the workspace. Alternatively, use: 
% Table = array2table(rand(5,5));