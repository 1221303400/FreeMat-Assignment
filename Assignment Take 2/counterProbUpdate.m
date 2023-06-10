function counterProbs = counterProbUpdate(minValue, size)
    global counter1Prob counter2Prob counterExProb;
    
    counterProbs = {counter1Prob, counter2Prob, counterExProb};
    
    for i=1 : numel(counterProbs)
        counterProbs{i} = rand(1, size);
        
        % To make sure CDF = 1.00
        counterProbs{i} = counterProbs{i} / sum(counterProbs{i});
        
        % Adjust the probabilities to ensure each value is greater than minRange
        while any(counterProbs{i} < minValue)
            idx = counterProbs{i} < minValue;
            counterProbs{i}(idx) = rand(1, sum(idx));
            counterProbs{i} = counterProbs{i} / sum(counterProbs{i});
        end
    end
    
    % Assign the updated values back to the global variables
    counter1Prob = counterProbs{1};
    counter2Prob = counterProbs{2};
    counterExProb = counterProbs{3};