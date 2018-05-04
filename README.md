# ANNMaster
Estimating net surface radiation by using ANN

sensitivity_met_data.txt:
1. X - date and time: 2017-08-03 00:00:00 to 2017-09-08 23:30:00
2. Rl_downwell - Longwave incoming radiation in W/m^2
3. AT_mbar - Atmospheric pressure in mbar
4. Rs_downwell - Shortwave incoming radiation in W/m^2
5. rH - Relative humidity in %
6. T_b_1477 - Air temperature in degree Celsius at 10m height
7. D_g_1477 - Wind direction in degree
8. F_1_s_g_1477 - Wind speed in m/s
9. Rnet - Net surface radiation in W/m^2


The goal is to estimate Rnet. 
Assumption is that tiff files contain information related to Rnet.

Simple perceptron:
https://machinelearningmastery.com/implement-perceptron-algorithm-scratch-python/

Free Datasets:
https://archive.ics.uci.edu/ml/datasets.html

