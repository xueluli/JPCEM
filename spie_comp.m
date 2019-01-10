%%%%%%% Statistical Comparison results %%%%%%%%%%%%%%%%%%%%
%%%%%%% Author: Xuelu Li %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Time: 12/18/2017 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Algorithms include: 
%%%%%%% Graph-based Multiview Classification Method (GMCM)
%%%%%%% Joint SRC method (JSRC)
%%%%%%% Joint Dynamic SRC method (JDSRC)
%%%%%%% Joint SRC method (JSRC)
%%%%%%% Joint Prior and Coefficient Estimation Method (JPCEM)


clear all;
close all;

load AccDiffViews.mat;
load AccNormal.mat;
load AccDiffTrain.mat;

%% Different training size %%
for i = 1:5
    AccDiffTrains(i,:) = AccDiffTrain(2*i,:); 
end
N_train = 2:2:10;
figure;
plot(N_train,AccDiffTrains(:,3),'^-','LineWidth',2);
hold on;
plot(N_train,AccDiffTrains(:,2),'rd-','LineWidth',2);
plot(N_train,AccDiffTrains(:,4),'yo-','LineWidth',2);
plot(N_train,AccDiffTrains(:,1),'g*-','LineWidth',2);
grid on;
Tr = legend('JPCEM','JSRC','JDSRC','GMCM','Location','SouthEast');
Tr.FontSize = 12;
Tr.FontWeight = 'bold';
% xlabel('No. of training images per class per view','FontSize',10,'FontWeight','bold','Color','k');
% ylabel('Classification Accuracy','FontSize',10,'FontWeight','bold','Color','k');


%% Exploring selection bias %%
[mu1,sigma1] = normfit(AccNormal(:,1));
[mu2,sigma2] = normfit(AccNormal(:,2));
[mu4,sigma4] = normfit(AccNormal(:,4));
[mu3,sigma3] = normfit(AccNormal(:,3));
x = 0.65:0.001:1.02;
pd1 = fitdist(AccNormal(:,1),'Normal');
pd2 = fitdist(AccNormal(:,2),'Normal');
pd4 = fitdist(AccNormal(:,4),'Normal');
pd3 = fitdist(AccNormal(:,3),'Normal');

norm1 = pdf(pd1,x);
norm2 = pdf(pd2,x);
norm4 = pdf(pd4,x);
norm3 = pdf(pd3,x);

figure,
plot(x,norm3/100,'LineWidth',2);
hold on;
plot(x,norm2/100,'r','LineWidth',2);
plot(x,norm4/100,'y','LineWidth',2);
plot(x,norm1/100,'g','LineWidth',2);

Tn = legend('JPCEM','JSRC','JDSRC','GMCM','Location','NorthWest');
Tn.FontSize = 12;
Tn.FontWeight = 'bold';
% xlabel('Accuracy','FontSize',10,'FontWeight','bold','Color','k');
% ylabel('Normal distribution','FontSize',10,'FontWeight','bold','Color','k');
axis([0.65 1.01 0 0.5]);

%% Different views %%
% app = AccDiffViews;
% figure,
% c = {'1 view';'2 views';'3 views';'4 views';'5 views'};
% x = [1:5];
% bar(x,app);
% set(gca, 'FontSize', 10);
% set(gca,'XTickLabel',c,'FontWeight','bold');
% Tv = legend('GMCM','JSRC','JPCEM','JDSRC','Location','best');
% Tv.FontSize = 15;
% Tv.FontWeight = 'bold';
N_view = 1:5;
figure;
plot(N_view,AccDiffViews(1:5,3),'^-','LineWidth',2);
hold on;
plot(N_view,AccDiffViews(1:5,2),'rd-','LineWidth',2);
plot(N_view,AccDiffViews(1:5,4),'yo-','LineWidth',2);
plot(N_view,AccDiffViews(1:5,1),'g*-','LineWidth',2);
grid on;
Tr = legend('JPCEM','JSRC','JDSRC','GMCM','Location','SouthEast');
Tr.FontSize = 12;
Tr.FontWeight = 'bold';
% xlabel('No. of views','FontSize',10,'FontWeight','bold','Color','k');
% ylabel('Classification Accuracy','FontSize',10,'FontWeight','bold','Color','k');