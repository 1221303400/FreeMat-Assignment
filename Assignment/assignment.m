function output = assignment()
    genType = input('Which number generator you prefer? "LIN" for linear. "UNI" for uniform. -> ', 's');
    number = 0;
    
    switch lower(genType)
        case 'lin'
            disp('Linear Congruential Generator');
            disp(lcg());
            
%         case 'exp'
%             disp('Random Variate Generator for Exponential distribution');
            
        case 'uni'
            disp('Random Variate Generator for Uniform distribution');
            disp(rvgUD());
            
        otherwise
            disp('Invalid input.');
            
    end
    mypause();