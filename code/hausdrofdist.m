% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function to claculate hausdroff distance for particular thresholds of all
% algorithmsa and all images
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear all; close all;

groundPath  = 'Ground Truth\';

%thresholds at which jaccard index will be computed
 thresholds = [50 80 40 100 70 120];

nalgs = 6;

for nalg = 1:nalgs
    
    algPath = ['alg', num2str(nalg)];
    
    files = dir([algPath, '\*.tif']);
    
    
    for nimage = 1:length(files)
        Imalg = imread([algPath, '\', files(nimage).name]);
        ground = imread([groundPath, '\', files(nimage).name]);
        
        Imground = (ground > 0);
        
        %threshold the Imalg image
        Im = (Imalg > thresholds(nalg));
        
        %get jaccard index
        hausd = getHausDistance(Imground,Im);
        
        disp(['The haussdrof index for alg' ,num2str(nalg),', img',num2str(nimage),' is ',num2str(hausd)]);
        
    end
    
end
