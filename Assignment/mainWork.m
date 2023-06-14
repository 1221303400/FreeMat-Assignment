function mainWork()
    global counter1Q counter2Q counterExQ customers counterTimes;
    counter1Q = [];
    counter2Q = [];
    counterExQ = [];
    counterQueues = {counter1Q, counter2Q, counterExQ};
    time = 0;
    working = true;
    
    timeEnd = customers{4}(end) + counterTimes{1}(end) + 1;
    
    myPause();
    while working
        fprintf('\n ~ Time = %d ~ \n', time);
        work(time);
        
        time = time + 1;
        
        % TO break work
        if time > timeEnd % For Testing
            working = false;
        end
    end
    
    fprintf('\n    ~~~~~ Time = %d, shop closed! ~~~~~', time);
    workDisplay();
    disp('Thank you for shopping! ;D');
    myPause();