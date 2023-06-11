function mainGenRand()
    
    disp('Enter the number of customers:');
    custAmount = inputCheck();
    % disp(['You entered: ', num2str(custNum)]);
    global randomNumbers;
    
    myPause();
    
    answering = true;
    while answering
        fprintf('Which number generator you prefer? "LIN" for linear. "UNI" for uniform.\n');
        genType = input('LIN or UNI? -> ', 's');
        switch lower(genType)
            case 'lin'
                disp('Linear Congruential Generator');
                disp('Enter the values of:');
                disp('the multiplier, a: ');
                a = inputCheck();
                disp('the increment, c: ');
                c = inputCheck();
                disp('the seed, x0: ');
                seed = inputCheck();
                
                randomNumbers = genLCG(a, c, custAmount, seed);
                answering = false;
                
            case 'uni'
                disp('Random Variate Generator for Uniform distribution');
                randomNumbers = genRVGUD(custAmount);
                answering = false;
                
            otherwise
                disp('Invalid input.');
                myPause()
        end
    end
    
    % Inter-Arrival Time
    global custRange;
    for i = 1:custAmount
        interValues(i) = valueAssigner(randomNumbers(i), custRange);
    end
    
    % Arrival Time
    arrivalTimes(1) = 0;
    for i = 2:custAmount
        arrivalTimes(i) = arrivalTimes(i-1) + interValues(i);
    end
    
    % Items
    minValue = 1;
    maxValue = 9;
    % Generate random integers between minValue and maxValue
    items = floor(rand(1, custAmount) * maxValue + minValue);
    
    myPause();
    
    randAttrs = {'n', 'RN', 'Inter', 'A.Time', 'Items'};
    
    for i = 1:numel(randAttrs)
        if i < numel(randAttrs)
            fprintf(' %s |', randAttrs{i});
        else
            fprintf(' %s\n', randAttrs{i});
        end
    end
    fprintf('---+----+-------+--------+-------\n');
    for n = 1:custAmount
        fprintf(' %d | %02d |   %d   |   %02d   |   %d \n', [n; randomNumbers(n); interValues(n); arrivalTimes(n); items(n)]);
    end
    
    
    % The customer Table
    global customers;
    customers = {1:custAmount, randomNumbers, interValues, arrivalTimes, items};
