%%%%%%% Demo for classification using JPCEM %%%%%%%
%%%%%%% Author: Xuelu Li %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Time: 12/18/2017 %%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;

%% Import data %%
addpath('data');
load MWIR_multiView.mat;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% In order to decrease the test time in this demo, we reduce the number of test images
%%% per view per class from 127 to 50 (Not necessary if time is enough)
C = 10; %%% number of classes
NumberTest = 50; %%% reduced number of test images per view per class

YY_test = Y_test;
label_Test = label_test;
for cc = 1:C*5 %%% 5 is the number of views in our database
    Y_test5(:,(cc-1)*NumberTest+1:(cc-1)*NumberTest+NumberTest) = YY_test(:,(cc-1)*127+1:(cc-1)*127+NumberTest);
    label_test5(:,(cc-1)*NumberTest+1:(cc-1)*NumberTest+NumberTest) = label_Test(:,(cc-1)*127+1:(cc-1)*127+NumberTest);
end
Y_test = Y_test5;
label_test = label_test5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% In all our experiments, the required parameters are set as below %%%%%
opt.lambda = 0.00002;
opt.Sigma = 0.018;
opt.Alpha = 1/9;
%% Exploring selection bias %%
N = 1; % number of repeated experiments
N_train = 5; % selected number of training images per view per class
N_task = 5; % selected number of views 

accNormal = zeros(1,N);
for n = 1:N
    accNormal(n) = JPCEM_wrapper(N_task, N_train, C, Y_test, label_test, Y_train,label_train, opt);
end

figure,
[mu1,sigma1] = normfit(accNormal);
pd1 = fitdist(accNormal,'Normal');
norm1 = pdf(pd1,x);
x = 0.65:0.001:1.02;
plot(x,norm1/100,'LineWidth',2);

Tn = legend('GMCM','JSRC','JDSRC','JPCEM','Location','best');
Tn.FontSize = 20;
Tn.FontWeight = 'bold';
%% Different number of views %%
N_train = 5;
N_task = 5;
accViews = zeros(1,N_task);
for n = 1:N_task 
    accViews(n) = JPCEM_wrapper(n, N_train, C, Y_test, label_test, Y_train,label_train, opt);
end

figure,
c = {'1 view';'2 views';'3 views';'4 views';'5 views'};
x = [1:5];
bar(x,app);

Tv = legend('GMCM','JSRC','JPCEM','JDSRC','Location','best');
Tv.FontSize = 20;
Tv.FontWeight = 'bold';
%% Different number of training images %%
N_train = 10; % selected number of training images per view per class
N_task = 5; % selected number of views 

accTrain = zeros(1,N_train);
for n = 2:N_train
    
    accTrain(n) = JPCEM_wrapper(N_task, n, C, Y_test, label_test, Y_train,label_train, opt);
end

figure;
N_train = 2:10;
plot(N_train,accTrain(2:10),'^-','LineWidth',2);
Tr = legend('JPCEM','Location','best');
Tr.FontSize = 20;
Tr.FontWeight = 'bold';

