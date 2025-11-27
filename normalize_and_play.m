[Sound, Fs] = audioread("./SS_project_voice.m4a");
Sound = Sound(:,1); 
Sound = Sound /  max(abs(Sound));

sound(Sound, Fs) 

audiowrite("./Outputs/part1.m4a", Sound, Fs) 
