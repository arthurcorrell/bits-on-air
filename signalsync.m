function offset = signalsync(a,b)
% Cross-correlates signals a and b, 
% whereby length(a)>>length(b)

% PARAMS:
%   a = large vector with {-1, 1}
%   b = small vector with {-1, 1}

[xc lags] = xcorr(a,b);
xc = xc(ceil(length(lags)/2):end);
plot(lags(ceil(length(lags)/2):end), xc);
[max_value offset] = max(xc);
offset = offset - 1;