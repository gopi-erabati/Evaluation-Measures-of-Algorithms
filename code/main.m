clc; clear all; close all
%%
groundPath  = 'Ground Truth\';
nalgs = 6;
nImages = 4;
thresholds = 10:10:255;
rocCounter = 1;

figure(1);
%for each algorithm
for nalg = 1:nalgs
    algPath = ['alg', num2str(nalg), '\'];
    
    %obtain roc points for each of the four images
    rocPoints = getRoc(algPath, groundPath, thresholds);
    
    %figure
    %plot the roc points for each of the nImages
    col = 1;
    
    % for all plots in one image
    %     for nimage = 1:nImages
    %         subplot(nalgs, nImages, rocCounter);
    %         plot(rocPoints(:,col+1), rocPoints(:,col) );
    %         title(['alg ', num2str(nalg), ', im', num2str(nimage)]);
    %
    %         col = col + 2;
    %         rocCounter = rocCounter + 1;
    %         hold on;
    %     end
    
    % for all plots according to algorithm
    subplot(2,3,rocCounter);
    for col = 1:2:7
        plot(rocPoints(:,col+1), rocPoints(:,col) );
        hold on;
        legend('img1','img2','img3','img4');
    end
    title(['alg ', num2str(nalg)]);
    rocCounter = rocCounter + 1;
    hold on;
    
end





