function synced_bits = symbolsync(bits)

fields = (load("data.mat"));


%{
tau0 = fields.tau0;
tau1 = fields.tau1;
tauS = fields.tauS;
%}

f0 = 1/tau0;
f1 = 1/tau1;

% discrete bit sequence
n = length(bits);

% create two encodings
x = [1:1:tauS];
% create symbols
x0 = cos(2*pi*f0 * x); 
x1 = cos(2*pi*f1 * x);


% let's check for occurrence of [x0 x1], this bitflip is almost guaranteed
[phi, tau] = xcorr(bits, [x0 x1]);

[~, max_idx] = max(phi);

% the max idx is the first occurrence of where a bitflip occurs
start_cutoff = mod(max_idx, tauS)+1; % modulo to not truncate bits
synced_bits = bits(start_cutoff:end);

% make a clean end cutoff as well
num_symbols = floor(length(synced_bits) / tauS);
end_cutoff = num_symbols * tauS;
synced_bits = synced_bits(1:end_cutoff);

% all done! still contains noise, but is now partitioned into symbols for
% the demodulator


end
% PARAMS:
%   a = large vector with {-1, 1}
%   b = small vector with {-1, 1}

