[Sound, Fs] = audioread("./SS_project_voice.m4a");
Sound = Sound(:,1);
Sound = Sound /  max(abs(Sound));
n = length(Sound);

targetFS = [40, 20, 10, 5, 2, 1] * 1000;
DownSampled = {};

for i = 1:length(targetFS)
    newFs = targetFS(i);
    K = newFs / Fs;
    [N,D] = rat(K, 0.001);
    indices = find(mod(0:n-1,D)<N);
    DownSampled{end+1} = Sound(indices);
end

index = 2;
sound(DownSampled{index}, targetFS(index))
