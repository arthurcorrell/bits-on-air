% input - noisy bit signal and known start and end codes
% output - truncated, synchronized siganl


function sync_bits = framesync(rx_signal, start_code, end_code)
% FRAME_SYNC Synchronizes a received bitstream by locating a start and end code.
% 
% Inputs:
%   rx_signal  - Noisy received bitstream (vector of 0s and 1s)
%   start_code - Preamble bit sequence (vector of 0s and 1s)
%   end_code   - Postamble bit sequence (vector of 0s and 1s)
%
% Output:
%   sync_bits  - Truncated payload bits between the start and end codes

% Helper function to map [0, 1] bits to [-1, 1] for effective cross-correlation
polar_nrz = @(b) (b .* 2) - 1;

polar_sig = polar_nrz(rx_signal);

% --- 1. Locate the Start Code (Preamble) ---
[phi_start, ~] = xcorr(polar_sig, polar_nrz(start_code));

% Truncate negative shift values
phi_start = phi_start(length(rx_signal):end);

% The index of the maximum cross-correlation is the start of the preamble
[~, start_idx] = max(phi_start);

% The actual data payload starts immediately after the start_code
payload_start_idx = start_idx + length(start_code);

% --- 2. Locate the End Code (Postamble) ---
[phi_end, ~] = xcorr(polar_sig, polar_nrz(end_code));

% Truncate negative shift values
phi_end = phi_end(length(rx_signal):end);

% To prevent falsely matching a sequence inside the noise or preamble, 
% we ignore any peaks that occur before the payload actually begins
phi_end(1:payload_start_idx-1) = -Inf;

% The index of the maximum cross-correlation is the start of the postamble
[~, end_idx] = max(phi_end);

% The payload ends right before the end code begins
payload_end_idx = end_idx - 1;

% --- 3. Extract the Synchronized Payload ---
% Truncate everything outside the bounds of the actual data
if payload_start_idx <= payload_end_idx
    sync_bits = rx_signal(payload_start_idx : payload_end_idx);
else
    warning('Frame synchronization failed: End code found before start code.');
    sync_bits = [];
end
end