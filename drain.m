function [mu_N sigma_N] = drain(bit_sequence)
% Calculates the mean and standard deviation of bitsequence

% PARAMS:
%   bit_sequence = bit sequence at input

mu_N = mean(bit_sequence);
sigma_N = std(bit_sequence);