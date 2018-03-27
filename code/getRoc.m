function rocPoints = getRoc(algPath, groundPath, thresholds)

%get a set of sensitivity and specificity values for images in 'alg' folder
alg = algPath;
files = dir([alg, '\*.tif']); %all tif images in the alg folder
sensitivity = [];
specificity = [];
rocPoints = [];

%for each image in the given directory
for nimage = 1:length(files)
    output = imread([alg, '\', files(nimage).name]);
    ground = imread([groundPath, '\', files(nimage).name]);
    
    %threshold the image at each threshold value defined in 'thresholds'
    
    %for each thresholded/binary image
    sensitivity = []; specificity = [];
    for nthreshold = 1:length(thresholds)
        out = (output > thresholds(nthreshold));
        sensitivity = [sensitivity, getsensitivity(out, ground > 0)];
        specificity = [specificity, getspecificity(out, ground > 0)];
        
    end
    
    rocPoints = [rocPoints, [sensitivity', (1 - specificity)']];
    
end

end
