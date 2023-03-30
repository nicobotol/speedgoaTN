close all
figure()
plot(tg.TimeLog, tg.OutputLog(:,1))

time = tg.TimeLog;        % time [s]
voltage = tg.OutputLog(:,1); % voltage [V]

T = table(time, voltage);

writetable(T,'tabledata5000.txt');


