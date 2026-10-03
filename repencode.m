function enc_bits = repencode(bit_sequence, n)

% n- repetitions of each bit
enc_bits = [];
for i = 1:1:size(bit_sequence, 2)
    enc_bits = [enc_bits, repmat(bit_sequence(i), 1, n)];
end
end

