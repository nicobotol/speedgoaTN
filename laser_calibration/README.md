# Laser sensor calibration
Workflow for calibrate the laser sensor:

1. main_sim_131.m 		to set the simulation parameters
2. speedgoat_test_IO131.slx 	to build and deploy the program on the target machine
3. plot_signal.m 		to save the output voltage in a .txt file. Please set the file name as 'tabledataXXX.txt', where XXX is the calibration length in mm*10^-2 (i.e. if the reference 			length is 5 [mm] the name would be 'tabledata500.txt')
4. move the output file in the folder 'smaller_range' or 'wider_range' according to which laser is under study
5. calibration_smaller_range.m / calibration_wider_range.m in order to perform the calibration. Please report the length used in the calibration inside these files

 
