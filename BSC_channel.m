function channel_bit_sequence = BSC_channel(bit_sequence, q)
% Produces bit flip with a probability of q

% PARAMS:
%   bit_sequence = bit sequence at input
%   q = probability of a bit flip

N = length(bit_sequence);
bitmap = rand(1, N) < q;
channel_bit_sequence = mod(bit_sequence + bitmap, 2);