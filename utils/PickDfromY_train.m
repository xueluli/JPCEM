function [D, label_train] = PickDfromY_train(Y, Y_range, k, label_train0)
%% ================== File info ==============================
% Description: Randomly select datasamples from training data to form the
%               dictionary
%% ================== end File info ==========================
if nargin == 2
    Y_range = [0, Size(Y,2)];
end
C = numel(Y_range) - 1;
D = [];
label_train = [];
for i = 1:C
    range = Y_range(i) + 1 : Y_range(i+1);
    Yi = Y(:,range);
    LTi = label_train0(:,range);
    Ni = size(Yi,2);
    ids = randperm(Ni);
    D = [D, Yi(:,ids(1:k))];
    label_train = [label_train, LTi(:,ids(1:k))];
    
end