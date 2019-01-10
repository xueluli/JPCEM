function pred = Label_Pred(D,Y,X,N_train,N_task,C)
%% ================== File info ==============================
% Description: Predict the label of the test sample
%% ================== end File info ==========================
r = [];
E = [];
for c = 1:C
range = N_train*N_task*(c-1)+1:N_train*N_task*(c-1)+N_train*N_task;
r{c} = Y-D(:,range)*X(range,:);
E(c) = sum(sum(r{c}.^2));
end
pred = find(E == min(E));
end