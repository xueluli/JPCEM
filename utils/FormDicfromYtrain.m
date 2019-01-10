function [D, label_train] = FormDicfromYtrain(Y_train, label_train, N_train, N_task, C)
%% ================== File info ==============================
% N_train: Number of training images per class per view
% N_task: Number of tasks (views)
% Description: Randomly select datasamples from training data with respect ot N_train and N_task to form the
%               dictionary
%% ================== end File info ==========================
Y_train = normc(double(Y_train));
train_range = label_to_range(label_train);
[YY_train, label_Train]= PickDfromY_train(Y_train, train_range, N_train, label_train);
% Y_Test = normc(double(img));

clear Y_train;
clear label_train;

for c = 1:C
    Y_train(:,(c-1)*N_train*N_task+1:(c-1)*N_train*N_task+N_train*N_task) = YY_train(:,(c-1)*N_train*5+1:(c-1)*N_train*5+N_train*N_task);
    label_train(:,(c-1)*N_train*N_task+1:(c-1)*N_train*N_task+N_train*N_task) = label_Train(:,(c-1)*N_train*5+1:(c-1)*N_train*5+N_train*N_task);
end
D = Y_train;

