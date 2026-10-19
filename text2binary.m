function bitsequence = text2binary(filename)

fid = fopen(filename, 'r');
bytes = fread(fid, Inf, 'uint8');
fclose(fid);
bitsequence = reshape(dec2bin(bytes, 8).'-'0',1,[]);