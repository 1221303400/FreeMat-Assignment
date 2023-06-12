function output = valueAssigner(value, rangeMatrix)
    % rangeMatrix = 2-by-n matrix
    index = 0;
    
    for i = 1:size(rangeMatrix, 2)
        if value <= rangeMatrix(1, i) && value >= rangeMatrix(2, i)
            index = i;
            break
        end
    end
    
    output = index;