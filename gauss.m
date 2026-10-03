% draws gaussian for sigma_N and mu_N 

function distribution = gauss(x, mu_N, sigma_N)
    distribution = (1 ./ (sigma_N * sqrt(2*pi))) .* exp(-0.5 .* ((x - mu_N) ./ sigma_N).^2);
end