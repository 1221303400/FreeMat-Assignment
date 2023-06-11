function workDisplay()
    global time customers counterNames;
    global counter1Q counter2Q counterExQ;
    counterQueues = {counter1Q, counter2Q, counterExQ};
    
    workAttrStr = {'n', 'RN', 'Service', 'Begins', 'Ends', 'Wait', 'Spent'};
    custAmount = numel(customers{1});
    
    for c = 1:numel(counterQueues)
        fprintf('\n\n%s: \n', counterNames{c});
        
        for i = 1:numel(workAttrStr)
                if i < numel(workAttrStr)
                fprintf(' %s |', workAttrStr{i});
            else
                fprintf(' %s\n', workAttrStr{i});
            end
        end
        fprintf('---+----+---------+--------+------+------+-------\n');
        for n = 1:numel(counterQueues{c})
            fprintf(' %d |\n', [counterQueues{c}(n); ]);
        end
    end