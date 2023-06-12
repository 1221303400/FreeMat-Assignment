function output = genRVGUD(size)
    randNumbers = zeros(1, size);
    a = 0;
    b = 100;
    
    for i=1 : size
        x = rand();
        x = a + (b - a)*x;
        
        randNumbers(i) = ceil(x);
        if randNumbers(i) == 100
            randNumbers(i) = 99;
        end
    end
    
    output = randNumbers;