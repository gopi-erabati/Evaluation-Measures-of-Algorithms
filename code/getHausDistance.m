function hausDistance = getHausDistance(Im1, Im2)
%Returns Haussdorf distance between two binary images Im1 and Im2

%Initialize hausDistance as an impossible distane so that it will
%certainly be updated (bubble sort type strategy)
hausDistance12 = -1;

% Hausdorf distance between Im1 and Im2
% for each pixel in Im1
for u = 1:size(Im1, 1)
    for v = 1:size(Im1, 2)
        %assume a very large min distance (bubble sort type strategy)
        mindistance = 1e7;
        %check if its value = 1
        if (Im1(u, v) > 0)
            %if yes, find the minimum distance between it and 
            %a non-zero pixel in Im2
            for i = 1:size(Im2 ,1)
                for j = 1:size(Im2 ,2)
                    if (Im2(i, j) > 0)
                        distance = sqrt((u - i)^2 + (v - j)^2);
                        if (distance < mindistance)
                            mindistance = distance;
                        end
                    end
                end
            end
            
            %update current estimate of hausDorf distance if a bigger
            %minimum distance has been found
            if (mindistance > hausDistance12)
                hausDistance12 = mindistance;
            end
        end
        
    end
end


%Initialize hausDistance as an impossible distane so that it will
%certainly be updated (bubble sort type strategy)
hausDistance21 = -1;

% Hausdorf distance between Im2 and Im1
% for each pixel in Im2
for u = 1:size(Im2, 1)
    for v = 1:size(Im2, 2)
        %assume a very large min distance (bubble sort type strategy)
        mindistance = 1e7;
        %check if its value = 1
        if (Im2(u, v) > 0)
            %if yes, find the minimum distance between it and 
            %a non-zero pixel in Im1
            for i = 1:size(Im1 ,1)
                for j = 1:size(Im1 ,2)
                    if (Im1(i, j) > 0)
                        distance = sqrt((u - i)^2 + (v - j)^2);
                        if (distance < mindistance)
                            mindistance = distance;
                        end
                    end
                end
            end
            
            %update current estimate of hausDorf distance if a bigger
            %minimum distance has been found
            if (mindistance > hausDistance21)
                hausDistance21 = mindistance;
            end
        end
        
    end
end

hausDistance = max(hausDistance12, hausDistance21);

end