function E = getADSR( notelength )

attack = linspace(0, 1.0, notelength*0.1);
decay = linspace(1.0, 0.9, notelength*0.1);
sustain = linspace(0.9, 0.8, notelength*0.65);
release = linspace(0.8, 0.0, notelength-length(attack)-length(decay)-length(sustain));

E = [attack,decay,sustain,release];

plot(1:notelength, E);
xlabel("Time");
ylabel("Amplitude");