function workDisplay()
    global customers counterNames counterArray;
    global counter1Q counter2Q counterExQ workAttrArray;
    counterQueues = {counter1Q, counter2Q, counterExQ};
    
    workAttrStr = {'n ', 'RN','Inter', 'A.Time', 'Service', 'Begins', 'Ends', 'Wait', 'Spent'};
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
        fprintf('----+----+-------+--------+---------+--------+------+------+-------\n');
        for n = 1:numel(counterQueues{c}) % Number of customers queueing         
            fprintf(' %02d | %02d |   %d   |   %02d   |    %d    |   %02d   |  %02d  |  %02d  |  %d \n', ...
            [workAttrArray{c}{1}(n); workAttrArray{c}{2}(n); workAttrArray{c}{3}(n); ...
            workAttrArray{c}{4}(n); workAttrArray{c}{5}(n); workAttrArray{c}{6}(n); ...
            workAttrArray{c}{7}(n); workAttrArray{c}{8}(n); workAttrArray{c}{9}(n)]);
        end
    end
