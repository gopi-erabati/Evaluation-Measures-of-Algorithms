function specificity = getspecificity(out,ground)

%specificity = TN/(TN + FP)
true_neg = 0;
fal_pos = 0;

%find the number of true negatives in the 'out' image
for i = 1:size(ground,1)
    for j = 1:size(ground,2)
        %if label is neagtive and ground is negative then its true negative
        if (out(i,j) == 0 && ground(i,j) == 0)
            true_neg = true_neg + 1;
        %if label is positive and ground is negative then its false
            %positive
        elseif (out(i,j) == 1 && ground(i,j) == 0)
            fal_pos = fal_pos + 1;
        end
    end
end

specificity = true_neg/(true_neg + fal_pos);

end

