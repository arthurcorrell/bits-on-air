function binary = text2binary(text)

binary = reshape(dec2bin(text, 8).'-'0',1,[]);