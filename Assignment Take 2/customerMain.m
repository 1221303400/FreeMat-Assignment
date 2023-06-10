function customerMain()
    custAttr = {'Arrival Time', 'Probability ', 'CDF         ', 'Range       '};
    
    global interArrTime;
    interArrTime = [1, 2, 3, 4, 5];
    columnNum = numel(interArrTime);
    
    % Probability
    global custProb;
    custProb = [0.2, 0.2, 0.2, 0.2, 0.2]; % For Testing
    % custProb = randArrayMaker(0.1, columnNum);
    
    % CDF
    custCDF = zeros(1, columnNum);
    custCDF(1) = custProb(1);
    for i=2 : columnNum
        custCDF(i) = custCDF(i-1) + custProb(i);
    end
    
    % Range
    custRange = zeros(2, columnNum);
    
    for i=1 : columnNum
        switch i
            case 1
                custRange(1, i) = round(custCDF(i)*100); 
                custRange(2, i) = 0;
            otherwise
                custRange(1, i) = round(custCDF(i)*100);       % 1 is UB
                custRange(2, i) = round(custCDF(i-1)*100 + 1); % 2 is LB
        end
    end
    
    % Tables
    arrayOfArrays = {interArrTime, custProb, custCDF, custRange};
    
    fprintf('\n\nCustomer: \n');
    for i=1 : numel(custAttr)
        switch i
            case 1
                arrayStr = sprintf('   %d   |', arrayOfArrays{i});
                disp([custAttr{i}, ': ', arrayStr]);
            case {2,3}
                arrayStr = sprintf(' %.2f  |', arrayOfArrays{i});
                disp([custAttr{i}, ': ', arrayStr]);
            case 4
                lowerBounds = arrayOfArrays{i}(2, :);
                upperBounds = arrayOfArrays{i}(1, :);
                arrayStr = sprintf(' %02d-%d |', [lowerBounds; upperBounds]);
                disp([custAttr{i}, ': ', arrayStr]);
            otherwise
                disp('switch Error');
        end
    end
    fprintf('\n');
                
                
                
                
                
                
                
                
    