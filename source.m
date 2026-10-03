function bitsequence = source(sequence_length, p)
    
    % p is probability that value assumes 0 -> any value above p is assumed
    % with 1-p probability
    bitsequence = (rand(1, sequence_length) > p);

end