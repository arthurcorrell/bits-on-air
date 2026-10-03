function ber_N = calcBER(bit_sequence, channel_bit_sequence)

% compute BER from bits from source and after going through BSC_channel
N = size(bit_sequence, 2);
ber_N = (1/N) * sum(  mod(bit_sequence - channel_bit_sequence, 2)  )

end