[Sound, Fs] = audioread("./SS_project_voice.m4a"); 
Sound = Sound(:,1);
Sound = Sound /  max(abs(Sound));
n = length(Sound);

speed = 2;
FrameDropped = {};

N_min = 1000;
N_max = 10000;

for N = N_min:1000:N_max
    frames = {};
    for i=1:N:n
        frames{end+1} = Sound(i:min(i+N-1, n));
    end
    FrameDropped{end+1} = vertcat(frames{1:speed:end});
end

for i=1:10
    audiowrite(sprintf("./Outputs/Part3_3_N=%d.m4a", i*1000), FrameDropped{i}, Fs);
end
