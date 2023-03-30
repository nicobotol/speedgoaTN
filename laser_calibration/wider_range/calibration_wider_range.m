%% Calibration of sensor ILD1320
close all
clc

%% Set up
dist = [5000 300 1000 2000 800 100 3000 4000 7000 6000 8000]; % distances for calibration [m^-5]
samples = length(dist);                 % number of sample distances

% time to use for average the response (at the beginning and at the end of
% the test)
time_avg_start = 4;                     % [s]                   
time_avg_stop = 4;                      % [s]

%% Load data
names = cell(1, samples);               % names of the files where data are stored
h = zeros(samples, 1);                  % voltage level high [V]
l = zeros(samples, 1);                  % voltage level low [V]
for i = 1:samples
    name = ['tabledata', num2str(dist(i)) ,'.txt'];
    data = readmatrix(name);
    delta_t = mean(diff(data(2:end, 1)));   % avg. sample time [s]
    samples_start = time_avg_start/delta_t; % sample to use at the beginning
    samples_stop = time_avg_stop/delta_t;   % sample to use in the end
    h(i) = mean(data(2:samples_start, 2));  % avg. voltage high [V]
    l(i) = mean(data(end-samples_stop:end, 2)); % avg. voltage low [V]
end

delta = h - l;          % differential voltag [V]

%% Linear regression
A = ones(samples,2);
A(:, 1) = delta;

B = dist'/100;

% linear regression with pseudo-invere approach
% coeff(1) -> slope [mm/V]
% coeff(2) -> offset [mm]
coeff = A'*A\A'*B; 

%% Plot of the results
voltage = min(delta)-0.5:0.1:max(delta)+0.5; % [V]
reg = coeff(1)*voltage + coeff(2);           % regression [mm]

figure()
plot(voltage, reg, '--', 'LineWidth', 2)
hold on
plot(delta, dist/100, 'o', 'LineWidth', 5, 'MarkerSize', 3);
grid on
ylabel('Length [mm]', 'FontSize', 15)
xlabel('\Delta V [V]', 'FontSize', 15)
title('Calibration curve ILD1320', 'FontSize', 20)
legend('Linear regression', 'Data', 'location', 'northwest', 'FontSize', 10)