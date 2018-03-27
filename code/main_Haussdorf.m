
clc; clear all; close all;
%%
groundPath  = 'Ground Truth\';
alg1 = 'alg1\';  % change for diff algo1,2,3,4,5,6

%Haussdorf distance will be computed for this threshold
threshold = 50;

algfiles = dir([alg1, '*.tif']);

%Prepare images
Imalg = imread([alg1, algfiles(1).name]);  %change for different images algfiles(1),(2),(3),(4)
Imalg = Imalg > threshold;

Imground = imread([groundPath, algfiles(1).name]);  %change for different ground images algfiles(1),(2),(3),(4)
Imground = (Imground > 0);

hausdIm12 = getHausDistance(Imalg, Imground)
