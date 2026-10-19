function text = binary2text(binary)

bits = reshape(binary, 8, []).';
text = transpose(char(bits * (2.^(7:-1:0)).'));