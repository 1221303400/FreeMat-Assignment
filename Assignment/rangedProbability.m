function prob = rangedProbability(n)
    % Generates n random probabilities
    minProbability = 0.10;
    prob = [];
    while (isempty(prob) || sum(prob) ~= 1.00)
        probabilities = rand(1, n);
        prob = round2DP(probabilities / sum(probabilities) * (1.00 - minProbability * n));
        if all(prob >= minProbability)
            prob = prob + (minProbability - min(prob));
        else
            prob = [];
        end
    end