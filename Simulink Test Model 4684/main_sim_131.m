% This file sets the parameters for the test case and runs the simulation

clear 
close all
clc

fs = 10e3;            % input sampling frequency [Hz]
ts = 1/fs;            % input sampling period [s]

sin_base_freq = 1;    % output signal frequency [Hz]
ampl = 1;             % output signal amplitude [V]

stop_time = 5;       % simulation stop time [s]

% To run the simulation in matlab 2019a and earlier:
% 1) build model
% 2) Select 'External' on the 'Simulation mode' drop-down menu
% 3) Click 'Connect to target'
% 4) Run
