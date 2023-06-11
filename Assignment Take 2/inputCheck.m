function output = inputCheck()
    validInput = false;
    while ~validInput
        ansStr = input('Input -> ', 's');
        ansNum = str2num(ansStr);
        
        if isempty(ansNum) || ~isnumeric(ansNum)
            disp('Invalid input. Please enter a numeric value.');
        else
            validInput = true;
            output = ansNum;
        end
    end
    disp(['You entered: ', num2str(ansNum)]);