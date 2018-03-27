function sensitivity = getsensitivity(out, ground)

%sensitivity = TP / (TP + FN)
TP = 0;
FN = 0;

%find the number of true positives in the 'out' image
for row = 1:size(out, 1)
    for col = 1:size(out, 2)
        %if label is positive, verify whether ground is true
        if (out(row, col) == 1)
            if ground(row, col) == 1
                TP = TP + 1;
            end
            %if label is negative, verify whether ground is true
        else
            if (ground(row, col) == 1)
                FN = FN + 1;
            end
            
        end
    end
end

sensitivity = TP / (TP + FN);

end


