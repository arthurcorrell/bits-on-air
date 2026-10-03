function channel_bit_sequence = BSC_channel(bit_sequence, q)

% channel causes bit flip with probability of q

% first generate bitmap for selecting bits to flip
N = size(bit_sequence, 2); % size of sequence in the column dimension

bitmap = rand(1, N) < q; % has 1s with probability of q

channel_bit_sequence = mod(bit_sequence + bitmap, 2); % each index to which 1 is added flips!



end