function [acc] = JPCEM_wrapper(N_task, N_train, C, Y_test, label_test, Y_train, label_train, opt)
% Function: calculate classification accuracy using Joint Prior and
% Coefficient Estimation Method (JPCEM)
% Reference paper: X, Li and V, Monga, "Collaborative Sparse Priors for Infrared Image Multi-view ATR"
% Input:
% N_task: No. of different views from the same class
% N_train: No. of training images per view per class
% C: No. of classes
% Y_test: test data
% label_test: labels of test data
% Y_train: training data
% label_train: labels of training data
% opt: parameter needed for calculation (see the paper for details)
% opt.lambda
% opt.Sigma
% opt.Alpha
% Output:
% acc: classification accuracy
% -----------------------------------------------
% Author: Xuelu Li, xul76@psu.edu, 12/18/2017
%         (http://www.personal.psu.edu/xul76/)
% -----------------------------------------------

addpath('utils')
%%%%%%% ========== Preprocessing the dataset ========== %%%%%%%
% [D, ~] = FormDicfromYtrain(Y_train, label_train, N_train, N_task, C);
% Y_train = normc(double(Y_train));
% train_range = label_to_range(label_train);
% [YY_train, label_Train]= PickDfromY_train(Y_train, train_range, N_train, label_train);
Y_Test = normc(double(Y_test));
label_Test = label_test;

% clear Y_train;
% clear label_train;
clear Y_test;
clear label_test;
% N_task = n;
Range = label_to_range(label_Test);
NumberTest = Range(2);
% for c = 1:C
%     Y_train(:,(c-1)*N_train*N_task+1:(c-1)*N_train*N_task+N_train*N_task) = YY_train(:,(c-1)*N_train*5+1:(c-1)*N_train*5+N_train*N_task);
%     label_train(:,(c-1)*N_train*N_task+1:(c-1)*N_train*N_task+N_train*N_task) = label_Train(:,(c-1)*N_train*5+1:(c-1)*N_train*5+N_train*N_task);
% end
for c = 1:C
    Y_test(:,(c-1)*NumberTest*N_task+1:(c-1)*NumberTest*N_task+NumberTest*N_task) = Y_Test(:,(c-1)*NumberTest*5+1:(c-1)*NumberTest*5+NumberTest*N_task);
    label_test(:,(c-1)*NumberTest*N_task+1:(c-1)*NumberTest*N_task+NumberTest*N_task) = label_Test(:,(c-1)*NumberTest*5+1:(c-1)*NumberTest*5+NumberTest*N_task);
end


N_test = length(label_test)/N_task;
for i = 1:N_test
    for t = 1:N_task
        Y{i}(:,t) = Y_test(:,(t-1)*N_test/C+...
            floor((i-1)*C/N_test)*N_test/C*N_task+...
            i-floor((i-1)*C/N_test)*N_test/C);
        label_Y(i) = ceil(i*C/N_test);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% lambda = opt.lambda;
% Sigma = opt.Sigma;
% Alpha = opt.Alpha;

N_test = length(label_Y);
% D = Y_train;
%     DtD = D1'*D1;
for i = 1:N_test
    Percentage = [num2str(i) '/' num2str(N_test)]
%     X2{i} = [];
%     for t = 1:N_task
%         y_it = Y{i}(:,t);
%         x_it2 = JPCEM(y_it,D,lambda,Sigma,Alpha);
%         X2{i}(:,t) = x_it2;
%     end
%     r2 = [];
%     E2 = [];
% %     for c = 1:C
% %         range = N_train*N_task*(c-1)+1:...
% %             N_train*N_task*(c-1)+N_train*N_task;
% %         r2{c} = Y{i}-D(:,range)*X2{i}(range,:);
% %         E2(c) = sum(sum(r2{c}.^2));
% %     end
% %     pred(i) = find(E2 == min(E2));
%    pred(i) = Label_Pred(D,Y{i},X2{i},N_train,N_task,C);
   [pred(i),~] = JPCEM_pred(Y{i}, Y_train, label_train, N_train, N_task, C, opt);
end
acc = calc_acc(pred, label_Y);

end
