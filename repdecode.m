function dec_bits = repdecode(enc_bits, n)
% Decode an n-repetition code using majority vote.

dec_bits = [];
for i = 1:n:size(enc_bits,2)
    block = enc_bits([i:1:i+n-1]);
    val = (1/n)*sum(block) > 0.5;
    dec_bits = [dec_bits val];
end