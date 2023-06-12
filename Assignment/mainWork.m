function workMain()
    global counter1Q counter2Q counterExQ customers counterTimes;
    counter1Q = [];
    counter2Q = [];
    counterExQ = [];
    time = 0;
    working = true;
    
    timeEnd = customers{4}(end) + counterTimes{1}(end) + 1;
    
    while working
        work(time);

        time = time + 1;
        
        % TO break work
        if time > timeEnd % For Testing
            working = false;
        end
    end
    
    fprintf('\n    ~~~~~ Time = %d ~~~~~', time);
    workDisplay();
    myPause();
    
    disp('Thank you for shopping! ;D');