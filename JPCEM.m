function [x] = JPCEM(y, A, lambda,Sigma,alpha)
% function x = JPCEM(A,lambda,Sigma,alpha)
% using reweighted_l1 method http://stanford.edu/~boyd/papers/pdf/rwl1.pdf
% -----------------------------------------------
% the reweighted_l1 method Author: Tiep Vu, thv102@psu.edu, 8/22/2016 2:07:22 PM
%                      (http://www.personal.psu.edu/thv102/)
% Modified by Xuelu Li on 05/01/2017 according to the paper
% X, Li and V, Monga, "Collaborative Sparse Priors for Infrared Image Multi-view ATR"
% and Renamed as JPCEM
% Input: 
% y: processed test data
% A: dictionary
% lambda, Sigma, alpha: parameters required for calculation (see the  paper for the details)
% Output:
% x: reconstructed sparse coefficient
% -----------------------------------------------
% addpath('SPAMS');
opts.pos = 1;
[d, k] = size(A);
w = ones(k, 1);
param.mode = 1;
param.lambda = lambda;
param.pos= opts.pos;
param.numThreads = 1;
param.L = size(A, 1);
max_iter = 100;
iter = 0;
eps = 0.000001;
u = zeros(k,1);
while iter < max_iter
%     iter
    iter = iter + 1;
    x = mexLassoWeighted(y,A,w,param);
    xm = max(abs(x));
    
    u = u+x;
    c = abs(x/(xm+alpha*xm));
    b = Sigma^2 * log(( (2*pi*Sigma^2)/lambda)  * ((1-c)./(c+eps) ).^2 );
    w = b./(abs(x)+eps);
    
    gamma =  (abs(x))./(abs(x)+eps);
    MajorElements = find( abs(gamma - 1 ) <0.5 );
end

xx = zeros(length(x), 1);
A_major = A(:, MajorElements);

k_major = size(A_major, 2);
ybar = [y; zeros(k_major, 1)];
Abar = [A_major; sqrt(lambda)*eye(k_major)];
xx(MajorElements) = pinv(Abar)*ybar;
x = full(xx);
