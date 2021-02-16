clear;
close all;
clc;


load data_hog_train;
load data_hog_testing;
load targets_train;
load targets_test;

net = patternnet(15);
net.trainFcn = 'trainbr';  
 
% Train the Network
[net,tr] = train(net,data_hog_train,targets_train);