fields = (load("data.mat"));


tau0 = fields.tau0;
tau1 = fields.tau1;
tauS = fields.tauS;

f0 = 1/tau0;
f1 = 1/tau1;

% discrete bit sequence
B = [0 1 0 0 1]
n = length(B)

% extend bitsequence
bitmask = repelem(B, tauS);
% create two encodings
x = [1:1:tauS*n];

x0 = sin(2*pi*f0 * x); 
x1 = sin(2*pi*f1 * x);


modulated_bits = (x0.* (1-bitmask)) + (x1.* bitmask);

figure;
subplot(4, 1, 1);
plot(x, bitmask)
subplot(4, 1, 2);
plot(x, x0.* (1-bitmask))
subplot(4, 1, 3);
plot(x, x1.* (bitmask));
subplot(4, 1, 4);
plot(x, modulated_bits)