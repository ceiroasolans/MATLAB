%% This script generates 8 test patterns (600x600) and saves them as PNG files

numArrays = 8; %we want 8 arrays for 8 different test patterns (here for readibility purposes)
binaryElements = cell(numArrays,1); %create empty cell array to store the patterns 
addpath '/Users/Conrad/Desktop/MATLAB_Final/AssociatedFiles'; %add path to folder of GenerateThreeByThreeElement function (in AssociatedFiles)

for i = 1:numArrays
    binaryElements{i} = repmat(GenerateThreeByThreeElement(i), 200); %each cell contains the whole pattern produced by provided function, which is repeated 200 times to achieve desired size (600px600p)
    imwrite(binaryElements{i}, strcat('/Users/Conrad/Desktop/MATLAB_Final/Output/Pattern', num2str(i),'.png')); %write each pattern to its own file
end

%To visualize:      imshow(binaryElements{i},'InitialMagnification',100);
%(replace i with the desired element you want to visualize. 