function audiodata = recordsound


recording = audiorecorder(22044, 16, 1, -1);
disp("Start recording, press any key to stop")
record(recording);
pause;
stop(recording);
disp("End of recording.")
audiodata = transpose(getaudiodata(recording));