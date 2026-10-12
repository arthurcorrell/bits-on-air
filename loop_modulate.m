function loop_modulate(loopsize,sequence_length,p,repeats,q)
% loop 1.0 with addition of modulate/demodulate

% PARAMS:
%   loopsize = number of loops to compute
%   sequence_length = length of initial bit sequence
%   p = probability that a given bit will be 0
%   repeats = number of repeats
%   q = probability of a bit flip

BER = [];
for i = [1:loopsize]
    bit_sequence = source(sequence_length,p);
    repeat_bit_sequence = repencode(bit_sequence,repeats);
    modulated_bit_sequence = modulate(repeat_bit_sequence);
    demodulated_bit_sequence = demodulate(modulated_bit_sequence);
    robust_bit_sequence = repdecode(demodulated_bit_sequence, repeats);
    a = drain(robust_bit_sequence);
    loop_array(i) = a(1);
    BER = [BER calcBER(robust_bit_sequence, bit_sequence)];
end
hist(loop_array, 1000);
BER = sum(BER)/loopsize;