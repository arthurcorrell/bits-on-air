
function bhat = demodulate(r)

% we start with a noisy cosine with piecewise different frequencies tau_0
% and tau_1, each symbol of length tau_s

% the cosine has been sampled

% r - recieved signal
% f_0, f_1 - modulation frequency
% tau_s - period for each symbol (currently unitless)


fields = (load("data.mat"));


tau_0 = fields.tau0;
tau_1 = fields.tau1;
tau_s = fields.tauS;

% each divide tau_s, which is th number of indices for each symbol
f_0 = 1/tau_0;
f_1 =  1/ tau_1;


x_0 = cos( 2*p*f_0*x)
plot(x, x_0)
x_1 = cos(2*p*f_1*x);
plot(x, x_1)

%assuming perfect integer values of tau_s
assert(mod(tau_s/ tau_0, 2) == 0)
assert(mod(tau_s/ tau_1, 2) == 0)
%compute the scalar product with received signal r
% raw correlations
z0 = [];
z1 = [];


% total number of loop iterations (i = 5.89 -> i = 5)
iterations = floor( length(r) / tau_s );

for n = [0:1:iterations]

    t0 = (n - 1) * tau_s + 1;
    t1 = n * tau_s;

    % elementwise multiplication and summation
    z0_n = sum(  r(t0:t1) * x_0 );
    z0 = [z0, z0_n];

    z1_n = sum (    r(t0:t1) * x_1 );
    z1 = [z1, z1_n];

end
%difference between raw correlations
% compute difference z1 - z0
z_diff = z1-z0;

bhat = double(z_diff > 0);

assert(length(bhat) == floor(length(r)/tau_s));


end