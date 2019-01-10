function [pred,Xc] = JPCEM_pred(Y_Test, Y_train, label_train, N_train, N_task, C, opt)
%% ================== File info ==============================
% Description: Predict the label of the test data
% pred: the predicted label
% Xc: reconstructed coefficients
%% ================== end File info ==========================

addpath('utils')
%% form dictionary %%

[D, ~] = FormDicfromYtrain(Y_train, label_train, N_train, N_task, C);

%% parameter %%
lambda = opt.lambda;
Sigma = opt.Sigma;
alpha = opt.Alpha;

Xc = zeros(size(D,2),N_task);
%% sparse reconstruct %%
for t = 1:N_task
    y_it = Y_Test(:,t);
    x_it = JPCEM(y_it,D,lambda,Sigma,alpha);
    Xc(:,t) = x_it;
end
%% predict %%
pred = Label_Pred(D,Y_Test,Xc,N_train,N_task,C);

end