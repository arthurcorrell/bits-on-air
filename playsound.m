function playsound(signal)


%player module that uses the audioplayer object  
% read some parameters for generating the audio
fields = (load("data.mat"));


tau0 = fields.tau0;
tau1 = fields.tau1;
tauS = fields.tauS;

f0 = 1/tau0;
f1 = 1/tau1;

% TODO: add a convention for Fs and nBits
% use default sample rate of audiorecorder object for now
Fs = 8000;
nBits = 8;


%find the correct output audio device
outDevices = audiodevinfo().output

% the device name is 'Speaker (Realtek(R) Audio) (Windows DirectSound)'
speakerName = 'Speakers (USB Audio Device) (Windows DirectSound)';
speakerID = 0;

% lets find the corresponding ID
for idx = [1:1:audiodevinfo(0)]
    if strcmp(outDevices(idx).Name, speakerName)
        speakerID = outDevices(idx).ID;
    end
end


%prepare the audioplayer object
player = audioplayer(signal, Fs, nBits, speakerID)

%now use object functions to play the associated signal
playblocking(player)



