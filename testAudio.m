t = 0:99;
signal = sin(2*pi*t*(1/50));
signal = repmat(signal, [1, 500]);

player = audioplayer(signal, 22044, 16);
recorder = audiorecorder(22044, 16, 1);

record(recorder);
playblocking(player);
stop(recorder);

received = getaudiodata(recorder)';

% --------------------------- %

figure(1);
subplot(2, 1, 1);
plot(signal(1:500));
title("Sent signal");

subplot(2, 1, 2);
plot(received(1:500));
title("Received signal");