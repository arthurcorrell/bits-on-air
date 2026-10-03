function loop(loopsize, N, p, q)
% parameters:
% N - source bitsequence length, p - distribution of source bits
% q - ground truth bit error rate


% PART 1 - loop through different source bitsequences 
mu_arr = [];
sigma_arr = [];
for i = 1:1:loopsize
    bits = source(N, p);
    [mu_N, sigma_N] = drain(bits);

    mu_arr = [mu_arr mu_N];
    sigma_arr = [sigma_arr sigma_N];
end

figure;
subplot(5,1,1);
histogram(mu_arr);
xlabel('Mean');
ylabel('Frequency');
title(sprintf('Distribution of Sample Means for %.2f probability of 1', (1-p)));

subplot(5,1,2);
histogram(sigma_arr);
xlabel('Std');
ylabel('Frequency');
title(sprintf('Distribution of Sample Standard Deviations for %.2f probability of 1', (1-p)));

subplot(5,1,3);
x = [0.2:0.001:0.4];
y = gauss(x, mean(mu_arr), std(mu_arr));
plot(x, y);
title(sprintf('Predicted PDF of Sample Means for %.2f probability of 1', (1-p)));



% PART 2 - test full system
%source
bit_sequence = source(N, p);
%BSC channel
channel_bit_sequence = BSC_channel(bit_sequence, q);
% bit error rate- should approach q!!!
ber_N = calcBER(bit_sequence, channel_bit_sequence);
fprintf('Measured bit error rate: %.4f (target: %.4f)\n', ber_N, q);


% watch bit error rate converge for larger bit sequences of length N
ber_arr = [];
for i = 1:10:N
    bitSequence = source(i, p);
    channelBitSequence = BSC_channel(bitSequence, q);
    ber_i = calcBER(bitSequence, channelBitSequence);
    ber_arr = [ber_arr ber_i];
end

figure;
subplot(5,1,1);
plot([1:10:N], ber_arr);
title(sprintf('Bit Error Rate with ground truth BER %.2f', q));
xlabel('Sequence length N from source');
ylabel('Bit error Rate');


% plot bit error rate in dependance of repetition encoding length
bit_err_arr = [];
for i = 1:1:10
    bit_sequence = source(N, p);
    enc_bits = repencode(bit_sequence, i);
    channel_bit_sequence = BSC_channel(enc_bits, q);
    dec_bits = repdecode(channel_bit_sequence, i);
    bit_err_i = calcBER(bit_sequence, dec_bits);
    bit_err_arr = [bit_err_arr bit_err_i];
   
end

subplot(5,1,2);
plot([1:1:10], bit_err_arr);
title(sprintf('Bit Error Rate with ground truth BER %.2f', q));
xlabel('Repetition Encoding');
ylabel('Bit error Rate');


% for a repetition number, plot the bit error rate for higher and higher qs

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


end