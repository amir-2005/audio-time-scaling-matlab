[Sound, Fs] = audioread("./SS_project_voice.m4a"); 
Sound = Sound(:,1);
Sound = Sound /  max(abs(Sound));
n = length(Sound);

K = 0.5;
[N,D] = rat(K, 0.001);
indices = find(mod(0:n-1,D)<N);
DownSampled = Sound(indices);

sound(DownSampled, Fs)
