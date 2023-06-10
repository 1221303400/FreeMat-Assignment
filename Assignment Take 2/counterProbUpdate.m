function counterProbs = counterProbUpdate(size)
    global counter1Prob counter2Prob counterExProb;
    
    counterProbs = {counter1Prob, counter2Prob, counterExProb};
    
    for i=1 : numel(counterProbs)
        counterProbs{i} = randArrayMaker(0.1, size);
    end
    
    % Assign the updated values back to the global variables
    counter1Prob = counterProbs{1};
    counter2Prob = counterProbs{2};
    counterExProb = counterProbs{3};