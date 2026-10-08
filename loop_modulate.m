function loop_modulate(loopsize, N, p)
% loop 1.0 with addition of modulate/demodulate

% PARAMS:
%   loopsize = number of loops to compute
%   N = length of initial bit sequence
%   p = probability that a given bit will be 0


bit_sequence = source(N, p);
enc_bits = repencode(bit_sequence, i);
channel_bit_sequence = BSC_channel(enc_bits, q);
dec_bits = repdecode(channel_bit_sequence, i);
bit_err_i = calcBER(bit_sequence, dec_bits);
bit_err_arr = [bit_err_arr bit_err_i];
   
subplot(5,1,2);
plot([1:1:10], bit_err_arr);
title(sprintf('Bit Error Rate with ground truth BER %.2f', q));
xlabel('Repetition Encoding');
ylabel('Bit error Rate');


% For a repetition number, plot the bit error rate for higher and higher qs
rep_num = 3;
max_error = 0.5;
bit_q_err_arr = [];

for q_err = max_error:-0.01:0.0
    bit_sequence = source(N, p);
    enc_bits = repencode(bit_sequence, rep_num);
    channel_bit_sequence = BSC_channel(enc_bits, q_err);
    dec_bits = repdecode(channel_bit_sequence, rep_num);
    bit_q_err = calcBER(bit_sequence, dec_bits);
    bit_q_err_arr = [bit_q_err_arr bit_q_err];

end

subplot(5,1,3);
plot([max_error:-0.01:0.0], bit_q_err_arr);
title(sprintf('BER with repetition number %.2f', rep_num));
xlabel('Channel Disturbance q');
ylabel('Bit error Rate');