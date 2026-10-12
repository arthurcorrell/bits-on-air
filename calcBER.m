function ber_N = calcBER(bit_sequence, channel_bit_sequence)
% Computes the bit error rate (BER) of the output compared to input

% PARAMS:
%   bit_sequence = bit sequence at input
%   channel_bit_sequence = bit sequence at output

N = size(bit_sequence, 2);
ber_N = (1/N) * sum( mod(bit_sequence - channel_bit_sequence, 2) );