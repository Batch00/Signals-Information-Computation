load bach_fugue.mat

theVoices.noteNumbers;
theVoices.startPulses;
theVoices.durations;

bpm = 60;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat/4;
fs = 22050;

tt = [0:1/fs:250*seconds_per_pulse];
xx = zeros(size(tt));

num_voices = length(theVoices);

for k = 1:num_voices % loop over voices
    for idx = 1:length(theVoices(k).startPulses)
        tone = key2note(1,theVoices(k).noteNumbers(idx),theVoices(k).durations(idx)*seconds_per_pulse,fs); % note for voice k, start pulse i
        start_indx = ceil((theVoices(k).startPulses(idx)-1)*seconds_per_pulse*fs)+1; % start index of note
        stop_indx = start_indx + length(tone)-1; % stop index of note
        xx(start_indx:stop_indx) = xx(start_indx:stop_indx) + tone;
    end
end

bach = xx;
spectrogram(bach(500000:580000),2048,1600,8192,fs,'yaxis')
xlim([0,3])
ylim([0,2])
soundsc( xx, fs )