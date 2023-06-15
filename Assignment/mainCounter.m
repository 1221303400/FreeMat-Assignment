function mainCounter()
    % Global variables
    counterAttributes = {'Service Time', 'Probability ', 'CDF ', 'Range '};

    global counter1Prob counter2Prob counterExProb;
    counterProbs = {counter1Prob, counter2Prob, counterExProb};
    
    global counterNum counterNames;
    counterNum = numel(counterProbs);
    counterNames = {'Counter 1  ', 'Counter 2  ', 'Counter Ex '};
    counterAttrs = {'Service Time', 'Probability ', 'CDF         ', 'Range       '}; 
    
    % Service Time
    global counterTimes;
    counter1Time = [5, 6, 7, 8, 9];
    counter2Time = [5, 6, 7, 8, 9];
    counterExTime = [2, 3, 4, 5];
    counterTimes = {counter1Time, counter2Time, counterExTime};
    
    columnNum1 = numel(counterTimes{1});
    columnNum2 = numel(counterTimes{2});
    columnNum3 = numel(counterTimes{3});
    columnNums = {columnNum1, columnNum2, columnNum3};
    
    % counterProbInit(); % For Testing
    
    for i = 1:counterNum
        counterProbs{i} = randArrayMaker(0.1, columnNums{i});
    end
    
    % Probabilities pakai Global
    
    % CDF
    counterCDF1 = 1:columnNums{1};
    counterCDF2 = 1:columnNums{2};
    counterCDF3 = 1:columnNums{3};
    counterCDFs = {counterCDF1, counterCDF2, counterCDF3};
    for i=1 : counterNum
        for j=1 : columnNums{i}
            if j == 1
                counterCDFs{i}(j) = counterProbs{i}(j);
            else
                counterCDFs{i}(j) = counterCDFs{i}(j-1) + counterProbs{i}(j);
            end
        end
    end
    
    % Range
    global counterRanges;
    counterRange1 = zeros(2, columnNums{1});
    counterRange2 = zeros(2, columnNums{2});
    counterRange3 = zeros(2, columnNums{3});
    counterRanges = {counterRange1, counterRange2, counterRange3};
    
    for i=1 : counterNum
        for j=1 : columnNums{i}
            switch j
                case 1
                    counterRanges{i}(1, j) = round(counterCDFs{i}(j)*100); 
                    counterRanges{i}(2, j) = 0;
                otherwise
                    counterRanges{i}(1, j) = round(counterCDFs{i}(j)*100);       % 1 is UB
                    counterRanges{i}(2, j) = round(counterCDFs{i}(j-1)*100 + 1); % 2 is LB
            end
        end
    end

    
    % Tables
    global counterArray;
    counterArray = {counterTimes, counterProbs, counterCDFs, counterRanges};
    
    for i=1 : counterNum
        
        fprintf('\n\n%s: \n', counterNames{i});
        for j=1 : numel(counterAttrs)
            switch j
                case 1
                    arrayStr = sprintf('   %d   |', counterArray{j}{i}(1,:));
                    disp([counterAttrs{j}, ': ', arrayStr]);
                case {2,3}
                    arrayStr = sprintf(' %.2f  |', counterArray{j}{i}(1,:));
                    disp([counterAttrs{j}, ': ', arrayStr]);
                case 4
                    lowerBounds = counterArray{j}{i}(2, :);
                    upperBounds = counterArray{j}{i}(1, :);
                    arrayStr = sprintf(' %02d-%d |', [lowerBounds; upperBounds]);
                    disp([counterAttrs{j}, ': ', arrayStr]);
                otherwise
                    disp('Switch Error');
            end
        end
    end
    fprintf('\n');
