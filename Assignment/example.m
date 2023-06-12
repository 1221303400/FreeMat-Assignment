function example()
    myArray = [];  % Create an empty array

    disp(myArray);  % Display the empty array
    
    % Add values to the array using concatenation
    myArray = [myArray, 1, 2, 3];
    
    disp(myArray(3));  % Display the updated array
    disp(numel(myArray));  % Display the number of elements in the array

