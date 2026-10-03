function [mu_N, sigma_N] = drain(bitsequence)

    % recieves a logical arr bitsequence of length sequence_length and
    % prob(0) = p to compute statistics
    N = size(bitsequence, 2);

    mu_N = (1/N) * sum(bitsequence, "all" );

    % take sqrt of the variance, perform elementwise subtraction and
    % squaring
    sigma_N = sqrt(   (1/(N-1))  *  sum( (bitsequence - mu_N).^2 )  );

    

