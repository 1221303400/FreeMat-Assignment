function output = rvgUD()
    
    a = -5;
    b = 10;
    
    % Set the initial seed value [-a/(b-a), (100-a)/(b-a)]
    % x = rand() * (20/3) + (1/3);
    x = rand() * (((100-a)/(b-a)) - (-a/(b-a))) + (-a/(b-a));
    
    % Calculate the next random number using the LCG formula
    x = a + (b-a) * x;
    
    output = floor(x);