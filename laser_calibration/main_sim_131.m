% This file sets the parameters for the calibration of the laser

clear 
close all
clc

fs = 10e3;            % input sampling frequency [Hz]
ts = 1/fs;            % input sampling period [s]

stop_time = 20;       % simulation stop time [s]

% To run the simulation in matlab 2019a and earlier:
% 1) build model
% 2) Select 'External' on the 'Simulation mode' drop-down menu
% 3) Click 'Connect to target'
% 4) Run
