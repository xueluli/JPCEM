%%%%% Producing training and test images for multi-view situation %%%%%
%%%%% Author: Xuelu Li %%%%%
%%%%% Time: 12/17/2017 %%%%%
%%%%% The label of a image is defined as 'ABC', 'A' is the view number in [1
%%%%% 2 3 4 5], 'BC' is the class number in [01, 02, 03, ... , 10]

clear all;
close all;
%% Select and resize images %%
N_class = 10; % No. of classes
N_image = 254; % No. of images randomly selected from each class
N_task = 5; % No. of tasks
                                                                                                                                                                                                                                                    
X = 40;
Y = 20;

Y_train = zeros(X*Y,N_image/2*N_class*N_task); % training data
Y_test = zeros(X*Y,N_image/2*N_class*N_task); % test data
label_train = zeros(1,N_image/2*N_class*N_task); % training label
label_test = zeros(1,N_image/2*N_class*N_task); % test label

foldername1 = sprintf('../Multiview SRC');
list_f1 = dir(foldername1);

for i = 1:N_class
    for j = 1:N_task
        foldername2 = list_f1(j+5).name;
        list_f2 = dir(foldername2);
        foldername3 = list_f2(i+2).name;
        fullpath = fullfile(foldername2,foldername3);
        list_bmp = dir(fullfile(fullpath,'*.bmp'));
        filename = {list_bmp.name};
        file_select = datasample(filename,N_image,'Replace',false);
        for p = 1:N_image
            img_name = fullfile(list_f1(j+5).name,list_f2(i+2).name,file_select(p));
            img = imread(img_name{1});
            % figure,
            % imshow(img);
            img = imresize(img, [Y X]);
            img = img(:);
            if p<N_image/2+1 % The former 127 images each view each class are used as training data
                Y_train(:,(i-1)*N_task*N_image/2+(j-1)*N_image/2+p) = img;
                label_train((i-1)*N_task*N_image/2+(j-1)*N_image/2+p) = str2double([num2str(j),foldername3(1:2)]);
            end
            if p>N_image/2 % The latter 127 images each view each class are used as test data
                Y_test(:,(i-1)*N_task*N_image/2+(j-1)*N_image/2+p-N_image/2) = img;
                label_test((i-1)*N_task*N_image/2+(j-1)*N_image/2+p-N_image/2) = str2double([num2str(j),foldername3(1:2)]);
            end
        end
    end
end
save('MWIR_multiView.mat','label_train','label_test','Y_test','Y_train'); % save all the data as "MWIR_multiview.mat"