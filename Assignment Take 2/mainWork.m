function workMain()
    global time counter1Q counter2Q counterExQ;
    counter1Q = [];
    counter2Q = [];
    counterExQ = [];
    time = 0;
    working = true;
    
    while working
        workTime();
        time = time + 1;
        
        % TO break work
        if time > 24
            working = false;
        end
    end
    
    disp('Thank you for shopping! ;D');