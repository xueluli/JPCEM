%%%% Predict the label of a test image %%%%
%%% auther: Xuelu Li
%%% time: 03/27/2018
clear all;
close all;

%%  load data %%
addpath('../Programs/data');
load MWIR_multiView.mat;
listing = dir('../Programs/data/*.bmp');

%% form the test sample %%
X = 40;
Y = 20;

for i = 1:length(listing)
    I = imread(listing(i).name);
    I = imresize(I, [Y X]);
    T_sample(:,i) = I(:);
end
T_sample = normc(double(T_sample));
%% Predict %%
opt.lambda = 0.00002;
opt.Sigma = 0.018;
opt.Alpha = 1/9;
C = 10;
N_train = 5;
N_task = 5;

[pred,Xc] = JPCEM_pred(T_sample, Y_train, label_train, N_train, N_task, C, opt);
