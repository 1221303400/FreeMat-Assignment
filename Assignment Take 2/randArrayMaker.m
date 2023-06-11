function output = randArrayMaker(minValue, size)
    
    output = zeros(1, size);
    randArray = rand(1, size);

    % To make sure CDF = 1.00
    randArray = randArray / sum(randArray);

    % Adjust the probabilities to ensure each value is greater than minValue
    while any(randArray < minValue)
        idx = randArray < minValue;
        randArray(idx) = rand(1, sum(idx));
        randArray = randArray / sum(randArray);
    end

    output = randArray;

