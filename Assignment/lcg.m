function output = lcg()
    
    n = 1;
    m = 100;
    a = 5;
    c = 21;
    
    % Set the initial seed value [0,100]
    x = rand() * 100;
    
    % Calculate the next random number using the LCG formula
    x = mod(a * x + c, m);
    
    output = floor(x);
    
