function enc_bits = repencode(bit_sequence, n)
% Encodes bit sequence with 'n' repetitions per bit

% PARAMS:
%   bit_sequence = bit sequence at input
%   n = number of repeats per bit

enc_bits = [];
for i = 1:size(bit_sequence, 2)
    enc_bits = [enc_bits, repmat(bit_sequence(i), 1, n)];
end


