function work(timeParam)
    % Time Arrive, customer beratur kat queue
    % Time Service ends, customer leave
    
    global customers counter1Q counter2Q counterExQ counterArray counterNames;
    counterQueues = {counter1Q, counter2Q, counterExQ};
    custAmount = numel(customers{1});
    
    % Queueing at Counters
    for i = 1:custAmount
        if timeParam == customers{4}(i) % Arrival Time
            fprintf('Customer %d has arrived ', customers{1}(i));
            if customers{5}(i) <= 3
                counterExQ = [counterExQ, i];
                fprintf('and queued at Counter Express.\n');
            elseif numel(counter1Q) <= numel(counter2Q)
                counter1Q = [counter1Q, i];
                fprintf('and queued at Counter 1.\n');
            else
                counter2Q = [counter2Q, i];
                fprintf('and queued at Counter 2.\n');
            end
        end
    end
    
    for c = 1:numel(counterQueues)
        
        % Initializing attributes
        queueAmount = numel(counterQueues{c});
        if queueAmount <= 0
            queueAmount = 1;
        end
        ID = zeros(1, queueAmount); 
        RN = zeros(1, queueAmount);
        interArrival = zeros(1, queueAmount);
        arrival = zeros(1, queueAmount);
        service = zeros(1, queueAmount);
        serviceBegin = zeros(1, queueAmount);
        serviceEnd = zeros(1, queueAmount);
        wait = zeros(1, queueAmount);
        spent = zeros(1, queueAmount);
        
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
    
        % Show Departure
    for c = 1:numel(counterQueues)
        for i = 1:numel(counterQueues{c})
            if timeParam == workAttrArray{c}{7}(i)
                fprintf('Customer %d has left %s\n', workAttrArray{c}{1}(i), counterNames{c});
            end
        end
    end
                
                
                
                
                