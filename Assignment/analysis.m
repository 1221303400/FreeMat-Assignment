function analysis()
    global counter1Q counter2Q counterExQ customers;
    counterQueues = {counter1Q, counter2Q, counterExQ};
    % Data Analysis
    global data workAttrArray;
    
    % Initializing data
    interAvg = zeros(1, numel(counterQueues));
    arriveAvg = zeros(1, numel(counterQueues));
    serveAvg = zeros(1, numel(counterQueues));
    waitAvg = zeros(1, numel(counterQueues));
    spentAvg = zeros(1, numel(counterQueues));
    waitProb = zeros(1, numel(counterQueues));
    
    for c = 1:numel(counterQueues)
        interAvg(c) = mean(workAttrArray{c}{3});
        arriveAvg(c) = mean(workAttrArray{c}{4});
        serveAvg(c) = mean(workAttrArray{c}{5});
        waitAvg(c) = mean(workAttrArray{c}{8});
        spentAvg(c) = mean(workAttrArray{c}{9});
        
        count = sum(workAttrArray{c}{8} == 0);
        waitProb(c) = 1 - (count / numel(counterQueues{c}));
    end
    
    data = {interAvg, arriveAvg, serveAvg, waitAvg, spentAvg, waitProb};
    
    % Data Analysis Display
    global counterNames;
    
    dataStr = {'AVG. Inter-Arrival Time:', 'AVG. Arrival Time:', 'AVG. Service Time:',...
    'AVG. Wait Time:', 'AVG. Spent Time:', 'Wait Probability:'};
    
    fprintf('Data Analysis\n');
    for c = 1:numel(counterQueues)
        fprintf('\n%s \n', counterNames{c});
        for i = 1:numel(dataStr)
            fprintf('%s %.4f\n', dataStr{i}, data{i}(c));
        end
    end