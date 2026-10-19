<<<<<<< HEAD
function audiodata = recordsound()


% TODO: add a convention for Fs and nBits
% use default sample rate of audiorecorder object for now
Fs = 8000;
nBits = 8;


%find the correct output audio device
inDevices = audiodevinfo().input

% the device name is 'Speaker (Realtek(R) Audio) (Windows DirectSound)'
micName = 'Microphone (USB Audio Device) (Windows DirectSound)';
micID = 1;

% lets find the corresponding ID
for idx = [1:1:audiodevinfo(1)]
    if strcmp(inDevices(idx).Name, micName)
        micID = inDevices(idx).ID;
    end
end


%prepare the audioplayer object
recorder = audiorecorder(Fs, nBits, 1, micID)

%now use object functions to play the associated signal
recordblocking(recorder, 5);


audiodata = getaudiodata(recorder)';

plot(audiodata)

