function distribution = gauss(x, mu_N, sigma_N)
% Draws gaussian for mu_N and sigma_N

% PARAMS:
%   x = ??
%   mu_N = mean of bit sequence
%   sigma_N = standard deviation of bit sequence

distribution = (1 ./ (sigma_N * sqrt(2*pi))) .* exp(-0.5 .* ((x - mu_N) ./ sigma_N).^2);