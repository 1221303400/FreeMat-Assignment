function output = example()
    % 2 counters, 1 express
    
    counters = {'Counter 1', 'Counter 2', 'Counter Express'};
    attributes = {'Service Time', 'Probability ', 'CDF         ', 'Range       '};
    counterArray = cell(1, 3);
    
    for counterNum=1 : 3
    
        fprintf('\n%s: \n', counters{counterNum});
        
        n = 4;    % number of columns
        
        % serviceTime and probability
        serviceTime = 1:n;
        probability = diff([0, sort(rand(1, n - 1)), 1]);
        roundedProb = round2DP(probability);
        
        % Adjust the last value of roundedProb if necessary
        sumRoundedProb = sum(roundedProb);
        if sumRoundedProb ~= 1.00
            roundedProb(end) = roundedProb(end) + (1.00 - sumRoundedProb);
        end
        
        % CDF
        CDF(1) = roundedProb(1);
        for i=2 : n
            CDF(i) = CDF(i-1) + roundedProb(i);
        end
        
        % range
        range{1} = sprintf('00-%02d', 100*CDF(1));
        for i=2 : n
            range{i} = sprintf('%02d-%02d', 100*CDF(i-1) + 1, 100*CDF(i));
        end
        realRange{1} = 0 : 100*CDF(1);
        for i=2 : n
            realRange{i} = 100*CDF(i-1)+1 : 100*CDF(i);
        end
        
        arrayOfArrays = {serviceTime, roundedProb, CDF, range};
        counterArray{counterNum} = arrayOfArrays;
        
        for i=1 : 4    % 4 = number of rows
            switch i
                case 1
                    arrayStr = sprintf('   %d   |', arrayOfArrays{i});
                    disp([attributes{i}, ': ' arrayStr]);
                case {2,3}
                    arrayStr = sprintf(' %.2f  |', arrayOfArrays{i});
                    disp([attributes{i}, ': ' arrayStr]);
                case 4
                    arrayStr = sprintf(' %s |', arrayOfArrays{i}{:});
                    disp([attributes{i}, ': ' arrayStr]);
                otherwise
                    disp('Switch Error');
            end
        end
    end
    mypause();
    
    % Customers
    custAttr = {'Arrival Time', 'Probability ', 'CDF         ', 'Range       '};
    custN = 3;
    
    % arrivalTime and probability
        arrivalTime = 1:custN;
        cProbability = diff([0, sort(rand(1, custN - 1)), 1]);
        cRoundedProb = round2DP(cProbability);
        
        % Adjust the last value of roundedProb if necessary
        cSumRoundedProb = sum(cRoundedProb);
        if cSumRoundedProb ~= 1.00
            cRoundedProb(end) = cRoundedProb(end) + (1.00 - cSumRoundedProb);
        end
        
        % CDF
        cCDF(1) =cRoundedProb(1);
        for i=2 : custN
            cCDF(i) = cCDF(i-1) + cRoundedProb(i);
        end
        
        % range
        cRange{1} = sprintf('00-%02d', 100*cCDF(1));
        for i=2 : custN
            cRange{i} = sprintf('%02d-%02d', 100*cCDF(i-1) + 1, 100*cCDF(i));
        end
        cRealRange{1} = 0 : 100*cCDF(1);
        for i=2 : custN
            cRealRange{i} = 100*cCDF(i-1)+1 : 100*cCDF(i);
        end
        
        cArrayOfArrays = {arrivalTime, cRoundedProb, cCDF, cRange};
        fprintf('Customer: \n');
        
        for i=1 : 4    % 4 = number of rows
            switch i
                case 1
                    arrayStr = sprintf('   %d   |', cArrayOfArrays{i});
                    disp([custAttr{i}, ': ' arrayStr]);
                case {2,3}
                    arrayStr = sprintf(' %.2f  |', cArrayOfArrays{i});
                    disp([custAttr{i}, ': ' arrayStr]);
                case 4
                    arrayStr = sprintf(' %s |', cArrayOfArrays{i}{:});
                    disp([custAttr{i}, ': ' arrayStr]);
                otherwise
                    disp('Switch Error');
            end
        end
        
    value = counterArray{2}{1}(4);
    disp(value);
    
    
    
    
    
    
    
    
    
    
    
    
    