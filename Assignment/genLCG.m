function output = genLCG(a, c, size, seed)
    randNumbers = zeros(1, size);
    randNumbers(1) = ceil(mod(a * seed + c, 100));

    for i = 2 : size
        x = mod(a * mod(randNumbers(i-1), 100) + c, 100);
        randNumbers(i) = ceil(x);
        if randNumbers(i) == 100
            randNumbers(i) = 99;
        end
    end

    output = randNumbers;
end
