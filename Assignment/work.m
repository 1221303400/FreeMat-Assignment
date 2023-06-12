function work(timeParam)
    % Time Arrive, customer beratur kat queue
    % Time Service ends, customer leave
    
    global customers counter1Q counter2Q counterExQ counterArray;
    counterQueues = {counter1Q, counter2Q, counterExQ};
    custAmount = numel(customers{1});
    
    % Queueing at Counters
    for i = 1:custAmount
        if timeParam == customers{4}(i) % Arrival Time
            if customers{5}(i) <= 3
                counterExQ = [counterExQ, i];
            elseif numel(counter1Q) <= numel(counter2Q)
                counter1Q = [counter1Q, i];
            else
                counter2Q = [counter2Q, i];
            end
        end
    end
    
    for c = 1:numel(counterQueues)
        
        % Initializing attributes
        ID = zeros(1, numel(counterQueues{c})); 
        RN = zeros(1, numel(counterQueues{c}));
        interArrival = zeros(1, numel(counterQueues{c}));
        arrival = zeros(1, numel(counterQueues{c}));
        service = zeros(1, numel(counterQueues{c}));
        serviceBegin = zeros(1, numel(counterQueues{c}));
        serviceEnd = zeros(1, numel(counterQueues{c}));
        wait = zeros(1, numel(counterQueues{c}));
        spent = zeros(1, numel(counterQueues{c}));
        
        for n = 1:numel(counterQueues{c}) % For every customer at each counter
            ID(n) = counterQueues{c}(n);
            RN(n) = customers{2}(ID(n));
            
            interArrival(n) = customers{3}(ID(n));
            arrival(n) = customers{4}(ID(n));
            
            service(n) = counterArray{1}{c}(valueAssigner(RN(n), counterArray{4}{c}));
            serviceEnd(n) = service(n) + arrival(n);
            serviceBegin(2:end) = serviceEnd(1:end-1);
            
            wait(n) = serviceBegin(n) - arrival(n);
            if wait(n) < 0 % No Negative time
                wait(n) = 0;
            end
            spent(n) = serviceEnd(n) - arrival(n);
        end
        workAttrs{c} = {ID, RN, interArrival, arrival, service, serviceBegin, serviceEnd, wait, spent};
    end
    
    global workAttrArray;
    workAttrArray = {workAttrs{1}, workAttrs{2}, workAttrs{3}};
    