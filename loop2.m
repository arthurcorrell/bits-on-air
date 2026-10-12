function loop2(N, p, rep, snr)

% N, p - generative parameters for the source
bits = source(N, p);

% rep - repetition encoding
bits_enc = repencode(bits, rep);

mod_bits = modulate_vectorized(bits_enc);

mod_bits = awgn(mod_bits, snr, bandpower(mod_bits));

rec_bits = demodulate(mod_bits);

bits_dec = repdecode(rec_bits, rep);

% error rate should be 0 without a channel!
BER = calcBER(bits, bits_dec);



end