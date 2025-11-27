[Sound, Fs] = audioread("./SS_project_voice.m4a"); 
Sound = Sound(:,1);
Sound = Sound /  max(abs(Sound));

speed = 2;
sound(Sound, Fs*speed);
