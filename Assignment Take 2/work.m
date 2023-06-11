function work(timeParam)
    % Time Arrive, customer beratur kat queue
    % Time Service ends, customer leave
    
    global customers counter1Q counter2Q counterExQ;
    custAmount = numel(customers{1});
    
    for i = 1:custAmount
        index = 0;
        if timeParam == customers{4}(i) 
            % Arrival Time
            if customers{5}(i) <= 3
                counterExQ = [counterExQ, i];
            elseif numel(counter1Q) <= numel(counter2Q)
                counter1Q = [counter1Q, i];
            else
                counter2Q = [counter2Q, i];
            end
        end
    end
            
    