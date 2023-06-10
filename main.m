function main()
    % Global variables
    global counterAttributes;
    counterAttributes = {'Service Time', 'Probability ', 'CDF ', 'Range '};
    global counter1Prob, global counter2Prob, global counterExProb;
    counterProbs = {counter1Prob, counter2Prob, counterExProb};
    
    counterNum = 3;
    counterNames = {'Counter 1  ', 'Counter 2  ', 'Counter Ex '};
    counterAttrs = {'Service Time', 'Probability ', 'CDF         ', 'Range       '}; 
    
    columnNum = 4;
    
    % Service Time
    global counterTimes;
    serviceTimeInit();
    
    % Probabilities pakai Global
    
    % CDF
    counterCDF = 1:columnNum;
    counterCDFs = {counterCDF, counterCDF, counterCDF};
    for i=1 : counterNum
        for j=1 : columnNum
            if j == 1
                counterCDFs{i}(j) = counterProbs{i}(j);
            else
                counterCDFs{i}(j) = counterCDFs{i}(j-1) + counterProbs{i}(j);
            end
        end
    end
    
    % Range
    counterRange = zeros(2, 4);
    counterRanges = {counterRange, counterRange, counterRange};
    
    for i=1 : counterNum
        for j=1 : columnNum
            switch j
                case 1
                    counterRanges{i}(1, j) = round(counterCDFs{i}(j)*100); 
                    counterRanges{i}(2, j) = 0;
                case columnNum
                    counterRanges{i}(1, j) = 100;
                    counterRanges{i}(2, j) = round(counterCDFs{i}(j-1)*100 + 1);
                otherwise
                    counterRanges{i}(1, j) = round(counterCDFs{i}(j)*100);       % 1 is UB
                    counterRanges{i}(2, j) = round(counterCDFs{i}(j-1)*100 + 1); % 2 is LB
            end
        end
    end

    
    % Tables
    arrayOfArrays = {counterTimes, counterProbs, counterCDFs, counterRanges};
    
    for i=1 : counterNum
        
        fprintf('\n\n%s: \n', counterNames{i});
        for j=1 : numel(counterAttrs)
            switch j
                case 1
                    arrayStr = sprintf('   %d   |', arrayOfArrays{j}{i}(1,:));
                    disp([counterAttrs{j}, ': ' arrayStr]);
                case {2,3}
                    arrayStr = sprintf(' %.2f  |', arrayOfArrays{j}{i}(1,:));
                    disp([counterAttrs{j}, ': ' arrayStr]);
                case 4
                    lowerBounds = arrayOfArrays{j}{i}(2, :);
                    upperBounds = arrayOfArrays{j}{i}(1, :);
                    arrayStr = sprintf(' %02d-%d |', [lowerBounds; upperBounds]);
                    disp([counterAttrs{j}, ': ' arrayStr]);
                otherwise
                    disp('Switch Error');
            end
        end
    end
    fprintf('\n');
